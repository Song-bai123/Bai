package com.it.controller;

import com.it.bean.crop_species;
import com.it.service.CspeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CspeController {
    @Autowired
    private CspeService cspeService;

    @RequestMapping("getCropSpecies")
    @ResponseBody
    public List<crop_species> getCropSpecies(Integer csCropCategoryId){
        List<crop_species> list1 = cspeService.cspe(csCropCategoryId);
        return list1;
    }
}
