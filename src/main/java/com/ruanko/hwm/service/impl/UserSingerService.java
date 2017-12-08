package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.UserSingerRela;
import com.ruanko.hwm.dao.UserSingerRelaMapper;
import com.ruanko.hwm.service.IUserSingerService;

@Service
public class UserSingerService implements IUserSingerService {
	@Resource
	private UserSingerRelaMapper userSingerRelaMapper;
	
	public List<UserSingerRela> getUserSingerByUserid(Integer userid) {
		return userSingerRelaMapper.getUserSingerRelaByUserid(userid);
	}

	public void addUserSinger(UserSingerRela usr) {
		userSingerRelaMapper.insert(usr);
	}

	public void deleteUserSingerById(Integer id) {
		userSingerRelaMapper.deleteByPrimaryKey(id);
	}
	
}
