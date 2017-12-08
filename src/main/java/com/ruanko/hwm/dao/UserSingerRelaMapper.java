package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.UserSingerRela;

public interface UserSingerRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserSingerRela record);

    int insertSelective(UserSingerRela record);

    UserSingerRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserSingerRela record);

    int updateByPrimaryKey(UserSingerRela record);
    
    List<UserSingerRela> getUserSingerRelaByUserid(Integer userid);
}