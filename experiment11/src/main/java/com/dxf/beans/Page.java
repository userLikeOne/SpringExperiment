package com.dxf.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Page {
    int currentPage = 1; // 当前页（查询条件）
    int rowsPerPage = 5;  // 每页显示的记录条数（查询条件）
    int maxRowsPerPage = 5; // 每页最多显示的记录条数
    int totalRows; // 总记录数
    int totalPages; // 总页数
    int visiblePageLinks = 5; // 最多显示几个卡片
    List data; //分页查询的实体数据
}
