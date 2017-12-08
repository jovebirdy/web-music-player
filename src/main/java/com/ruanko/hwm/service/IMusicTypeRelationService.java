package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.MusicType;
import com.ruanko.hwm.bean.MusicTypeRela;

public interface IMusicTypeRelationService {
	List<MusicTypeRela> getMusicByTypeId(Integer typeId);
	
	void addMusicTR(MusicTypeRela mtr);
	
	void updateMusicTR(MusicTypeRela mtr);
	
	public List<MusicTypeRela> getMusicTypeByMusicId(Integer id);
}
