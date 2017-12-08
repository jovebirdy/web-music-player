package com.ruanko.hwm.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.dao.RoleMapper;
import com.ruanko.hwm.service.IAdminRoleService;
import com.ruanko.hwm.service.IRoleService;
import com.ruanko.hwm.service.IUserService;

public class UserLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Resource
	private IUserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI(); 
		String host = request.getContextPath();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(requestURI.endsWith("/home/deleteMusicCollection") || requestURI.endsWith("/home/deleteUserSinger") ) {
			if(user == null){
				response.sendRedirect(host+"/home/myMusic");  
				//System.out.println(admin);
				return false;
			} 
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
