package com.ruanko.hwm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.SignRela;
import com.ruanko.hwm.dao.SignRelaMapper;
import com.ruanko.hwm.service.ISignService;

@Service
public class SignServiceImpl implements ISignService {

	@Resource
	private SignRelaMapper signRelaMapper;
	
	public void addSignRela(SignRela signRela) {
		signRelaMapper.insert(signRela);
	}

	public SignRela getSignRelaByUseid(Integer userid) {
		return signRelaMapper.selectByUserid(userid);
	}

	public void updateSignRela(SignRela signRela) {
		signRelaMapper.updateByPrimaryKey(signRela);
	}

}
