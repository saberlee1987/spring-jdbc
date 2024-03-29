package com.saber.springjdbc.services.impl;

import com.saber.springjdbc.common.exceptions.ResourceNotFoundException;
import com.saber.springjdbc.entity.User;
import com.saber.springjdbc.repositories.UserRepository;
import com.saber.springjdbc.services.UserService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(@Qualifier(value = "userRepositoryMySqlImpl") UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User store(User user) {
       return userRepository.store(user);
    }

    @Override
    public User storeByProcedure(User user) {
        //return userRepository.storeByProcedure(user);
//        return userRepository.storeByProcedure2(user);
        return userRepository.storeByProcedure3(user);
    }

    @Override
    public User update(User user) {
        checkExistById(user.getId());
        return userRepository.update(user);
    }

    @Override
    public User get(Long id) {
       checkExistById(id);
       return userRepository.get(id);
    }

    @Override
    public List<User> getAll() {
        return userRepository.getAll();
    }

    @Override
    public boolean delete(Long id) {
        checkExistById(id);
        return userRepository.delete(id);
    }

    @Override
    public boolean checkExistById(Long id) {
        boolean result = userRepository.checkExistById(id);
        if (!result) {
            throw new ResourceNotFoundException(String.format("user for id %s does not exist", id));
        }
        return result;
    }

    @Override
    public boolean checkExistByUsername(String username) {
        boolean result = userRepository.checkExistByUsername(username);
        if (!result) {
            throw new ResourceNotFoundException(String.format("user for username %s does not exist", username));
        }
        return result;
    }

    @Override
    public User getByUsername(String username) {
        checkExistByUsername(username);
        return userRepository.getByUsername(username);
    }
}
