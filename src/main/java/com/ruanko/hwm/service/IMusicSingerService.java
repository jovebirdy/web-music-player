package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.MusicSingerRela;

public interface IMusicSingerService {
	List<MusicSingerRela> getMusicBySingerId(Integer singerId);
	
	void addMS(MusicSingerRela msr);
	
	void updateMS(MusicSingerRela msr);
	
	MusicSingerRela getSingerByMusicId(Integer musicId);
}
