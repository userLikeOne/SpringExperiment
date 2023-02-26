package com.dxf.service;

import com.dxf.beans.Page;
import com.dxf.beans.Website;

import java.util.List;

public interface WebsiteService {
    Page getAll(Page page);
    List<Website> get(String name);
    int save(Website value);
    int edit(Website value);
    int delete(int[] ids);
    int increment(int webId,int userId);

    List<Website> getByIds(int[] ids);
}
