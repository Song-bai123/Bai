package com.it.service;

import com.it.bean.address_town;

import java.util.List;

public interface addTownService {
    List<address_town> addTo(Integer citycode);
}
