package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.bean.bacterial_strain_info;
import com.it.bean.sample_info;
import com.it.bean.sample_toxin;
import com.it.bean.sample_toxin_info;
import com.it.service.SampieService;
import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SampleController {
    @Autowired
    private SampieService sampieService;

    private static final Integer SIZE = 2;

    @RequestMapping("/Sample")
    public String findById(Model model, @RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum,
                           String sampleId, String year, String month, String day, String toxinType, String csCropSpecies,
                           String province, String city, String county, String pollutionRate) {

        Map<String, Object> map = new HashMap<String, Object>();
        String inputtime = "";
        if (year != null && !"0".equals(year)) {
            if ("0".equals(month)) {
                inputtime = year;
            } else if (month.length() == 1) {
                inputtime = year + "-0" + month;
                if (!"0".equals(day) && day.length() == 1) {
                    inputtime = inputtime + "-0" + day;
                } else if (!"0".equals(day) && day.length() == 2) {
                    inputtime = inputtime + "-" + day;
                }
            } else {
                inputtime = year + "-" + month;
                if (!"0".equals(day) && day.length() == 1) {
                    inputtime = inputtime + "-0" + day;
                } else if (!"0".equals(day) && day.length() == 2) {
                    inputtime = inputtime + "-" + day;
                }
            }
        }
        // System.out.println(inputtime);
        map.put("inputtime", inputtime);
        if (pollutionRate != null && !"".equals(pollutionRate)) {
            String[] strings = pollutionRate.split("-");
            map.put("start", strings[0]);
            map.put("end", strings[1]);
        }else{
            pollutionRate = null;
        }
        map.put("sampleId", sampleId);
        map.put("toxinType", toxinType);
        map.put("csCropSpecies", csCropSpecies);
        map.put("province", province);
        map.put("city", city);
        map.put("county", county);

        PageHelper.startPage(pageNum, SIZE);
        List<sample_info> infos = sampieService.seleById(map);
        PageInfo<sample_info> pageInfo = new PageInfo<sample_info>(infos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("infos", infos);
        return "IM";
    }


    //新增 sample_info表数据
    @RequestMapping("/insert")
    public String insertSi(sample_info si, String harvestTimeA, String samplingTimeA, String[] type1, String[] toxinCount,
                           String[] originalNum, String[] wordAddr, String[] txtAddr, String[] pictureAddr) {
        sampieService.insertSi(si);
        Integer siId = si.getSiId();
        String sampleId = si.getSampleId();
        for (int i = 0; i < type1.length; i++) {
            sample_toxin st1 = new sample_toxin();
            st1.setStiId(Integer.valueOf(type1[i]));
            st1.setToxinCount(Float.valueOf(toxinCount[i]));
            st1.setSampleInfoId(siId);
            sampieService.insertSt(st1);
        }
        for (int j = 0; j < originalNum.length; j++) {
            bacterial_strain_info bsi = new bacterial_strain_info();
            bsi.setWordAddr(wordAddr[j]);
            bsi.setTxtAddr(txtAddr[j]);
            bsi.setPictureAddr(pictureAddr[j]);
            bsi.setSampleInfoId(siId);
            bsi.setSampleNum(sampleId);
            bsi.setOriginalNum(originalNum[j]);
            sampieService.insertBsi(bsi);
        }
        return "redirect:/Sample";
    }

    //查询毒素表全部
    @ResponseBody
    @RequestMapping("/seleAl")
    public List<sample_toxin_info> addInfo() {
        List<sample_toxin_info> All = sampieService.seleinfo();
        return All;
    }

    //删除
    @ResponseBody
    @RequestMapping("/delete")
    public String dele(@RequestParam("siId") Integer[] siId){
        String message = "ERROR";
        try{
            for (int i = 0; i <siId.length ; i++) {
                Integer siI = siId[i];
                sampieService.deleteAll(siI);
            }
            message = "SUCCESS";
            return message;
        }catch (Exception e){
            message = "ERROR";
            return message;
        }
    }

    //修改回显样品表

    @RequestMapping("/findAll")
    public String find(Model model,Integer siId){
        sample_info findAll = sampieService.findAll(siId);
        sample_info ll = sampieService.l(siId);
        sample_info cc = sampieService.c(siId);
        sample_info tt = sampieService.t(siId);
        List<sample_toxin_info> sti = sampieService.sti();
        List<bacterial_strain_info> bsi = sampieService.bsi(siId);
        model.addAttribute("All",findAll);
        model.addAttribute("ll",ll);
        model.addAttribute("cc",cc);
        model.addAttribute("tt",tt);
        model.addAttribute("stt",sti);
        model.addAttribute("bsi",bsi);
        return "editIM";
    }

    @RequestMapping("/update")
    public String update(Integer siId,sample_info si,String sampleId,Integer cropCategoryId,
                          Integer breed,String province,String city,String county,String harvestTimeA,String samplingTimeA,
                         String samplingPeople,String Seasonal,String description,Float pollutionRate,Integer[] type1,Float[] toxinCount,
                         String[] originalNum, String[] wordAddr, String[] txtAddr, String[] pictureAddr ){
        //样品
        Integer siId1 = si.getSiId();
        si.setSampleId(sampleId);
        si.setCropCategoryId(cropCategoryId);
        si.setBreed(breed);
        si.setProvince(province);
        si.setCity(city);
        si.setCounty(county);
        si.setHarvestTimeA(harvestTimeA);
        si.setSamplingTimeA(samplingTimeA);
        si.setSamplingPeople(samplingPeople);
        si.setSeasonal(Seasonal);
        si.setDescription(description);
        si.setPollutionRate(pollutionRate);
        sampieService.info(siId1,si);
        //中间表
        sampieService.toxin(siId);
        for (int i = 0; i <type1.length ; i++) {
            Integer stiId = type1[i];
            sample_toxin st = new sample_toxin();
            st.setSampleInfoId(siId1);
            st.setStiId(stiId);
            st.setToxinCount(toxinCount[i]);
            sampieService.updateSt(st);
        }
        //菌株
        sampieService.Bsi(siId);
        for (int j = 0; j <originalNum.length ; j++) {
            bacterial_strain_info bsi = new bacterial_strain_info();
            bsi.setOriginalNum(originalNum[j]);
            bsi.setWordAddr(wordAddr[j]);
            bsi.setTxtAddr(txtAddr[j]);
            bsi.setPictureAddr(pictureAddr[j]);
            bsi.setSampleInfoId(siId1);
            bsi.setSampleNum(sampleId);

            sampieService.insertBsi(bsi);
        }
        return "redirect:/Sample";
    }

    @RequestMapping("/deleteById")
    public String delete(Integer siId){
        sampieService.isdel(siId);
        return "redirect:/Sample";
    }

}