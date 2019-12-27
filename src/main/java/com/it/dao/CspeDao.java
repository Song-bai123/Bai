package com.it.dao;

import com.it.bean.crop_species;

import java.util.List;

public interface CspeDao {
    List<crop_species> cspe(Integer csCropCategoryId);
}
