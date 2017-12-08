package com.ruanko.hwm.service;

import com.ruanko.hwm.bean.SignRela;

public interface ISignService {
	void addSignRela(SignRela signRela);
	
	SignRela getSignRelaByUseid(Integer userid);
	
	void updateSignRela(SignRela signRela);
}
