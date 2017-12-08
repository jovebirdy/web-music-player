package com.ruanko.hwm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.SingerType;
import com.ruanko.hwm.dao.SingerTypeMapper;
import com.ruanko.hwm.service.ISingerTypeService;
@Service
public class SingerTypeServiceImpl implements ISingerTypeService {
	@Resource
	private SingerTypeMapper singerTypeMapper;
	public SingerType getSingerTypeById(Integer id) {
		return singerTypeMapper.selectByPrimaryKey(id);
	}

}
