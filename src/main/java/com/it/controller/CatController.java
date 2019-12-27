package com.it.controller;

import com.it.bean.crop_category;
import com.it.service.CatService;
import com.it.service.CspeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CatController {
    @Autowired
    private CatService catService;

    @RequestMapping("/showAllCropCategory")
    @ResponseBody
    public List<crop_category> showAllCropCategory(){
        List<crop_category> listl = catService.cat();
        return listl;
    }

}
