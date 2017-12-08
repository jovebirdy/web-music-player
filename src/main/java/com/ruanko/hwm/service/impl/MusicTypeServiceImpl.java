package com.ruanko.hwm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.MusicType;
import com.ruanko.hwm.dao.MusicTypeMapper;
import com.ruanko.hwm.service.IMusicTypeService;
@Service
public class MusicTypeServiceImpl implements IMusicTypeService {
	@Resource
	private MusicTypeMapper musicTypeMapper;
	public MusicType getMusicTypeById(Integer id) {
		return musicTypeMapper.selectByPrimaryKey(id);
	}

}
