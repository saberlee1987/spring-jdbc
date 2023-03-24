package com.saber.springjdbc.services.impl;

import com.saber.springjdbc.common.exceptions.ResourceNotFoundException;
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
        checkExistById(city.getId());
        city = cityRepository.update(city);
        if (city == null){
            throw new RuntimeException("can not update city");
        }
        return city;
    }

    @Override
    public City get(Long id) {
        return cityRepository.get(id);
    }

    @Override
    public City getByName(String name) {
        checkExistByName(name);
        return cityRepository.getByName(name);
    }

    @Override
    public List<City> getAll() {
        return cityRepository.getAll();
    }

    @Override
    public boolean delete(Long id) {
        checkExistById(id);
        return cityRepository.delete(id);
    }

    @Override
    public boolean checkExistById(Long id) {
        boolean result = cityRepository.checkExistById(id);
        if (!result) {
            throw new ResourceNotFoundException(String.format("city for id %s does not exist", id));
        }
        return result;
    }

    @Override
    public boolean checkExistByName(String name) {
        boolean result = cityRepository.checkExistByName(name);
        if (!result) {
            throw new ResourceNotFoundException(String.format("city for name %s does not exist", name));
        }
        return result;
    }
}
