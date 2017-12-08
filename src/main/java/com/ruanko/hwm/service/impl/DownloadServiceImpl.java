package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.DownloadRela;
import com.ruanko.hwm.dao.DownloadRelaMapper;
import com.ruanko.hwm.service.IDownloadService;

@Service
public class DownloadServiceImpl implements IDownloadService {
	@Resource
	private DownloadRelaMapper downloadMapper;
	
	public List<DownloadRela> getDownloadRelaByUserid(Integer userid) {
		return downloadMapper.getDownloadByUserid(userid);
	}

	public void addDownloadRela(DownloadRela download) {
		downloadMapper.insert(download);
	}

	public DownloadRela getDownloadById(Integer id) {
		return downloadMapper.selectByPrimaryKey(id);
	}

	public void updateDownloadRela(DownloadRela download) {
		downloadMapper.updateByPrimaryKey(download);
	}
	
}
