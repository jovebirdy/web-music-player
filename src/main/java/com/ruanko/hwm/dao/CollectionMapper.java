package com.ruanko.hwm.dao;

import java.util.List;

import com.ruanko.hwm.bean.Collection;

public interface CollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Collection record);

    int insertSelective(Collection record);

    Collection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Collection record);

    int updateByPrimaryKey(Collection record);
    
    List<Collection> getCollectionByUserid(Integer userid);
    
    List<Collection> selectAll();
}