package com.dxf.service.impl;

import com.dxf.beans.Type;
import com.dxf.mapper.TypeMapper;
import com.dxf.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    TypeMapper typeMapper;

    @Override
    public List<Type> getAll() {
        return typeMapper.getAll();
    }

    @Override
    public int increment(int id) {
        return typeMapper.increment(id);
    }

    @Override
    public int decrement(int id) { return typeMapper.decrement(id); }
}
