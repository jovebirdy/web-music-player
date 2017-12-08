package com.ruanko.hwm.dao;

import com.ruanko.hwm.bean.MusicType;

public interface MusicTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MusicType record);

    int insertSelective(MusicType record);

    MusicType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MusicType record);

    int updateByPrimaryKey(MusicType record);
}