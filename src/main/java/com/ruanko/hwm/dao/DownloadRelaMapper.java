package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.DownloadRela;

public interface DownloadRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DownloadRela record);

    int insertSelective(DownloadRela record);

    DownloadRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DownloadRela record);

    int updateByPrimaryKey(DownloadRela record);
    
    List<DownloadRela> getDownloadByUserid(Integer userid);
}