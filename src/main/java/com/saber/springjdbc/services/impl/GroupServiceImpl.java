package com.saber.springjdbc.services.impl;

import com.saber.springjdbc.common.exceptions.ResourceNotFoundException;
import com.saber.springjdbc.entity.Group;
import com.saber.springjdbc.repositories.GroupRepository;
import com.saber.springjdbc.services.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GroupServiceImpl implements GroupService {

    @Autowired
    @Qualifier(value = "groupRepositoryMysqlImpl")
    private GroupRepository groupRepository;

    @Override
    public Group store(Group group) {
        return groupRepository.store(group);
    }

    @Override
    public Group update(Group group) {
        checkExistById(group.getId());
        return groupRepository.update(group);
    }

    @Override
    public Group get(Long id) {
        checkExistById(id);
        return groupRepository.get(id);
    }

    @Override
    public List<Group> getAll() {
        return groupRepository.getAll();
    }

    @Override
    public boolean delete(Long id) {
        checkExistById(id);
        return groupRepository.delete(id);
    }

    @Override
    public boolean checkExistById(Long id) {
        boolean result = groupRepository.checkExistById(id);
        if (!result) {
            throw new ResourceNotFoundException(String.format("group for id %s does not exist", id));
        }
        return result;
    }

    @Override
    public boolean checkExistByName(String name) {
        boolean result = groupRepository.checkExistByName(name);
        if (!result) {
            throw new ResourceNotFoundException(String.format("user for name %s does not exist", name));
        }
        return result;
    }
}
