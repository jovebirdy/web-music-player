package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.PlayRecord;

public interface IPlayRecordService {
	void addPlayRecord(PlayRecord playRecord);
	
	List<PlayRecord> getPlayRecordByUserid(Integer userid);
	
	void uploadPlayRecord(PlayRecord playRecord);
}
