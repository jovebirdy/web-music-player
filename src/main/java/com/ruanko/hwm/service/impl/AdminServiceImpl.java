package com.ruanko.hwm.service.impl;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.dao.AdminMapper;
import com.ruanko.hwm.service.IAdminService;


@Service("adminService")
public class AdminServiceImpl implements IAdminService {
	
	@Resource
	private AdminMapper adminMapper;


	public Admin getAdminById(int adminId) {
		// TODO Auto-generated method stub
		return adminMapper.selectByPrimaryKey(adminId);
	}


	public void addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.insert(admin);
	}
	public Admin getAdminByName(String adminName) {
		// TODO Auto-generated method stub
		return adminMapper.selectByName(adminName);
	}


	public List<Admin> getAllAdmin() {
		return adminMapper.selectAllAdmin();
	}


	public void deleteAdmin(Admin admin) {
		adminMapper.deleteByPrimaryKey(admin.getId());
	}


	public void updateAdmin(Admin admin) {
		adminMapper.updateByPrimaryKey(admin);
		
	}

	
}
