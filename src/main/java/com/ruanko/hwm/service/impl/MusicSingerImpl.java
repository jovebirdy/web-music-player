package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.dao.MusicSingerRelaMapper;
import com.ruanko.hwm.service.IMusicSingerService;
@Service
public class MusicSingerImpl implements IMusicSingerService{

	@Resource
	private MusicSingerRelaMapper msrm;
	
	public List<MusicSingerRela> getMusicBySingerId(Integer singerId) {
		return msrm.selectBySingerId(singerId);
	}

	public void addMS(MusicSingerRela msr) {
		msrm.insert(msr);
	}

	public void updateMS(MusicSingerRela msr) {
		msrm.updateByPrimaryKey(msr);
		
	}

	public MusicSingerRela getSingerByMusicId(Integer musicId) {
		return msrm.selectSingerByMusicId(musicId);
	}

}
