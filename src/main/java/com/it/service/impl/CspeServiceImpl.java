package com.it.service.impl;

import com.it.bean.crop_species;
import com.it.dao.CspeDao;
import com.it.service.CspeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CspeServiceImpl implements CspeService {

    @Autowired
    private CspeDao cspeDao;


    public List<crop_species> cspe(Integer csCropCategoryId) {
        return cspeDao.cspe(csCropCategoryId);
    }
}
