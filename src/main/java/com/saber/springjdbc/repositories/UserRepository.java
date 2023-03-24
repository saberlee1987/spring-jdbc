package com.saber.springjdbc.repositories;

import com.saber.springjdbc.entity.User;

import java.util.List;

public interface UserRepository {
    User store(User user);
    User update(User user);
    User get(Long id);
    List<User> getAll();
    boolean delete(Long id);
    boolean checkExistById(Long id);
    boolean checkExistByUsername(String username);
    User getByUsername(String username);
}
