package com.saber.springjdbc.repositories.impl;

import com.saber.springjdbc.common.Constants;
import com.saber.springjdbc.common.UserRowMapper;
import com.saber.springjdbc.entity.User;
import com.saber.springjdbc.repositories.UserRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.object.GenericStoredProcedure;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "userRepositoryMySqlImpl")
public class UserRepositoryMySqlImpl implements UserRepository {

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private final JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall simpleJdbcCall;
    private final DataSource dataSource;

    public UserRepositoryMySqlImpl(NamedParameterJdbcTemplate namedParameterJdbcTemplate, JdbcTemplate jdbcTemplate, DataSource dataSource) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
        this.jdbcTemplate = jdbcTemplate;
        this.dataSource = dataSource;
        simpleJdbcCall = new SimpleJdbcCall(dataSource);
    }

    @Override
    public User store(User user) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        MapSqlParameterSource sqlParameterSource = new MapSqlParameterSource("name", user.getName());
        sqlParameterSource.addValue("username", user.getUsername());
        sqlParameterSource.addValue("password", user.getPassword());
        sqlParameterSource.addValue("citId", user.getCity().getId());
        sqlParameterSource.addValue("statusCode", user.getStatusCode());
        sqlParameterSource.addValue("createdAt", user.getCreatedAt());
        sqlParameterSource.addValue("updatedAt", user.getUpdatedAt());
        int affectedRow = namedParameterJdbcTemplate.update("insert into users (name,username,password,city_id,status_code,created_at,updated_at) values (:name,:username,:password,:citId,:statusCode,:createdAt,:updatedAt)"
                , sqlParameterSource, keyHolder, new String[]{"id"});

        if (affectedRow > 0) {
            Number number = keyHolder.getKey();
            if (number != null)
                user.setId(number.longValue());
            return user;
        } else
            throw new RuntimeException("can not insert user");
    }

    @Override
    public User storeByProcedure(User user) {
        Map<String, Object> result = jdbcTemplate.call(con -> {
            CallableStatement callableStatement = con.prepareCall("call registerPerson(?,?,?,?,?,?)");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getUsername());
            callableStatement.setString(3, user.getPassword());
            callableStatement.setLong(4, user.getCity().getId());
            callableStatement.setByte(5, user.getStatusCode());
            callableStatement.registerOutParameter(6, Types.BIGINT);
            return callableStatement;
        }, List.of(
                new SqlParameter("u_name", Types.VARCHAR),
                new SqlParameter("u_username", Types.VARCHAR),
                new SqlParameter("u_password", Types.VARCHAR),
                new SqlParameter("u_cityId", Types.BIGINT),
                new SqlParameter("u_statusCode", Types.TINYINT),
                new SqlOutParameter("u_reg_status", Types.BIGINT)
        ));

        Long id = Long.parseLong(String.valueOf(result.get("u_reg_status")));
        user.setId(id);
        return user;
    }

    @Override
    public User storeByProcedure2(User user) {
        simpleJdbcCall.withProcedureName("registerPerson").declareParameters(
                new SqlParameter("u_name", Types.VARCHAR),
                new SqlParameter("u_username", Types.VARCHAR),
                new SqlParameter("u_password", Types.VARCHAR),
                new SqlParameter("u_cityId", Types.BIGINT),
                new SqlParameter("u_statusCode", Types.TINYINT),
                new SqlOutParameter("u_reg_status", Types.BIGINT)
        );
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("u_name", user.getName());
        parameterSource.addValue("u_username", user.getUsername());
        parameterSource.addValue("u_password", user.getPassword());
        parameterSource.addValue("u_cityId", user.getCity().getId());
        parameterSource.addValue("u_statusCode", user.getStatusCode());

        Map<String, Object> result = simpleJdbcCall.execute(parameterSource);
        Long id = Long.parseLong(String.valueOf(result.get("u_reg_status")));
        user.setId(id);
        return user;
    }

    @Override
    public User storeByProcedure3(User user) {
        StoredProcedure storedProcedure = new GenericStoredProcedure();
        storedProcedure.setDataSource(dataSource);
        storedProcedure.setFunction(false);
        storedProcedure.setSql("registerPerson");
        SqlParameter[] sqlParameters = {
                new SqlParameter("u_name", Types.VARCHAR),
                new SqlParameter("u_username", Types.VARCHAR),
                new SqlParameter("u_password", Types.VARCHAR),
                new SqlParameter("u_cityId", Types.BIGINT),
                new SqlParameter("u_statusCode", Types.TINYINT),
                new SqlOutParameter("u_reg_status", Types.BIGINT)
        };
        storedProcedure.setParameters(sqlParameters);

        //compile storeProcedure
        storedProcedure.compile();

        Map<String,Object> parameterSource = new HashMap<>();
        parameterSource.put("u_name", user.getName());
        parameterSource.put("u_username", user.getUsername());
        parameterSource.put("u_password", user.getPassword());
        parameterSource.put("u_cityId", user.getCity().getId());
        parameterSource.put("u_statusCode", user.getStatusCode());

        Map<String, Object> result = storedProcedure.execute(parameterSource);
        Long id = Long.parseLong(String.valueOf(result.get("u_reg_status")));
        user.setId(id);
        return user;
    }

    @Override
    public User update(User user) {
        MapSqlParameterSource sqlParameterSource = new MapSqlParameterSource("name", user.getName());
        sqlParameterSource.addValue("id", user.getId());
        sqlParameterSource.addValue("username", user.getUsername());
        sqlParameterSource.addValue("password", user.getPassword());
        sqlParameterSource.addValue("cityId", user.getCity().getId());
        sqlParameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        sqlParameterSource.addValue("updatedAt", user.getUpdatedAt());
        int update = namedParameterJdbcTemplate.update("update users set NAME=:name , USERNAME=:username, PASSWORD=:password , CITY_ID=:cityId, UPDATED_AT=:updatedAt where ID=:id and status_code=:statusCode"
                , sqlParameterSource);
        if (update > 0)
            return user;
        throw new RuntimeException("can not update user");
    }

    @Override
    public User get(Long id) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id", id);
        return namedParameterJdbcTemplate.queryForObject("select * from users where id=:id and status_code=:statusCode",
                parameterSource, new UserRowMapper());
    }

    @Override
    public List<User> getAll() {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        return namedParameterJdbcTemplate.query("select * from USERS where status_code=:statusCode", parameterSource, new UserRowMapper());
    }

    @Override
    public boolean delete(Long id) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id", id);
        boolean result = false;
        int affectedRow = namedParameterJdbcTemplate.update("delete from CITIES where ID=:id and status_code=:statusCode", parameterSource);
        if (affectedRow > 0)
            result = true;
        return result;
    }

    @Override
    public boolean checkExistById(Long id) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id", id);
        boolean result = false;
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from users where id=:id and status_code=:statusCode", parameterSource, Long.class);
        if (count != null && count > 0) {
            result = true;
        }
        return result;
    }

    @Override
    public boolean checkExistByUsername(String username) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("username", username);
        boolean result = false;
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from users where USERNAME=:username and status_code=:statusCode", parameterSource, Long.class);
        if (count != null && count > 0) {
            result = true;
        }
        return result;
    }

    @Override
    public User getByUsername(String username) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("username", username);
        return namedParameterJdbcTemplate.queryForObject("select * from users where username=:username and status_code=:statusCode",
                parameterSource, new UserRowMapper());
    }
}
