package com.saber.springjdbc.main;

import com.saber.springjdbc.config.AppConfig;
import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.services.CityService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class MainApp {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        CityService cityService = context.getBean(CityService.class);
//        City city = new City();
//        city.setName("ardebil");
//        city.setCreatedAt(Timestamp.from(Instant.now()));
//        city.setUpdatedAt(Timestamp.from(Instant.now()));
//        city.setStatusCode(Constants.StatusCode.ACTIVE.getValue());
//        City store = cityService.store(city);
//        System.out.println(store);

//        City city = cityService.get(2L);
//        System.out.println(city);
        List<City> cities = cityService.getAll();
        System.out.println(cities);
    }
}
