package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.DownloadRela;

public interface IDownloadService {
	List<DownloadRela> getDownloadRelaByUserid(Integer userid); 
	
	void addDownloadRela(DownloadRela download);
	
	DownloadRela getDownloadById(Integer id);
	
	void updateDownloadRela(DownloadRela download);
}
