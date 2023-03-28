package com.saber.springjdbc.common;

import com.saber.springjdbc.entity.Group;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GroupRowMapper implements RowMapper<Group> {
    @Override
    public Group mapRow(ResultSet resultSet, int rowNum) throws SQLException {
        Group group=new Group();
        group.setId(resultSet.getLong("id"));
        group.setName(resultSet.getString("name"));
        group.setStatusCode(resultSet.getByte("status_code"));
        group.setCreatedAt(resultSet.getTimestamp("created_at"));
        group.setUpdatedAt(resultSet.getTimestamp("updated_at"));
        group.setDeletedAt(resultSet.getTimestamp("deleted_at"));
        return group;
    }
}
