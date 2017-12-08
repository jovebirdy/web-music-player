package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.Singer;

public interface SingerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Singer record);

    int insertSelective(Singer record);

    Singer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Singer record);

    int updateByPrimaryKey(Singer record);
    
    List<Singer> selectAllSinger();
}