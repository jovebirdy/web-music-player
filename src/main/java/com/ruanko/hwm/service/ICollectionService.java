package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Collection;

public interface ICollectionService {
	List<Collection> getCollectionByUserid(Integer userid);
	
	void addCollection(Collection coll);
	
	List<Collection> getAllCollection();
	
	void deleteCollectionById(Integer id);
}
