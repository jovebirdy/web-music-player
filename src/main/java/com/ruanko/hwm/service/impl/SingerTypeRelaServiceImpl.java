package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.SingerTypeRela;
import com.ruanko.hwm.dao.SingerMapper;
import com.ruanko.hwm.dao.SingerTypeMapper;
import com.ruanko.hwm.dao.SingerTypeRelaMapper;
import com.ruanko.hwm.service.ISingerTypeRelaService;
@Service
public class SingerTypeRelaServiceImpl implements ISingerTypeRelaService {
	@Resource
	private SingerTypeRelaMapper singerTypeRelaMapper;
	
	public List<SingerTypeRela> getSingerByTypeId(Integer typeId) {
		return singerTypeRelaMapper.selectByTypeId(typeId);
	}

	public void addSingerTR(SingerTypeRela str) {
		singerTypeRelaMapper.insert(str);
	}

	public void updateSingerTR(SingerTypeRela str) {
		singerTypeRelaMapper.updateByPrimaryKey(str);
	}

	public SingerTypeRela getSingerTypeBySingerId(Integer singerId) {
		return singerTypeRelaMapper.selectBySingerId(singerId);
	}

}
