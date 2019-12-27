package com.it.service.impl;

import com.it.bean.address_town;
import com.it.dao.addTown;
import com.it.service.addTownService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class addTownServiceImpl implements addTownService {
    @Autowired
    private addTown addTown;

    public List<address_town> addTo(Integer citycode) {
        return addTown.addt(citycode);
    }
}
