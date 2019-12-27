package com.it.service.impl;

import com.it.bean.*;
import com.it.dao.Sample;
import com.it.service.SampieService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SampleServiceImpl implements SampieService{

    @Autowired
     private Sample sample;

    public List<sample_info> seleById(Map<String,Object> map) {
        List<sample_info> infos = sample.selectById(map);
        return infos;
    }

    //添加sample_info表数据
    public int insertSi(sample_info si) {
        return sample.insertSi(si);
    }

    //添加毒素和毒素含量 以及中间表
    public int insertSt(sample_toxin st) {
        return sample.insertSt(st);
    }

    //查询毒素信息
    public List<sample_toxin_info> seleinfo() {
        return sample.seleinfo();
    }

    //添加菌株表
    public int insertBsi(bacterial_strain_info bsi) {
        return sample.insertBsi(bsi);
    }

    public int deleteAll(Integer siId) {
        return sample.deleteAll(siId);
    }
    //修改回显样品表
    public sample_info findAll(Integer siId) {
        return sample.findAll(siId);
    }
    //修改回显省
    public sample_info l(Integer siId) {
        return sample.l(siId);
    }
    //修改回显市
    public sample_info c(Integer siId) {
        return sample.c(siId);
    }
    //修改回显县
    public sample_info t(Integer siId) {
        return sample.t(siId);
    }
    //修改回显毒素种类，毒素含量
    public List<sample_toxin_info> sti() {
        return sample.sti();
    }
    //修改回显菌株表
    public List<bacterial_strain_info> bsi(Integer siId) {
        return sample.bsi(siId);
    }
    //修改样品表
    public int info(Integer siId,sample_info si) {
        return sample.info(siId,si);
    }
    //修改中间表删除
    public int toxin(Integer siId) {
        return sample.toxin(siId);
    }
    //修改中间表添加
    public int updateSt( sample_toxin st) {
        return sample.updateSt(st);
    }
    //修改菌株表删除-->
    public int Bsi(Integer siId) {
        return sample.Bsi(siId);
    }
    //修改中间表添加
    public int updateBsi(bacterial_strain_info bsi) {
        return sample.updateBsi(bsi);
    }
    //删除单条
    public int isdel(Integer siId) {
        return sample.isdel(siId);
    }

    public List<sample_info> SinFo() {
        return sample.SinFo();
    }

    public int insertSinFo(sample_info ssi) {
        return sample.insertSinFo(ssi);
    }

    public int insertStt(sample_toxin sst) {
        return sample.insertStt(sst);
    }
    //导入样品表 种类信息
    public crop_species seleCs(String csCropSpecies) {
        return sample.seleCs(csCropSpecies);
    }
    //导入样品表 品种信息
    public crop_category ccc(Integer csId) {
        return sample.ccc(csId);
    }
    //导入  省
    public address_province ap(String pName) {
        return sample.ap(pName);
    }
    //导入 市
    public address_city ac(String cName) {
        return sample.ac(cName);
    }

    public address_town att(String tName) {
        return sample.att(tName);
    }


}
