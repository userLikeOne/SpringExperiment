package com.dxf.mapper;

import com.dxf.beans.Website;

import java.util.List;

public interface BaseMapper<T> {
    List<T> getAll();
    List<T> get(String name);
    int save(T value);
    int edit(T value);
    int delete(int[] ids);
    int increment(int id);
    int decrement(int id);
    int getCount();
}
