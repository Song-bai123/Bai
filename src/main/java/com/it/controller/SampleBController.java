package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.it.dao.Sample;
import com.it.service.SampleBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class SampleBController {
    @Autowired
    private SampleBService sampleBService;

    private static final  Integer SIZE = 2;
    @RequestMapping("/SampleB")
    public String findMH(Model model, @RequestParam(value = "pageNum",defaultValue = "1",required = false)Integer pageNum,
                          String sampleId,String wuranluv,String year,String month,String day,String toxin_type,String crop_species,
                          String province,String city,String county){
        Map<String,Object> map = new HashMap<String, Object>();
        String inputtime = "";
         if (!"0".equals(year) && year!=null){ //有年无月
             if ("0".equals(month)){
                 inputtime = year;
             }else if(month.length()==1){ //有年有单月
                 inputtime = year + "-0" + month;
                 if (!"0".equals(day) && day.length()==1){
                     inputtime = inputtime + "-0" + day;
                 }else if (day.length()==2){
                     inputtime = inputtime + "-" + day;
                 }
             }else {
                 inputtime = year + "-" + month;
                 if (!"0".equals(day) && day.length()==1){
                     inputtime = inputtime + "-0" + day;
                 }else if (day.length()==2){
                     inputtime = inputtime + "-" + day;
                 }
             }
         }

        map.put("sampleId",sampleId);
        map.put("toxin_type",toxin_type);
        map.put("crop_species",crop_species);
        map.put("province",province);
        map.put("city",city);
        map.put("county",county);
        PageHelper.startPage(pageNum,SIZE);
        System.out.println(inputtime);
        return null;
    }
}
