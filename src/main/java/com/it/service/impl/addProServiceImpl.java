package com.it.service.impl;

import com.it.bean.address_province;
import com.it.dao.addProDao;
import com.it.service.addProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class addProServiceImpl implements addProService {

    @Autowired
    private addProDao addProDao;

    public List<address_province> addPro() {
        return addProDao.addPro();
    }
}
