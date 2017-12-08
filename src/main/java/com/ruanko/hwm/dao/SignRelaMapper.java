package com.ruanko.hwm.dao;

import com.ruanko.hwm.bean.SignRela;

public interface SignRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SignRela record);

    int insertSelective(SignRela record);

    SignRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SignRela record);

    int updateByPrimaryKey(SignRela record);
    
    SignRela selectByUserid(Integer userid);
}