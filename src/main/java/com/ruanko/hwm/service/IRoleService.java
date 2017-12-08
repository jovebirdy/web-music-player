package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Role;

public interface IRoleService {
	public Role getRoleById(Integer id);
	
	public List<Role> getAllRole();
	
	public void addRole(Role role);
}
