package com.ruanko.hwm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.AdminRoleRela;
import com.ruanko.hwm.dao.AdminRoleRelaMapper;
import com.ruanko.hwm.service.IAdminRoleService;
@Service
public class AdminRoleServiceImpl implements IAdminRoleService {
	@Resource
	private AdminRoleRelaMapper arrm;
	
	public void addAdminRole(AdminRoleRela arr) {
		arrm.insert(arr);
	}

	public Integer getRoleId(Integer adminId) {
		return arrm.selectRoleByAdminId(adminId).getRoleid();
	}

	public void updateAdminRole(AdminRoleRela arr) {
		arrm.updateByPrimaryKey(arr);
	}

	public AdminRoleRela getAdminRole(Integer id) {
		return arrm.selectByPrimaryKey(id);
	}

	public AdminRoleRela getAdminRole_adminId(Integer adminId) {
		return arrm.getAdminRole(adminId);
	}
	
}
