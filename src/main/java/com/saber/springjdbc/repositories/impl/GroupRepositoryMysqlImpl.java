package com.saber.springjdbc.repositories.impl;

import com.saber.springjdbc.common.Constants;
import com.saber.springjdbc.common.GroupRowMapper;
import com.saber.springjdbc.entity.Group;
import com.saber.springjdbc.repositories.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
@Repository(value = "groupRepositoryMysqlImpl")
public class GroupRepositoryMysqlImpl implements GroupRepository {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private SimpleJdbcInsert jdbcInsert;

    @PostConstruct
    public void init(){
        jdbcInsert = new SimpleJdbcInsert(dataSource).withTableName("groups")
                .usingGeneratedKeyColumns("id");
    }

    @Override
    public Group store(Group group) {
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("name",group.getName());
        parameterSource.addValue("statusCode",group.getStatusCode());
        parameterSource.addValue("createdAt",group.getCreatedAt());
        parameterSource.addValue("updatedAt",group.getUpdatedAt());
        parameterSource.addValue("deletedAt",group.getDeletedAt());
        Number returnKey = jdbcInsert.executeAndReturnKey(parameterSource);
        group.setId(returnKey.longValue());
        return group;
    }

    @Override
    public Group update(Group group) {
        MapSqlParameterSource sqlParameterSource = new MapSqlParameterSource("name", group.getName());
        sqlParameterSource.addValue("id",group.getId());
        sqlParameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        sqlParameterSource.addValue("updatedAt", group.getUpdatedAt());
        int update = namedParameterJdbcTemplate.update("update groups set name=:name , updated_at=:updatedAt where ID=:id and status_code=:statusCode"
                , sqlParameterSource);
        if (update>0)
            return group;
        throw new RuntimeException("can not update user");
    }

    @Override
    public Group get(Long id) {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id",id);
        return namedParameterJdbcTemplate.queryForObject("select * from groups where status_code=:statusCode and id=:id", parameterSource, new GroupRowMapper());
    }

    @Override
    public List<Group> getAll() {
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        return namedParameterJdbcTemplate.query("select * from groups where status_code=:statusCode", parameterSource, new GroupRowMapper());
    }

    @Override
    public boolean delete(Long id) {
        boolean result = false;
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.DE_ACTIVE.getValue());
        parameterSource.addValue("deletedAt", Timestamp.from(Instant.now()));
        parameterSource.addValue("id",id);
        int affectedRow = namedParameterJdbcTemplate.update("update groups set status_code=:statusCode ,deleted_at=:deletedAt where ID=:id ", parameterSource);
        if (affectedRow>0)
            result = true;
        return result;

    }

    @Override
    public boolean checkExistById(Long id) {
        boolean result = false;
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("id",id);
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from groups where status_code=:statusCode and id=:id", parameterSource, Long.class);
        if (count!=null && count>0){
            result = true;
        }
        return result;
    }

    @Override
    public boolean checkExistByName(String name) {
        boolean result = false;
        MapSqlParameterSource parameterSource =new MapSqlParameterSource();
        parameterSource.addValue("statusCode", Constants.StatusCode.ACTIVE.getValue());
        parameterSource.addValue("name",name);
        Long count = namedParameterJdbcTemplate.queryForObject("select count(*) from groups where status_code=:statusCode and name=:name", parameterSource, Long.class);
        if (count!=null && count>0){
            result = true;
        }
        return result;
    }

}
