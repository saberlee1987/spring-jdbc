package com.saber.springjdbc.services;

import com.saber.springjdbc.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService  {
    User store(User user);
    User storeByProcedure(User user);
    User update(User user);
    User get(Long id);
    List<User> getAll();
    boolean delete(Long id);
    boolean checkExistById(Long id);
    boolean checkExistByUsername(String username);
    User getByUsername(String username);
}
