package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.PlayRecord;
import com.ruanko.hwm.dao.PlayRecordMapper;
import com.ruanko.hwm.service.IPlayRecordService;

@Service
public class PlayRecordServiceImpl implements IPlayRecordService {

	@Resource
	private PlayRecordMapper playRecordMapper;
	
	public void addPlayRecord(PlayRecord playRecord) {
		playRecordMapper.insert(playRecord);
	}

	public List<PlayRecord> getPlayRecordByUserid(Integer userid) {
		return playRecordMapper.selectByUserid(userid);
	}

	public void uploadPlayRecord(PlayRecord playRecord) {
		playRecordMapper.updateByPrimaryKey(playRecord);
	}
	
}
