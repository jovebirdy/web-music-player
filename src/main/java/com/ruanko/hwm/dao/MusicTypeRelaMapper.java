package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.MusicType;
import com.ruanko.hwm.bean.MusicTypeRela;

public interface MusicTypeRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MusicTypeRela record);

    int insertSelective(MusicTypeRela record);

    MusicTypeRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MusicTypeRela record);

    int updateByPrimaryKey(MusicTypeRela record);
    
    List<MusicTypeRela> selectByMusicTypeId(Integer musicTypeId);
    
    public List<MusicTypeRela> getMusicTypeByMusicId(Integer id);
}