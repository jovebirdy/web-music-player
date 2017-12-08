package com.ruanko.hwm.service;

import com.ruanko.hwm.bean.AdminRoleRela;

public interface IAdminRoleService {
	public void addAdminRole(AdminRoleRela arr);
	
	public Integer getRoleId(Integer adminId);
	
	public AdminRoleRela getAdminRole_adminId(Integer adminId);
	
	public void updateAdminRole(AdminRoleRela arr);
	
	public AdminRoleRela getAdminRole(Integer id);
}
