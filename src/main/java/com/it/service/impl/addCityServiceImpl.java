package com.it.service.impl;

import com.it.bean.address_city;
import com.it.dao.addCityDao;
import com.it.service.addCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class addCityServiceImpl implements addCityService {
    @Autowired
    private addCityDao addCityDao;
    public List<address_city> addCity(Integer provincecode) {
        return addCityDao.addCity(provincecode);
    }
}
