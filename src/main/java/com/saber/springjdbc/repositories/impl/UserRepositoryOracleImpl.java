package com.saber.springjdbc.repositories.impl;

import com.saber.springjdbc.common.Constants;
import com.saber.springjdbc.common.UserRowMapper;
import com.saber.springjdbc.entity.User;
import com.saber.springjdbc.repositories.UserRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

@Repository(value = "userRepositoryOracleImpl")
public class UserRepositoryOracleImpl implements UserRepository {

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public UserRepositoryOracleImpl(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
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
        int affectedRow = namedParameterJdbcTemplate.update("insert into users (id,name,username,password,city_id,status_code,created_at,updated_at) values (SEQ_USER.nextval,:name,:username,:password,:citId,:statusCode,:createdAt,:updatedAt)"
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
    public User update(User user) {
        MapSqlParameterSource sqlParameterSource = new MapSqlParameterSource("name", user.getName());
        sqlParameterSource.addValue("id",user.getId());
        sqlParameterSource.addValue("username", user.getUsername());
        sqlParameterSource.addValue("password", user.getPassword());
        sqlParameterSource.addValue("cityId", user.getCity().getId());
        sqlParameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        sqlParameterSource.addValue("updatedAt", user.getUpdatedAt());
        int update = namedParameterJdbcTemplate.update("update users set NAME=:name , USERNAME=:username, PASSWORD=:password , CITY_ID=:cityId, UPDATED_AT=:updatedAt where ID=:id and  status_code=:statusCode"
                , sqlParameterSource);
        if (update>0)
            return user;
        throw new RuntimeException("can not update user");
    }

    @Override
    public User get(Long id) {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id",id);
        return namedParameterJdbcTemplate.queryForObject("select * from users where id=:id and status_code=:statusCode",
                parameterSource, new UserRowMapper());
    }

    @Override
    public List<User> getAll() {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        return namedParameterJdbcTemplate.query("select * from USERS where status_code=:statusCode",new UserRowMapper());
    }

    @Override
    public boolean delete(Long id) {
        boolean result = false;
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.DE_ACTIVE.getValue());
        parameterSource.addValue("deletedAt", Timestamp.from(Instant.now()));
        parameterSource.addValue("id",id);
        int affectedRow = namedParameterJdbcTemplate.update("update users set status_code=:statusCode ,deleted_at=:deletedAt where ID=:id ", parameterSource);
        if (affectedRow>0)
            result = true;
        return result;
    }

    @Override
    public boolean checkExistById(Long id) {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id",id);
        boolean result = false;
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from users where id=:id and status_code=:statusCode", parameterSource, Long.class);
        if (count != null && count > 0) {
            result = true;
        }
        return result;
    }

    @Override
    public boolean checkExistByUsername(String username) {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("username",username);
        boolean result = false;
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from users where USERNAME=:username and status_code=:statusCode", parameterSource, Long.class);
        if (count != null && count > 0) {
            result = true;
        }
        return result;
    }

    @Override
    public User getByUsername(String username) {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("username",username);
        return namedParameterJdbcTemplate.queryForObject("select * from users where username=:username and status_code=:statusCode",
                parameterSource, new UserRowMapper());
    }
}
