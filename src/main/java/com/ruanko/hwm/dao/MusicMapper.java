package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.Music;

public interface MusicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Music record);

    int insertSelective(Music record);

    Music selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Music record);

    int updateByPrimaryKey(Music record);
    
    List<Music> selectAllMusic();
    
    List<Music> selectMusicByUserId(Integer id);
}