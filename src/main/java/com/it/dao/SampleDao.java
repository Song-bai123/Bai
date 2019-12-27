package com.it.dao;

import com.it.bean.sample_info;

import java.util.List;
import java.util.Map;

public interface SampleDao {
    List<sample_info> findMH(Map<String,Object> map);
}
