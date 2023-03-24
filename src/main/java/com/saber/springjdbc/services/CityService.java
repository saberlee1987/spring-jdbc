package com.saber.springjdbc.services;

import com.saber.springjdbc.entity.City;

import java.util.List;

public interface CityService {
    City store(City city);
    City update(City city);
    City get(Long id);
    City getByName(String name);
    List<City> getAll();
    boolean delete(Long id);
    boolean checkExistById(Long id);
    boolean checkExistByName(String name);
}
