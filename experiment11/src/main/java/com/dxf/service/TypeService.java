package com.dxf.service;

import com.dxf.beans.Type;

import java.util.List;

public interface TypeService {
    List<Type> getAll();

    int increment(int id);

    int decrement(int id);
}
