package com.ruanko.hwm.dao;

import com.ruanko.hwm.bean.LoveRela;

public interface LoveRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LoveRela record);

    int insertSelective(LoveRela record);

    LoveRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoveRela record);

    int updateByPrimaryKey(LoveRela record);
    
    LoveRela getLoveRelaByUserAndComment(LoveRela love);
}