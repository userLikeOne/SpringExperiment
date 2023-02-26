package com.dxf.service.impl;

import com.dxf.beans.User;
import com.dxf.mapper.UserMapper;
import com.dxf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public int decrement(int id) {
        return userMapper.decrement(id);
    }

    @Override
    public int incrementAccess(int id) {
        return userMapper.incrementAccess(id);
    }

    @Override
    public int incrementNum(int id) {
        return userMapper.incrementNum(id);
    }

}
