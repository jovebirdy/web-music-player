package com.ruanko.hwm.service;



import java.util.List;

import com.ruanko.hwm.bean.Admin;


public interface IAdminService {

	public Admin getAdminById(int adminId);
	
	public void addAdmin(Admin admin);
	
	public Admin getAdminByName(String adminName);
	
	public List<Admin>	getAllAdmin();
	
	public void deleteAdmin(Admin admin);
	
	public void updateAdmin(Admin admin);

	
}
