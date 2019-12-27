package com.it.service.impl;

import com.it.bean.sample_info;
import com.it.dao.SampleDao;
import com.it.service.SampleBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SampleBServiceImpl implements SampleBService {
    @Autowired
    private SampleDao sampleDao;

    public List<sample_info> findMH(Map<String,Object> map) {
        List<sample_info> info = sampleDao.findMH(map);
        return null;
    }
}
