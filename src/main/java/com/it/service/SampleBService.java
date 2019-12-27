package com.it.service;

import com.it.bean.sample_info;

import java.util.List;
import java.util.Map;

public interface SampleBService {
    List<sample_info> findMH(Map<String,Object> map);

}
