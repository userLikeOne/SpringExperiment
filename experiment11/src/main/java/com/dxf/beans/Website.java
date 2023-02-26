package com.dxf.beans;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Website {
    int id;
    String name;
    String url;
    int type_id;
    int access_num;
    Date last_access_date;
    Date create_date;
    int create_user_id;
    Type type;
    User user;
}
