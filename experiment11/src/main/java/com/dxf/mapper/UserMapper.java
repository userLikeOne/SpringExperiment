package com.dxf.mapper;

import com.dxf.beans.User;

public interface UserMapper extends BaseMapper<User>{
    int incrementAccess(int id);
    int incrementNum(int id);
}
