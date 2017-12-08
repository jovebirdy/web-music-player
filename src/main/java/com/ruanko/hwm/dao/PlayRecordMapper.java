package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.PlayRecord;

public interface PlayRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PlayRecord record);

    int insertSelective(PlayRecord record);

    PlayRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PlayRecord record);

    int updateByPrimaryKey(PlayRecord record);
    
    List<PlayRecord> selectByUserid(Integer userid);
}