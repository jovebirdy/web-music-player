package com.ruanko.hwm.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.bean.AdminRoleRela;
import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.Role;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.service.IAdminRoleService;
import com.ruanko.hwm.service.IAdminService;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.IRoleService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.utl.MD5Util;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource
	public IAdminService adminService;
	
	@Resource
	private IUserService userService;
	
	@Resource
	private IMusicService musicService;
	
	@Resource
	private ISingerService singerService;
	
	@Resource
	private IRoleService roleService;
	
	@Resource
	private IAdminRoleService adminRoleService;
	
	//每页项数
	private Integer pageSize = 5;
	
	@RequestMapping({"/logup/"})
	public String toLogup(Model model, HttpServletRequest request) {
		model.addAttribute("title", "注册");
		model.addAttribute(new Admin());
		return "showAdminLogup";
	}
	
	@RequestMapping({"/index/"})
	public String toIndex(Model model, HttpServletRequest request) {
		model.addAttribute("title", "首页");
		List<Music> musicList = musicService.getAllMusic();
		int musicCounts = musicList.size();
		int singerCounts = singerService.getAllSinger().size();
		int playCounts = 0;
		for(Music m : musicList) {
			playCounts += m.getPlaycounts();
		}
		
		
		model.addAttribute("musicCounts", musicCounts);
		model.addAttribute("singerCounts", singerCounts);
		model.addAttribute("playCounts", playCounts);
		return "showAdminIndex";
	}
	
	@RequestMapping({"/addMusic/","/addMusic"})
	public String toAddMusic(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		//获取所有的歌手并返回前台
		List<Singer> singerList = singerService.getAllSinger();
		model.addAttribute("singerList", singerList);
		
		model.addAttribute(new Music());
		return "showAddMusic";
	}
	
	@RequestMapping({"/manageMusic/"})
	public String toManageMusic(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		List<Music> musicList = musicService.getAllMusic();
		//System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", musicList.size());
		model.addAttribute(new Music());
		return "showManageMusic";
	}
	
	@RequestMapping({"/searchMusic/"})
	public String toSearchMusic(Model model, HttpServletRequest request) {
		String musicname = request.getParameter("musicname");
		//System.out.println(musicname);
		//model.addAttribute("title", "首页");
		List<Music> musicList = musicService.getAllMusic();
		List<Music> result = new ArrayList<Music>();
		//获取搜索项
		for(Music m : musicList) {
			if(m.getMusicname().contains(musicname)) {
				result.add(m);
			}
		}
		//System.out.println(musicList);
		model.addAttribute("musicList", result);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", result.size());
		model.addAttribute(new Music());
		model.addAttribute("musicname", musicname);
		return "showManageMusic";
	}
	
	@RequestMapping({"/addSinger/","/addSinger"})
	public String toAddSinger(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		model.addAttribute(new Singer());
		return "showAddSinger";
	}
	
	@RequestMapping({"/manageSinger/","/manageSinger"})
	public String toManageSinger(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		List<Singer> singerList = singerService.getAllSinger();
		//System.out.println(musicList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", singerList.size());
		model.addAttribute(new Singer());
		return "showManageSinger";
	}
	
	@RequestMapping({"/searchSinger/"})
	public String toSearchSinger(Model model, HttpServletRequest request) {
		String singername = request.getParameter("singername");
		//System.out.println(musicname);
		//model.addAttribute("title", "首页");
		List<Singer> singerList = singerService.getAllSinger();
		List<Singer> result = new ArrayList<Singer>();
		//获取搜索项
		for(Singer m : singerList) {
			if(m.getSingername().contains(singername)) {
				result.add(m);
			}
		}
		//System.out.println(musicList);
		model.addAttribute("singerList", result);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", result.size());
		model.addAttribute(new Singer());
		model.addAttribute("singername", singername);
		return "showManageSinger";
	}
	
	@RequestMapping({"/manageUser/","/manageUser"})
	public String toManageUser(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		List<User> userList = userService.findAllUser();
		//System.out.println(musicList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute(new User());
		return "showManageUser";
	}
	
	@RequestMapping({"/searchUser/"})
	public String toSearchUser(Model model, HttpServletRequest request) {
		String username = request.getParameter("username");
		//System.out.println(musicname);
		//model.addAttribute("title", "首页");
		List<User> userList = userService.findAllUser();
		List<User> result = new ArrayList<User>();
		//获取搜索项
		for(User s : userList) {
			if(s.getUsername().contains(username)) {
				result.add(s);
			}
		}
		//System.out.println(musicList);
		model.addAttribute("userList", result);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", result.size());
		model.addAttribute(new User());
		model.addAttribute("username", username);
		return "showManageUser";
	}
	
	@RequestMapping({"/searchAdmin/"})
	public String toSearchAdmin(Model model, HttpServletRequest request) {
		String adminname = request.getParameter("adminname");
		//System.out.println(musicname);
		//model.addAttribute("title", "首页");
		List<Admin> adminList = adminService.getAllAdmin();
		List<Admin> result = new ArrayList<Admin>();
		//获取搜索项
		for(Admin a : adminList) {
			if(a.getAdminname().contains(adminname)) {
				result.add(a);
			}
		}
		//System.out.println(musicList);
		model.addAttribute("adminList", result);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", result.size());
		model.addAttribute(new Admin());
		model.addAttribute("adminname", adminname);
		return "showManageAdmin";
	}
	
	@RequestMapping({"/addAdmin/","/addAdmin"})
	public String toAddAdmin(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		model.addAttribute(new Admin());
		List<Role> roleList = roleService.getAllRole();
		model.addAttribute("roleList", roleList);
		return "showAddAdmin";
	}
	
	@RequestMapping({"/doAddAdmin/","/doAddAdmin"}) //添加管理员
	public String logup(@ModelAttribute("admin")Admin admin, Model model, HttpServletRequest request){
		//System.out.println(admin.getAdminname());	
		//model.addAttribute(new Admin());
		Admin ad = adminService.getAdminByName(admin.getAdminname());		
		String message = "";
		if(ad == null){
			admin.setPassword(MD5Util.getMD5Code(admin.getPassword()));
			adminService.addAdmin(admin);
			
			// 查询管理员
			int adminId = 0;
			List<Admin> adminList1 = adminService.getAllAdmin();
			for (Admin a : adminList1) {
				if (a.getAdminname().equals(a.getAdminname())) {
					adminId = a.getId();
				}
			}
			//保存权限
			Integer roleId = Integer.parseInt(request.getParameter("select"));
			AdminRoleRela arr = new AdminRoleRela();
			arr.setAdminid(adminId);
			arr.setRoleid(roleId);
			adminRoleService.addAdminRole(arr);;
			
			
			message ="添加成功！";
			model.addAttribute("message",message);
				
		}
		else{
			message ="该用户名已存在";
			model.addAttribute("message",message);			
		}
		model.addAttribute(new Admin());	
		List<Role> roleList = roleService.getAllRole();
		model.addAttribute("roleList", roleList);
		return "showAddAdmin";
	}
	
	/**
	 * 删除管理员
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/deleteAdmin","/deleteAdmin/" })
	public String deleteMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		Admin admin = adminService.getAdminById(id);
		adminService.deleteAdmin(admin);
		
		List<Admin> adminList = adminService.getAllAdmin();
		// System.out.println(musicList);
		model.addAttribute("adminList", adminList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", adminList.size());
		model.addAttribute(new Admin());
		return "showManageAdmin";
	}

	/**
	 * 修改管理员获取管理员
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/getAdmin", "/getAdmin/" })
	public String getSinger(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Admin admin = adminService.getAdminById(id);

//		// 获取所有的歌手并返回前台
//		List<Singer> singerList = singerService.getAllSinger();
//		model.addAttribute("singerList", singerList);

		List<Admin> adminList = adminService.getAllAdmin();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", adminList.size());
		model.addAttribute("adminList", adminList);
		List<Role> roleList = roleService.getAllRole();
		model.addAttribute("roleList", roleList);
		model.addAttribute("admin", admin);
		return "showManageAdmin";
	}

	/**
	 * 更新歌手
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/updateAdmin", "/updateAdmin/" })
	public String updateMusic(@ModelAttribute("admin") Admin admin, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Admin ad = adminService.getAdminById(id);
		
		ad.setAdminname(admin.getAdminname());
		ad.setEmail(admin.getEmail());
		ad.setTel(admin.getTel());
		
		//System.out.println(image.getContentType());
		//String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		

		// 播放时长
//		String time = Upload_Download
//				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
//						+ "/" + music.getMusicname() + ".mp3"));
//		mus.setMusictime(time);

		adminService.updateAdmin(ad);;

		// 更新至歌曲类别表中
		String select = request.getParameter("select");
		// System.out.println(musicId);
		// for(String s1 : checkbox) {
		// System.out.println(s1);
		// }
		
	    AdminRoleRela arr = adminRoleService.getAdminRole_adminId(ad.getId());
	    arr.setRoleid(Integer.parseInt(select));
	    
	    adminRoleService.updateAdminRole(arr);

		// 更新至歌曲歌手关联表
//		int singerId = Integer.parseInt(request.getParameter("select"));
//		MusicSingerRela msr = new MusicSingerRela();
//		msr.setMusicid(id);
//		msr.setSingerid(singerId);
//		musicSingerService.updateMS(msr);

		List<Admin> adminList = adminService.getAllAdmin();
		// System.out.println(musicList);
		model.addAttribute("adminList", adminList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", adminList.size());
		model.addAttribute("message", "修改成功");
		model.addAttribute(admin);
		return "showManageAdmin";
	}

	

	/**
	 * ajax
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	@RequestMapping({"/ajax_operation", "/ajax_operation/"})
	public @ResponseBody List<Object> findSingerAjax1(String pageIndex, String pageSize, String totalPage, String adminName) {
		//System.out.println(musicName);
		return ajax_common1(pageIndex, pageSize, totalPage, adminName);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<Object> ajax_common1(String pageIndex, String pageSize, String totalPage, String adminname) {
		List<Admin> resultList = new ArrayList<Admin>();
		List<Role> roleList = new ArrayList<Role>();
		//判断是否为搜索
		if(adminname == "") {
			resultList = adminService.getAllAdmin();
			
		}else {
			List<Admin> al = adminService.getAllAdmin();
			List<Role> rl = roleService.getAllRole();
			for(Admin a : al) {
				if(a.getAdminname().contains(adminname)) {
					resultList.add(a);
				}
			}
		}
		//获取对应的歌手
		for(Admin a : resultList) {
			//System.out.println(m.getId());
			Role role = roleService.getRoleById(adminRoleService.getRoleId(a.getId()));
			roleList.add(role);
		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		List<Admin> resultList1 = new ArrayList<Admin>();
		List<Role> resultList2 = new ArrayList<Role>();
		List<Object> resultList3 = new ArrayList<Object>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList1 = resultList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
			resultList2 = roleList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList1 = resultList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
			resultList2 = roleList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		resultList3.add(resultList1);
		resultList3.add(resultList2);
		return resultList3;
	}
	
	@RequestMapping({"/manageAdmin/","/manageAdmin"})
	public String toManageAdmin(Model model, HttpServletRequest request) {
		//model.addAttribute("title", "首页");
		List<Admin> adminList = adminService.getAllAdmin();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", adminList.size());
		model.addAttribute("adminList", adminList);
		model.addAttribute(new Admin());
		return "showManageAdmin";
	}
	
	@RequestMapping({"/login/"})
	public String toLogin(Model model, HttpServletRequest request) {
		model.addAttribute("title", "登录");
		model.addAttribute(new Admin());
		return "showAdminLogin";
	}
	@RequestMapping({"/doLogin/"}) //登录
	public String login(@ModelAttribute("admin")Admin admin, Model model, HttpServletRequest request) throws Exception{
		//System.out.println(admin.getAdminname());
		Admin ad = adminService.getAdminByName(admin.getAdminname());		
		String message = "";
		if(ad == null){
			message = "账号不存在";
			model.addAttribute("message",message);
		}else if(ad.getPassword().equalsIgnoreCase((MD5Util.getMD5Code(admin.getPassword())))){
			request.getSession().setAttribute("admin", ad);
			List<Music> musicList = musicService.getAllMusic();
			int musicCounts = musicList.size();
			int singerCounts = singerService.getAllSinger().size();
			int playCounts = 0;
			for(Music m : musicList) {
				playCounts += m.getPlaycounts();
			}
			
			
			model.addAttribute("musicCounts", musicCounts);
			model.addAttribute("singerCounts", singerCounts);
			model.addAttribute("playCounts", playCounts);
			
			return "showAdminIndex";
		}else{
			message = "密码错误";
			model.addAttribute("message",message);
		}
		
		
		return "showAdminLogin";
	}
	@RequestMapping({"/doLogOut/"})
	public String LogOut(Model model, HttpServletRequest request){
		request.getSession().setAttribute("admin", null);
		model.addAttribute(new Admin());
		return "showAdminLogin";
	}
	
	/**
	 * 没有权限页面
	 * @return
	 */
	@RequestMapping({"/noAuth/"})
	public String toNoAuth() {
		return "showNoAuth";
	}
	
	
}
