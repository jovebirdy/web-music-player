package com.ruanko.hwm.test1;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.service.IAdminService;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestAdmin {
	private static Logger logger = Logger.getLogger(TestAdmin.class);
	@Resource
	private IAdminService adminService;
	
	@Test
	public void testMybatis(){
		Admin admin = adminService.getAdminById(6);
	
		logger.info(JSON.toJSONString(admin));
		logger.info("欢迎您");
		logger.error("错误");
		
		System.out.println(admin.getAdminname());
		
//		Admin admin1 = new Admin();
//		admin1.setAdminname("yaohaoyu");
//		admin1.setEmail("asf");
//		admin1.setPassword("afdf");
//		admin1.setTel("asdfdsf");
		
		//adminService.addAdmin(admin1);
	}

}
