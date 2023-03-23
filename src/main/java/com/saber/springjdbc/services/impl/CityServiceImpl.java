package com.saber.springjdbc.services.impl;

import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.repositories.CityRepository;
import com.saber.springjdbc.services.CityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CityServiceImpl implements CityService {
    private final CityRepository cityRepository;

    public CityServiceImpl(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    @Override
    public City store(City city) {
       return cityRepository.store(city);
    }

    @Override
    public City update(City city) {
        return null;
    }

    @Override
    public City get(Long id) {
        return cityRepository.get(id);
    }

    @Override
    public List<City> getAll() {
        return cityRepository.getAll();
    }

    @Override
    public boolean delete(City city) {
        return false;
    }
}
