package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.UserSingerRela;

public interface IUserSingerService {
	List<UserSingerRela> getUserSingerByUserid(Integer userid);
	
	void addUserSinger(UserSingerRela usr);
	
	void deleteUserSingerById(Integer id);
}
