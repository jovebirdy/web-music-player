package com.ruanko.hwm.service;

import com.ruanko.hwm.bean.LoveRela;

public interface ILoveRelaService {
	void addLoveRela(LoveRela love);
	
	void deleteLoveRela(LoveRela love);
	
	LoveRela getLoveByUserAndComment(LoveRela love);
}
