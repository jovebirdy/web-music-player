package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.SingerTypeRela;

public interface SingerTypeRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SingerTypeRela record);

    int insertSelective(SingerTypeRela record);

    SingerTypeRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SingerTypeRela record);

    int updateByPrimaryKey(SingerTypeRela record);
    
    List<SingerTypeRela> selectByTypeId(Integer typeid);
    
    SingerTypeRela selectBySingerId(Integer singerId);

}