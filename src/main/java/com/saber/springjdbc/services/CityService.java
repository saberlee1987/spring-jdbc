package com.saber.springjdbc.services;

import com.saber.springjdbc.entity.City;

import java.util.List;

public interface CityService {
    City store(City city);
    City update(City city);
    City get(Long id);
    List<City> getAll();
    boolean delete(City city);
}
