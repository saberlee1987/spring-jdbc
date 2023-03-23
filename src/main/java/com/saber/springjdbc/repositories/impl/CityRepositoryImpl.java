package com.saber.springjdbc.repositories.impl;

import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.repositories.CityRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CityRepositoryImpl implements CityRepository {

    private final JdbcTemplate jdbcTemplate;

    public CityRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public City store(City city) {
        String insertSql = "insert into cities (id,name,status_code,created_at,updated_at) values(SEQ_CITY.nextval,?,?,?,?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement statement = connection.prepareStatement(insertSql, new String[]{"id"});
            statement.setString(1, city.getName());
            statement.setByte(2, city.getStatusCode());
            statement.setTimestamp(3, city.getCreatedAt());
            statement.setTimestamp(4, city.getUpdatedAt());
            return statement;
        }, keyHolder);
        Number id = keyHolder.getKey();
        city.setId(id != null ? id.longValue() : null);
        return city;
    }

    @Override
    public City update(City city) {
        return null;
    }

    @Override
    public City get(Long id) {
        List<City> cities = jdbcTemplate.query("select * from cities where id = ?", this::getCity, id);
        if (cities.size() == 1)
            return cities.get(0);
        return null;
    }

    @Override
    public List<City> getAll() {
       return jdbcTemplate.query("select * from cities", this::getCity);
    }

    @Override
    public boolean delete(City city) {
        return false;
    }

    private City getCity(ResultSet resultSet, int rowNum) throws SQLException {
        City city = new City();
        city.setId(resultSet.getLong("id"));
        city.setName(resultSet.getString("name"));
        city.setStatusCode(resultSet.getByte("status_code"));
        city.setCreatedAt(resultSet.getTimestamp("created_at"));
        city.setUpdatedAt(resultSet.getTimestamp("updated_at"));
        city.setDeletedAt(resultSet.getTimestamp("deleted_at"));
        return city;
    }
}
