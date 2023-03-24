package com.saber.springjdbc.common;

import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.entity.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet resultSet, int rowNum) throws SQLException {
        User user=new User();
        user.setId(resultSet.getLong("id"));
        user.setName(resultSet.getString("name"));
        user.setUsername(resultSet.getString("username"));
        user.setPassword(resultSet.getString("password"));
        City city = new City();
        city.setId(resultSet.getLong("city_id"));
        user.setCity(city);
        user.setStatusCode(resultSet.getByte("status_code"));
        user.setCreatedAt(resultSet.getTimestamp("created_at"));
        user.setUpdatedAt(resultSet.getTimestamp("updated_at"));
        user.setDeletedAt(resultSet.getTimestamp("deleted_at"));
        return user;
    }
}
