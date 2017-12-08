package com.ruanko.hwm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.bean.Collection;
import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.bean.SingerTypeRela;
import com.ruanko.hwm.bean.UserSingerRela;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.service.ISingerTypeRelaService;
import com.ruanko.hwm.service.IUserSingerService;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.Upload_Download;


@Controller
@RequestMapping("/singer")
public class SingerController {

	@Resource
	public ISingerService singerService;	
	@Resource
	public ISingerTypeRelaService singerTypeRelaService;
	@Resource
	public IUserSingerService userSingerService;
	
	private static Logger logger = Logger.getLogger(SingerController.class);
	
	//每页项数
	private Integer pageSize = 5;
	
	/**
	 * 添加歌手
	 * @param singer
	 * @param image
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping({"/doAddSinger/"})
	public String addMusic(@ModelAttribute("singer")Singer singer, @RequestParam("imageInfo") MultipartFile image, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//保存音乐到数据库中
		Singer sin = new Singer();
		sin.setSingername(singer.getSingername());
		sin.setIntroduction(singer.getIntroduction());
		sin.setImg(singer.getSingername()+".jpg");
		sin.setCounts(0);
		sin.setUploadtime(DateTime.getCurrentTime());
		//上传音乐相关文件
		//System.out.println(image.getName()+"---"+image.getContentType()+"---"+image.getOriginalFilename());
		if(!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message","图片文件必须是jpg格式");
			model.addAttribute(new Singer());
			return "showAddSinger";
		}
		
        try {
        	Upload_Download.upload_img1(image, request,singer.getSingername());
        	
        } catch (IOException e) {
            System.out.println("文件上传失败");
            e.printStackTrace();
        }
        
      
		String radio = request.getParameter("radio");
//		for(String s : checkbox) {
//			System.out.println(s);
//		}
		//System.out.println(mus.getMusicname() + mus.getMusictime() + mus.getLyr() + mus.getImg() + mus.getPlaycounts() + mus.getUploadtime());
		//System.out.println(song.getContentType());
		//System.out.println(Upload_Download.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song") + "/" + song.getOriginalFilename())));
		//System.out.println(request.getParameter("select"));
		//插入数据库
		singerService.addSinger(sin);
		
		// 查询歌曲
		int singerId = 0;
		List<Singer> singerList1 = singerService.getAllSinger();
		for (Singer s : singerList1) {
			if (s.getSingername().equals(sin.getSingername())) {
				singerId = s.getId();
			}
		}
		//插入到歌手关联表
		addSingerAndTypeToRela(radio, singerId);
		
		model.addAttribute(new Singer());
		model.addAttribute("message","添加歌手成功");
		return "showAddSinger";
	}
	
	/**
	 * 添加歌手到歌手类型关联表中
	 * 
	 * @param type
	 * @param mid
	 */
	public void addSingerAndTypeToRela(String type, Integer sid) {
		// System.out.println(mid);
		// for(String s1 : type) {
		// System.out.println(s1);
		// }

		SingerTypeRela str = new SingerTypeRela();
		str.setSingerid(sid);
		str.setTypeid(Integer.parseInt(type));
		singerTypeRelaService.addSingerTR(str);
		
	}

	/**
	 * 删除歌手
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/deleteSinger" })
	public String deleteMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Singer singer = singerService.getSingerById(id);
		singerService.deleteSinger(id);;
		// 删除歌曲相关文件
		String root = request.getSession().getServletContext().getRealPath("/static/singer");
		String singername = singer.getSingername();
		//Upload_Download.deleteFile(root + "\\" + singername + ".jpg");
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		logger.info("[AdminInfo:" + admin.getId() + "," + admin.getAdminname() + "] : delete the music[SingerInfo : " + singer.getId() + "," + singer.getSingername() + "]");
		List<Singer> singerList = singerService.getAllSinger();
		// System.out.println(musicList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", singerList.size());
		model.addAttribute(new Singer());
		return "showManageSinger";
	}

	/**
	 * 修改歌手获取歌手
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/getSinger" })
	public String getSinger(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Singer singer = singerService.getSingerById(id);

//		// 获取所有的歌手并返回前台
//		List<Singer> singerList = singerService.getAllSinger();
//		model.addAttribute("singerList", singerList);

		List<Singer> singerList = singerService.getAllSinger();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", singerList.size());
		model.addAttribute("singerList", singerList);
		model.addAttribute("singer",singer);
		return "showManageSinger";
	}

	/**
	 * 更新歌手
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/updateSinger" })
	public String updateMusic(@ModelAttribute("singer") Singer singer, @RequestParam("imageInfo") MultipartFile image, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Singer sin = singerService.getSingerById(id);
		
		sin.setSingername(singer.getSingername());
		sin.setCounts(sin.getCounts());
		sin.setImg(singer.getSingername() + ".jpg");
		sin.setIntroduction(singer.getIntroduction());
		sin.setUploadtime(DateTime.getCurrentTime());
		//System.out.println(image.getContentType());
		//String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		// 判断上传的文件类型
		if (!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message", "图片文件必须是jpg格式");
			List<Singer> singerList = singerService.getAllSinger();
			//System.out.println(musicList);
			model.addAttribute("singerList", singerList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", singerList.size());
			model.addAttribute(singer);
			return "showManageSinger";
		} 

		try {
			Upload_Download.upload_img1(image, request, singer.getSingername());
		} catch (IOException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		}

		// 播放时长
//		String time = Upload_Download
//				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
//						+ "/" + music.getMusicname() + ".mp3"));
//		mus.setMusictime(time);

		singerService.updateSinger(sin);

		// 更新至歌曲类别表中
		String radio = request.getParameter("radio");
		// System.out.println(musicId);
		// for(String s1 : checkbox) {
		// System.out.println(s1);
		// }
		updateSingerAndTypeToRela(radio, id);

		// 更新至歌曲歌手关联表
//		int singerId = Integer.parseInt(request.getParameter("select"));
//		MusicSingerRela msr = new MusicSingerRela();
//		msr.setMusicid(id);
//		msr.setSingerid(singerId);
//		musicSingerService.updateMS(msr);

		List<Singer> singerList = singerService.getAllSinger();
		// System.out.println(musicList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", singerList.size());
		model.addAttribute("message", "修改成功");
		model.addAttribute(singer);
		return "showManageSinger";
	}

	/**
	 * 更新音乐到歌手类型关联表中
	 * 
	 * @param type
	 * @param mid
	 */
	public void updateSingerAndTypeToRela(String type, Integer sid) {
		// System.out.println(mid);
		// for(String s1 : type) {
		// System.out.println(s1);
		// }

		
		int typeId = Integer.parseInt(type);
		SingerTypeRela str = singerTypeRelaService.getSingerTypeBySingerId(sid);
		str.setSingerid(sid);
		str.setTypeid(typeId);
		singerTypeRelaService.updateSingerTR(str);
		
	}

	/**
	 * ajax
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	@RequestMapping("/ajax_operation")
	public @ResponseBody List<Singer> findSingerAjax1(String pageIndex, String pageSize, String totalPage, String singerName) {
		//System.out.println(musicName);
		return ajax_common1(pageIndex, pageSize, totalPage, singerName);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<Singer> ajax_common1(String pageIndex, String pageSize, String totalPage, String singername) {
		List<Singer> singerList = new ArrayList<Singer>();
		//判断是否为搜索
		if(singername == "") {
			singerList = singerService.getAllSinger();
			
		}else {
			List<Singer> sl = singerService.getAllSinger();
			for(Singer s : sl) {
				if(s.getSingername().contains((singername))) {
					singerList.add(s);
				}
			}
		}
//		//获取对应的歌手
//		for(Music m : resultList) {
//			//System.out.println(m.getId());
//			Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid());
//			singerList.add(singer);
//		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		List<Singer> resultList = new ArrayList<Singer>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList = singerList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList = singerList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		
		return resultList;
	}
	
	/**
	 * 添加到歌手关注表
	 * @param musicid
	 * @param userid
	 * @return
	 */
	@RequestMapping("/addUserSinger")
	public @ResponseBody List<String> addUserSinger(String singerid, String userid) {
		UserSingerRela usr = new UserSingerRela();
		int userId = Integer.parseInt(userid);
		int singerId = Integer.parseInt(singerid);
		//System.out.println(userid + musicid);
		String message_coll = "";
		//判断用户是否已经收藏
		boolean flag = true;
		List<UserSingerRela> usrList = userSingerService.getUserSingerByUserid(userId);
		for(UserSingerRela u : usrList) {
			if(u.getSingerid() == singerId) {
				flag = false;
			}
		}
		
		if(flag) {
			usr.setSingerid(singerId);
			usr.setUserid(userId);
			message_coll += "收藏成功";
			userSingerService.addUserSinger(usr);
		}else {
			message_coll += "您已经收藏成功";
		}
		//System.out.println(message_coll);
		List<String> resultList = new ArrayList<String>();
 		resultList.add(message_coll);
		return resultList;
	}
}
