package com.ruanko.hwm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.LoveRela;
import com.ruanko.hwm.dao.LoveRelaMapper;
import com.ruanko.hwm.service.ILoveRelaService;

@Service
public class LoveRelaServiceImpl implements ILoveRelaService {

	@Resource
	private LoveRelaMapper loveRelaMapper;
	
	public void addLoveRela(LoveRela love) {
		loveRelaMapper.insert(love);
	}

	public void deleteLoveRela(LoveRela love) {
		loveRelaMapper.deleteByPrimaryKey(love.getId());
	}

	public LoveRela getLoveByUserAndComment(LoveRela love) {
		return loveRelaMapper.getLoveRelaByUserAndComment(love);
	}

}
