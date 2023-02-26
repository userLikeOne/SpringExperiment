package com.dxf.service.impl;

import com.dxf.beans.Page;
import com.dxf.beans.Website;
import com.dxf.mapper.TypeMapper;
import com.dxf.mapper.UserMapper;
import com.dxf.mapper.WebsiteMapper;
import com.dxf.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class WebSiteServiceImpl implements WebsiteService {
    @Autowired
    WebsiteMapper websiteMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    TypeMapper typeMapper;

    @Override
    public Page getAll(Page page) {
        List<Website> all = websiteMapper.getAll((page.getCurrentPage() - 1) * page.getMaxRowsPerPage(), page.getMaxRowsPerPage());
        page.setData(all);
        int count = websiteMapper.getCount();
        if(count%page.getMaxRowsPerPage()==0){
            page.setTotalPages(count/page.getMaxRowsPerPage());
        } else {
            page.setTotalPages(count/page.getMaxRowsPerPage()+1);
        }
        page.setTotalRows(count);
        return page;
    }

    @Override
    public List<Website> get(String name) {
        return null;
    }

    @Override
    public int save(Website value) {return websiteMapper.save(value);}

    @Override
    public int edit(Website value) {
        return 0;
    }

    @Override
    public int delete(int[] ids) {
        return websiteMapper.delete(ids);
    }

    @Override
    public int increment(int webId,int userId) {
        Date date = new Date();
        websiteMapper.increment(webId,date);
        userMapper.incrementAccess(userId);
        return 1;
    }

    @Override
    public List<Website> getByIds(int[] ids) {
        return websiteMapper.getByIds(ids);
    }
}
