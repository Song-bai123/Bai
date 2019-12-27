package com.it.controller;

import com.it.bean.address_city;
import com.it.service.addCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class addCityController {
    @Autowired
    private addCityService addCityService;

    @RequestMapping("/addCity")
    @ResponseBody
    public List<address_city> addressCityList (Integer provincecode){
        List<address_city> addCityL = addCityService.addCity(provincecode);
        return addCityL;
    }
}
