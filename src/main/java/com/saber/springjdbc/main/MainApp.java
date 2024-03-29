package com.saber.springjdbc.main;

import com.saber.springjdbc.common.Constants;
import com.saber.springjdbc.config.AppConfig;
import com.saber.springjdbc.entity.City;
import com.saber.springjdbc.entity.Group;
import com.saber.springjdbc.entity.User;
import com.saber.springjdbc.services.CityService;
import com.saber.springjdbc.services.GroupService;
import com.saber.springjdbc.services.UserService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.sql.Timestamp;
import java.time.Instant;

public class MainApp {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

        CityService cityService = context.getBean(CityService.class);

        UserService userService = context.getBean(UserService.class);

        City newTehran = cityService.getByName("newTehran");
        User user = new User();
        user.setCity(newTehran);
        user.setName("ali");
        user.setUsername("ali77");
        user.setPassword("AdminAli77");
        user.setStatusCode(Constants.StatusCode.ACTIVE.getValue());
        user.setCreatedAt(Timestamp.from(Instant.now()));
        user.setUpdatedAt(Timestamp.from(Instant.now()));
        user = userService.storeByProcedure(user);

        System.out.println("result procedure ===> " + user);

//        GroupService groupService = context.getBean(GroupService.class);
//
//        Group group = groupService.get(1L);
//        System.out.println("group ===> "+group);
//        group.setName("group clt 1");
//        groupService.update(group);
//        group = groupService.get(1L);
//        System.out.println("group ===> "+group);
//
//        groupService.delete(1L);
//
//        group = groupService.get(1L);
//        System.out.println("group ===> "+group);

//        Group group = new Group();
//        group.setName("group clt");
//        group.setStatusCode(Constants.StatusCode.ACTIVE.getValue());
//        group.setCreatedAt(Timestamp.from(Instant.now()));
//        group.setUpdatedAt(Timestamp.from(Instant.now()));
//        group = groupService.store(group);
//
//        System.out.println("group ===> "+group);

//        List<User> users = userService.getAll();
//        System.out.println(users);
        //User user = userService.getByUsername("saber66");
//        User user = userService.get(7L);
//        Long cityId= user.getCity().getId();
//        City city = cityService.get(cityId);
//        user.setCity(city);
//
//        System.out.println(user);
//        user.setName("bruce");
//        user.setUsername("bruce40");
//        user.setPassword("AdminBruce40");
//        user =userService.update(user);
//        user.setUpdatedAt(Timestamp.from(Instant.now()));
//        System.out.println("user update ===> "+user);

//
//        City city = cityService.getByName("newTehran");
//
//        User user = new User();
//        user.setName("saber");
//        user.setUsername("saber66");
//        user.setPassword("AdminSaber66");
//        user.setStatusCode(Constants.StatusCode.ACTIVE.getValue());
//        user.setCity(city);
//        user.setCreatedAt(Timestamp.from(Instant.now()));
//        user.setUpdatedAt(Timestamp.from(Instant.now()));
//        user = userService.store(user);
//        System.out.println("insert new user ===> "+user);


//        CityService cityService = context.getBean(CityService.class);
//        City city = new City();
//        city.setName("tehran");
//        city.setCreatedAt(Timestamp.from(Instant.now()));
//        city.setUpdatedAt(Timestamp.from(Instant.now()));
//        city.setStatusCode(Constants.StatusCode.ACTIVE.getValue());
//        City store = cityService.store(city);
//        System.out.println(store);

//        City city = cityService.get(2L);
//        System.out.println(city);
//        List<City> cities = cityService.getAll();
//        System.out.println(cities);

//        Long id = 2L;
//        boolean exist = cityService.checkExistById(id);
//        System.out.printf("result for id %s ===> %s%n",id,exist);
//
//        City tehran = cityService.getByName("tehran");
//        System.out.println("city ===> "+ tehran);
//        tehran.setName("newTehran");
//        City newTehran = cityService.update(tehran);
//        System.out.println(newTehran);
//
//        City city = cityService.getByName("newTehran");
//        System.out.println(city);
//

//        id = 4L;
//        exist = cityService.checkExistById(id);
//        System.out.printf("result for id %s ===> %s%n",id,exist);
//
//        City tehran = cityService.getByName("tehran");
//        System.out.println("city tehran ==> "+tehran);
////
    /*    City karaj = cityService.getByName("karaj");
        System.out.println("city karaj ==> "+karaj);

        boolean delete = cityService.delete(karaj.getId());
        System.out.printf("result for delete id %s ===> %s%n",karaj.getId(),delete);*/


    }
}
