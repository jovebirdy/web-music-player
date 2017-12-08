package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Collection;
import com.ruanko.hwm.dao.CollectionMapper;
import com.ruanko.hwm.service.ICollectionService;
@Service
public class CollectionServiceImpl implements ICollectionService {
	
	@Resource
	private CollectionMapper collectionMapper;
	
	public List<Collection> getCollectionByUserid(Integer userid) {
		return collectionMapper.getCollectionByUserid(userid);
	}

	public void addCollection(Collection coll) {
		collectionMapper.insert(coll);
	}

	public List<Collection> getAllCollection() {
		return collectionMapper.selectAll();
	}

	public void deleteCollectionById(Integer id) {
		collectionMapper.deleteByPrimaryKey(id);
	}

	
	
}
