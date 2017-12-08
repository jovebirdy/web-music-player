package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Role;
import com.ruanko.hwm.dao.RoleMapper;
import com.ruanko.hwm.service.IRoleService;
@Service
public class RoleServiceImpl implements IRoleService {
	@Resource
	private RoleMapper roleMapper;
	
	public Role getRoleById(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	public List<Role> getAllRole() {
		return roleMapper.selectAllRole();
	}

	public void addRole(Role role) {
		roleMapper.insert(role);
		
	}
	
}
