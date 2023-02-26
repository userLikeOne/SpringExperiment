package com.dxf.service;

import com.dxf.beans.User;

import java.util.List;

public interface UserService {
    List<User> getAll();

    int decrement(int id);

    int incrementAccess(int id);
    int incrementNum(int id);
}
