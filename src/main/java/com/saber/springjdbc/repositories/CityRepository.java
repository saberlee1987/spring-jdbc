package com.saber.springjdbc.repositories;

import com.saber.springjdbc.entity.City;

import java.util.List;

public interface CityRepository {
    City store(City city);
    City update(City city);
    City get(Long id);
    List<City> getAll();
    boolean delete(City city);
}
