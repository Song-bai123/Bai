package com.it.service;

import com.it.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SampieService {
    List<sample_info> seleById(Map<String,Object> map);

    //新增 sample_info表数据
    int insertSi(sample_info si);

    //新增 sample_toxin表中的毒素含量字段，sample_toxin_info表中的毒素字段
    int insertSt(sample_toxin st);

    //查询毒素表全部
    List<sample_toxin_info> seleinfo();

    //添加菌株表
    int insertBsi(bacterial_strain_info bsi);

    //批量删除根据样品表id删除
    int deleteAll(Integer siId);

    //修改回显样品表
    sample_info findAll(Integer siId);

    //省
    sample_info l(Integer siId);
    //市
    sample_info c(Integer siId);
    //县
    sample_info t(Integer siId);
    //修改回显毒素种类，毒素含量
    List<sample_toxin_info> sti();
    //修改回显菌株表
    List<bacterial_strain_info> bsi(Integer siId);

    //修改样品表
    int info(Integer siId,sample_info si);

    //修改中间表
    int toxin(Integer siId);

    //修改中间表
    int updateSt(sample_toxin st);

    //修改菌株表删除-->
    int Bsi(@Param("siId") Integer siId);

    //修改中间表添加
    int updateBsi(bacterial_strain_info bsi);

    //单条删除
    int isdel(Integer siId);

    //导出查询全部
    List<sample_info> SinFo();

    //导入添加方法 样品表
    int insertSinFo(sample_info ssi);

    //导入添加方法 中间表-
    int insertStt(sample_toxin sst);

    //导入样品表 品种信息
    crop_species seleCs(String csCropSpecies);
    //导入样品表 品种信息
    crop_category ccc(Integer csId);
    //导入  省
    address_province ap(String pName);
    //导入 市
    address_city ac(String cName);
    //导入 县
    address_town att(String tName);
}
