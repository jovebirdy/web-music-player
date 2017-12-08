package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.MusicSingerRela;

public interface MusicSingerRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MusicSingerRela record);

    int insertSelective(MusicSingerRela record);

    MusicSingerRela selectByPrimaryKey(Integer id);
    
    List<MusicSingerRela> selectBySingerId(Integer singerid);
    
    MusicSingerRela selectSingerByMusicId(Integer musicId);

    int updateByPrimaryKeySelective(MusicSingerRela record);

    int updateByPrimaryKey(MusicSingerRela record);
    
    
}