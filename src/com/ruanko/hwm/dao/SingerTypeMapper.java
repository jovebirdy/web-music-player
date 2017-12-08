package com.ruanko.hwm.dao;

import com.ruanko.hwm.bean.SingerType;

public interface SingerTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SingerType record);

    int insertSelective(SingerType record);

    SingerType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SingerType record);

    int updateByPrimaryKey(SingerType record);
}