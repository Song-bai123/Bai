package com.it.controller;

import com.it.bean.address_town;
import com.it.service.addTownService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class addTownController {
    @Autowired
    private addTownService addTownService;

    @ResponseBody
    @RequestMapping("/addTown")
    public List<address_town> add(Integer citycode){
        List<address_town> addXian = addTownService.addTo(citycode);
        return addXian;
    }
}
