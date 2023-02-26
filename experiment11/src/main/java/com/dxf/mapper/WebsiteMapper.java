package com.dxf.mapper;

import com.dxf.beans.Website;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface WebsiteMapper extends BaseMapper<Website>{
    int increment(@Param("id") int id, @Param("date") Date date);
    List<Website> getAll(@Param("start") int start, @Param("count") int count);
    List<Website> getByIds(int[] ids);
}
