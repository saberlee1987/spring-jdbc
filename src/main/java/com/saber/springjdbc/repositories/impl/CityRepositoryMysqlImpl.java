package com.saber.springjdbc.repositories.impl;

import com.saber.springjdbc.common.Constants;
import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.repositories.CityRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Date;
import java.util.List;

@Repository(value = "cityRepositoryMysqlImpl")
public class CityRepositoryMysqlImpl implements CityRepository {

    private final JdbcTemplate jdbcTemplate;

    public CityRepositoryMysqlImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public City store(City city) {
        String insertSql = "insert into cities (name,status_code,created_at,updated_at) values(?,?,?,?)";
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
        int update = jdbcTemplate.update("update CITIES set NAME=? , UPDATED_AT=? where ID=? and status_code=?",
                city.getName(), new Date(), city.getId(),Constants.StatusCode.ACTIVE.getValue());
        if (update > 0)
            return city;
        return null;
    }

    @Override
    public City get(Long id) {
        List<City> cities = jdbcTemplate.query("select * from cities where id = ? and status_code=?", this::getCity, id,Constants.StatusCode.ACTIVE.getValue());
        if (cities.size() == 1)
            return cities.get(0);
        return null;
    }

    @Override
    public List<City> getAll() {
        return jdbcTemplate.query("select * from cities where status_code=?", this::getCity,Constants.StatusCode.ACTIVE.getValue());
    }

    @Override
    public boolean delete(Long id) {
        return jdbcTemplate.update("update cities set status_code=? ,deleted_at=? where ID=? ", Constants.StatusCode.DE_ACTIVE.getValue(), Timestamp.from(Instant.now()),id) > 0;
    }

    @Override
    public boolean checkExistById(Long id) {
        boolean result = false;
        Long count = jdbcTemplate.queryForObject("select count(*) from cities where id=? and status_code=?", Long.class, id,Constants.StatusCode.ACTIVE.getValue());
        if (count != null && count > 0)
            result = true;
//        return jdbcTemplate.queryForObject("select count(*) from cities where id=?", new Object[]{id}, Integer.class) > 0;

        return result;
    }

    @Override
    public boolean checkExistByName(String name) {
        boolean result = false;
        Long count = jdbcTemplate.queryForObject("select count(*) from cities where name=? and status_code=?", Long.class, name,Constants.StatusCode.ACTIVE.getValue());
        if (count != null && count > 0)
            result = true;
        return result;
    }

    @Override
    public City getByName(String name) {
        return jdbcTemplate.queryForObject("select * from cities where name=? and status_code=?", this::getCity, name,Constants.StatusCode.ACTIVE.getValue());
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
