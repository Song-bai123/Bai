package com.it.service.impl;

import com.it.bean.crop_category;
import com.it.dao.CatDao;
import com.it.service.CatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatServiceImpl implements CatService {
    @Autowired
    private CatDao catDao;

    public List<crop_category> cat() {
        return catDao.cat();
    }
}
