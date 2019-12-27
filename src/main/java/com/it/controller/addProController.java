package com.it.controller;

import com.it.bean.address_province;
import com.it.service.addProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class addProController {
    @Autowired
    private addProService addProService;

    @RequestMapping("seleaddPro")
    @ResponseBody
    public List<address_province> seleaddPro(){
        List<address_province> ll = addProService.addPro();
        return ll;
    }
}
