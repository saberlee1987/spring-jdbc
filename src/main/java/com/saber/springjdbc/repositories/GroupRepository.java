package com.saber.springjdbc.repositories;

import com.saber.springjdbc.entity.Group;

import java.util.List;

public interface GroupRepository {
    Group store(Group group);
    Group update(Group group);
    Group get(Long id);
    List<Group> getAll();
    boolean delete(Long id);
    boolean checkExistById(Long id);
    boolean checkExistByName(String name);
}