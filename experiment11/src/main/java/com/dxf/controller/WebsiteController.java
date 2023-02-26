package com.dxf.controller;

import com.dxf.beans.Page;
import com.dxf.beans.Type;
import com.dxf.beans.User;
import com.dxf.beans.Website;
import com.dxf.service.TypeService;
import com.dxf.service.UserService;
import com.dxf.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/website")
@Controller
public class WebsiteController {
    @Autowired
    WebsiteService websiteService;

    @Autowired
    TypeService typeService;

    @Autowired
    UserService userService;

    @RequestMapping("getAll.json")
    @ResponseBody
    public Page getAllJson(Page page){
        Page page1 = websiteService.getAll(page);
        return page1;
    }

    @RequestMapping("visitView")
    public String visitView(Website website){
        int webId = website.getId();
        int userId = website.getUser().getId();
        websiteService.increment(webId,userId);
        String url = website.getUrl();
        return "redirect:"+url;
    }

    @RequestMapping("saveView")
    public String saveView(Model model){
        List<Type> tList = typeService.getAll();
        List<User> uList = userService.getAll();
        model.addAttribute("tList",tList);
        model.addAttribute("uList",uList);
        return "save";
    }

    @RequestMapping("save.do")
    public String saveDo(Website website){
        Date date = new Date();
        website.setCreate_date(date);
        websiteService.save(website);
        userService.incrementNum(website.getCreate_user_id());
        typeService.increment(website.getType_id());
        return "redirect:/";
    }

    @RequestMapping("delete.do")
    public String deleteDo(int[] ids){
        List<Website> websites = websiteService.getByIds(ids);
        //为了避免创作者id有重复的现象，所以不能使用 in在dao层直接自减 只能循环调用
        for (Website website : websites) {
            userService.decrement(website.getCreate_user_id());
            typeService.decrement(website.getType_id());
        }
        websiteService.delete(ids);
        return "index";
    }

}
