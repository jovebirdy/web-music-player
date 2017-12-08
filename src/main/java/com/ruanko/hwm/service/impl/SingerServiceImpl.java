package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.dao.SingerMapper;
import com.ruanko.hwm.service.ISingerService;


@Service("singerService")
public class SingerServiceImpl implements ISingerService {

	@Resource
	private SingerMapper singerMapper;

	public Singer getSingerById(int singerId) {
		return singerMapper.selectByPrimaryKey(singerId);
	}

	public void addSinger(Singer singer) {
		singerMapper.insert(singer);
		
	}

	public List<Singer> getAllSinger() {
		return singerMapper.selectAllSinger();
	}

	public void deleteSinger(Integer id) {
		singerMapper.deleteByPrimaryKey(id);
	}

	public void updateSinger(Singer singer) {
		singerMapper.updateByPrimaryKey(singer);
		
	}
	
	
}
