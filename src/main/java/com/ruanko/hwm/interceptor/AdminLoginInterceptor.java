package com.ruanko.hwm.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.dao.RoleMapper;
import com.ruanko.hwm.service.IAdminRoleService;
import com.ruanko.hwm.service.IRoleService;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Resource
	private IAdminRoleService adminRoleService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI(); 
		String host = request.getContextPath();
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		
		if(admin == null){
			response.sendRedirect(host+"/admin/login/");  
			//System.out.println(admin);
			return false;
		} else {
			//System.out.println("id" + admin.getId());
			int roleId = adminRoleService.getRoleId(admin.getId());
			
			//判断权限
			if(requestURI.endsWith("/admin/index/")) {
				return true;
			}else {
				//超级管理员
				if(roleId == 1) {
					if(requestURI.endsWith("addAdmin") || requestURI.endsWith("manageAdmin") || requestURI.endsWith("searchAdmin/") || requestURI.endsWith("doAddAdmin/") || requestURI.endsWith("ajax_operation/") || requestURI.endsWith("updateAdmin/") || requestURI.endsWith("getAdmin/") || requestURI.endsWith("deleteAdmin/")) {
						return true;
					}else {
						response.sendRedirect(host+"/admin/noAuth/");  
						return false;
					}
				}else if(roleId == 2) {//音乐管理员
					if(requestURI.endsWith("addMusic") || requestURI.endsWith("addMusic/") || requestURI.endsWith("manageMusic")  || requestURI.endsWith("manageMusic/") || requestURI.endsWith("searchMusic/") || requestURI.endsWith("searchMusic")) {
						return true;
					}else {
						response.sendRedirect(host+"/admin/noAuth/");  
						return false;
					}
					
				}else if(roleId == 3) {//歌手管理员
					if(requestURI.endsWith("addSinger") || requestURI.endsWith("manageSinger") || requestURI.endsWith("searchSinger") || requestURI.endsWith("addSinger/") || requestURI.endsWith("manageSinger/") || requestURI.endsWith("searchSinger/")) {
						return true;
					}else {
						response.sendRedirect(host+"/admin/noAuth/");  
						return false;
					}
					
				}else if(roleId == 4) {//用户管理员
					if(requestURI.endsWith("manageUser")  || requestURI.endsWith("deleteUser") || requestURI.endsWith("searchUser") || requestURI.endsWith("manageUser/")  || requestURI.endsWith("deleteUser/") || requestURI.endsWith("searchUser/")) {
						return true;
					}else {
						response.sendRedirect(host+"/admin/noAuth/");  
						return false;
					}
					
				}
			}
			System.out.println(admin.getAdminname());
		}
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
