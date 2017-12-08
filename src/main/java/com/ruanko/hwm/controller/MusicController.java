package com.ruanko.hwm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruanko.hwm.bean.Admin;
import com.ruanko.hwm.bean.Collection;
import com.ruanko.hwm.bean.DownloadRela;
import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.bean.PlayRecord;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.service.ICollectionService;
import com.ruanko.hwm.service.IDownloadService;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.IMusicSingerService;
import com.ruanko.hwm.service.IMusicTypeRelationService;
import com.ruanko.hwm.service.IPlayRecordService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.LrcAnalyze;
import com.ruanko.hwm.utl.Upload_Download;
import com.ruanko.hwm.utl.LrcAnalyze.LrcData;

@Controller
@RequestMapping("/music")
public class MusicController {

	@Resource
	public IMusicService musicService;

	@Resource
	public ISingerService singerService;

	@Resource
	public IMusicSingerService musicSingerService;

	@Resource
	public IMusicTypeRelationService musicTypeService;

	@Resource
	public ICollectionService collectionService;
	
	@Resource
	public IDownloadService downloadService;
	
	@Resource
	public IPlayRecordService playRecordService;
	
	@Resource
	public IUserService userService;
		
	//每页项数
	private Integer pageSize = 5;
	
	private static Logger logger = Logger.getLogger(MusicController.class);
	/**
	 * 添加音乐
	 * 
	 * @param music
	 * @param image
	 * @param lrc
	 * @param song
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping({ "/doAddMusic/" })
	public String addMusic(@ModelAttribute("music") Music music, @RequestParam("imageInfo") MultipartFile image,
			@RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 保存音乐到数据库中
		Music mus = new Music();
		mus.setMusicname(music.getMusicname());
		mus.setPlaycounts(0);
		mus.setUploadtime(DateTime.getCurrentTime());
		mus.setLyr(music.getMusicname() + ".lrc");
		mus.setImg(music.getMusicname() + ".jpg");
		// 上传音乐相关文件
		// System.out.println(image.getName()+"---"+image.getContentType()+"---"+image.getOriginalFilename());
		// System.out.println(lrc.getOriginalFilename());
		String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		// 判断上传的文件类型
		if (!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message", "图片文件必须是jpg格式");
			model.addAttribute(new Music());
			//获取所有的歌手并返回前台
			List<Singer> singerList = singerService.getAllSinger();
			model.addAttribute("singerList", singerList);
			
			return "showAddMusic";
		} else if (!song.getContentType().equals("audio/mpeg")) {
			model.addAttribute("message", "音频文件必须是mp3格式");
			//获取所有的歌手并返回前台
			List<Singer> singerList = singerService.getAllSinger();
			model.addAttribute("singerList", singerList);
			model.addAttribute(new Music());
			return "showAddMusic";
		} else if (!s[1].equals("lrc") && !s[1].equals("krc")) {
			model.addAttribute("message", "歌词文件必须是lrc格式");
			//获取所有的歌手并返回前台
			List<Singer> singerList = singerService.getAllSinger();
			model.addAttribute("singerList", singerList);
			model.addAttribute(new Music());
			return "showAddMusic";
		}
		// 上传
		try {
			Upload_Download.upload_img(image, request, music.getMusicname());
			Upload_Download.upload_lrc(lrc, request, music.getMusicname());
			Upload_Download.upload_song(song, request, music.getMusicname());
		} catch (IOException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		}

		// 播放时长
		String time = Upload_Download
				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/static/music/song")
						+ "/" + music.getMusicname() + ".mp3"));
		mus.setMusictime(time);
		// 保存歌曲信息
		musicService.addMusic(mus);
		// 查询歌曲
		int musicId = 0;
		List<Music> musicList1 = musicService.getAllMusic();
		for (Music m : musicList1) {
			if (m.getMusicname().equals(mus.getMusicname())) {
				musicId = m.getId();
			}
		}

		// System.out.println(request.getSession().getServletContext().getRealPath("/WEB-INF/music"));
		// System.out.println(music.getMusicname());
		// 保存至歌曲类别表中
		String[] checkbox = request.getParameterValues("checkbox");
		// System.out.println(musicId);
		// for(String s1 : checkbox) {
		// System.out.println(s1);
		// }
		addMusicAndTypeToRela(checkbox, musicId);

		// 保存至歌曲歌手关联表
		int singerId = Integer.parseInt(request.getParameter("select"));
		MusicSingerRela msr = new MusicSingerRela();
		msr.setMusicid(musicId);
		msr.setSingerid(singerId);
		musicSingerService.addMS(msr);

		// System.out.println(mus.getMusicname() + mus.getMusictime() +
		// mus.getLyr() + mus.getImg() + mus.getPlaycounts() +
		// mus.getUploadtime());
		// System.out.println(song.getContentType());
		// System.out.println(Upload_Download.getMusicLength(new
		// File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
		// + "/" + song.getOriginalFilename())));
		// System.out.println(request.getParameter("select"));
		//获取所有的歌手并返回前台
		List<Singer> singerList = singerService.getAllSinger();
		model.addAttribute("singerList", singerList);
		model.addAttribute(new Music());
		model.addAttribute("message", "添加歌曲成功");
		return "showAddMusic";
	}

	/**
	 * 添加音乐到音乐类型关联表中
	 * 
	 * @param type
	 * @param mid
	 */
	public void addMusicAndTypeToRela(String[] type, Integer mid) {
		// System.out.println(mid);
		// for(String s1 : type) {
		// System.out.println(s1);
		// }

		for (String s : type) {
			MusicTypeRela mtr = new MusicTypeRela();
			mtr.setMusicid(mid);
			mtr.setTypeid(Integer.parseInt(s));
			musicTypeService.addMusicTR(mtr);
		}
	}

	/**
	 * 删除音乐
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/deleteMusic" })
	public String deleteMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music music = musicService.getMusicById(id);
		musicService.deleteMusic(id);
		// 删除歌曲相关文件
		//String root = request.getSession().getServletContext().getRealPath("/static/music");
		//String musicname = music.getMusicname();
		//Upload_Download.deleteFile(root + "/song/" + musicname + ".mp3");
		//Upload_Download.deleteFile(root + "/img/" + musicname + ".jpg");
		//Upload_Download.deleteFile(root + "/lrc/" + musicname + ".lrc");
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		logger.info("[AdminInfo:" + admin.getId() + "," + admin.getAdminname() + "] : delete the music[MusicInfo : " + music.getId() + "," + music.getMusicname() + "]");

		List<Music> musicList = musicService.getAllMusic();
		// System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", musicList.size());
		model.addAttribute(new Music());
		return "showManageMusic";
	}

	/**
	 * 修改音乐获取音乐
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/getMusic" })
	public String getMusic(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music music = musicService.getMusicById(id);

		// 获取所有的歌手并返回前台
		List<Singer> singerList = singerService.getAllSinger();
		model.addAttribute("singerList", singerList);

		List<Music> musicList = musicService.getAllMusic();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", musicList.size());
		model.addAttribute("musicList", musicList);
		model.addAttribute(music);
		return "showManageMusic";
	}

	/**
	 * 更新音乐
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/updateMusic" })
	public String updateMusic(@ModelAttribute("music") Music music, @RequestParam("imageInfo") MultipartFile image,
			@RequestParam("lrcInfo") MultipartFile lrc, @RequestParam("songInfo") MultipartFile song, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Music mus = musicService.getMusicById(id);

		mus.setMusicname(music.getMusicname());
		mus.setPlaycounts(mus.getPlaycounts());
		mus.setImg(music.getMusicname() + ".jpg");
		mus.setLyr(music.getMusicname() + ".lrc");
		mus.setUploadtime(DateTime.getCurrentTime());
		//System.out.println(image.getContentType());
		String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		// 判断上传的文件类型
		if (!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message", "图片文件必须是jpg格式");
			List<Music> musicList = musicService.getAllMusic();
			//System.out.println(musicList);
			model.addAttribute("musicList", musicList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", musicList.size());
			model.addAttribute(music);
			return "showManageMusic";
		} else if (!song.getContentType().equals("audio/mpeg")) {
			model.addAttribute("message", "音频文件必须是mp3格式");
			List<Music> musicList = musicService.getAllMusic();
			//System.out.println(musicList);
			model.addAttribute("musicList", musicList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", musicList.size());
			model.addAttribute(music);
			return "showManageMusic";
		} else if (!s[1].equals("lrc") && !s[1].equals("krc")) {
			model.addAttribute("message", "歌词文件必须是lrc格式");
			List<Music> musicList = musicService.getAllMusic();
			//System.out.println(musicList);
			model.addAttribute("musicList", musicList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", musicList.size());
			model.addAttribute(music);
			return "showManageMusic";
		}

		try {
			Upload_Download.upload_img(image, request, music.getMusicname());
			Upload_Download.upload_lrc(lrc, request, music.getMusicname());
			Upload_Download.upload_song(song, request, music.getMusicname());
		} catch (IOException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		}

		// 播放时长
		String time = Upload_Download
				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
						+ "/" + music.getMusicname() + ".mp3"));
		mus.setMusictime(time);

		musicService.updateMusic(mus);

		// 更新至歌曲类别表中
		String[] checkbox = request.getParameterValues("checkbox");
		// System.out.println(musicId);
		// for(String s1 : checkbox) {
		// System.out.println(s1);
		// }
		updateMusicAndTypeToRela(checkbox, id);

		// 更新至歌曲歌手关联表
		int singerId = Integer.parseInt(request.getParameter("select"));
		MusicSingerRela msr = musicSingerService.getSingerByMusicId(id);
		msr.setSingerid(singerId);
		musicSingerService.updateMS(msr);

		List<Music> musicList = musicService.getAllMusic();
		// System.out.println(musicList);
		model.addAttribute("musicList", musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", musicList.size());
		model.addAttribute("message", "修改成功");
		model.addAttribute(music);
		return "showManageMusic";
	}

	/**
	 * 添加音乐到音乐类型关联表中
	 * 
	 * @param type
	 * @param mid
	 */
	public void updateMusicAndTypeToRela(String[] type, Integer mid) {
		// System.out.println(mid);
		// for(String s1 : type) {
		// System.out.println(s1);
		// }

		for (String s : type) {
			MusicTypeRela mtr = new MusicTypeRela();
			mtr.setMusicid(mid);
			mtr.setTypeid(Integer.parseInt(s));
			musicTypeService.updateMusicTR(mtr);
		}
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
	public @ResponseBody List<Object> findMusicAjax1(String pageIndex, String pageSize, String totalPage, String musicName) {
		//System.out.println(musicName);
		return ajax_common1(pageIndex, pageSize, totalPage, musicName);
		
	}
	
	/**
	 * 获取歌词
	 * @param musicid
	 * @param request
	 * @return
	 */
	@RequestMapping({"/getMusicLrc"})
	public @ResponseBody List<String> getMusicLrcInfo(String musicid, HttpServletRequest request) {
		int id = Integer.parseInt(musicid);
		//获取歌曲和歌手
		Music music = musicService.getMusicById(id);
		//读取歌词传到前台
		String root = request.getSession().getServletContext().getRealPath("/static/music/lrc");
		//String lrc = Upload_Download.lrc2String(root + "//" +music.getLyr());
		//System.out.println(lrc);
		
		List<LrcData> lrcList = new LrcAnalyze(root + "//" +music.getLyr()).LrcGetList();
		List<String> lrcList1 = new ArrayList<String>();
		for(LrcData l:lrcList) {
			//System.out.println(l.LrcLine);
			lrcList1.add(l.LrcLine);
		}
		return lrcList1;
	}
	
	/**
	 * 获取歌曲和歌词信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/ajax_operation_getMusic")
	public @ResponseBody List<Object> findMusicAjax2(String musicid) {
		//System.out.println(musicName);
		//System.out.println(musicid);
		int musicId = Integer.parseInt(musicid);
		//获取音乐文件和歌手信息
		Music music = musicService.getMusicById(musicId);
		Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(musicId).getSingerid());
		
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(music);
		resultList.add(singer);
		
		return resultList;
	}
	
	@RequestMapping("/ajax_operation_addPlayCounts")
	public @ResponseBody int addPlayCountsAjax3(String musicid, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		int musicId = Integer.parseInt(musicid);
		Music music = musicService.getMusicById(musicId);
		//判断是否登录
		if(user != null) {
			//判断是否已有数据
			PlayRecord playRecord = new PlayRecord();
			List<PlayRecord> playRecordList = playRecordService.getPlayRecordByUserid(user.getId());
			boolean flag = false;
			for(PlayRecord pr : playRecordList) {
				if(pr.getMusicid() == musicId) {
					playRecord = pr;
					flag = true;
					break;
				}
			}
			if(flag){
				playRecord.setPlaycounts(playRecord.getPlaycounts() + 1);
				playRecord.setPlaytime(DateTime.getCurrentTime());
				//更新播放记录表
				playRecordService.uploadPlayRecord(playRecord);
			}else {
				playRecord.setMusicid(musicId);
				playRecord.setUserid(user.getId());
				playRecord.setPlaycounts(1);
				playRecord.setPlaytime(DateTime.getCurrentTime());
				//更新播放记录表
				playRecordService.addPlayRecord(playRecord);
			}
			//更新用户播放次数
			User user1 = userService.getUserById(user.getId());
			user1.setPlaycount(user1.getPlaycount() + 1);
			userService.updateUser(user1);
			
			
		}
			
		music.setPlaycounts(music.getPlaycounts()+1);
		musicService.updateMusic(music);
		
		return 1;
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<Object> ajax_common1(String pageIndex, String pageSize, String totalPage, String musicname) {
		List<Music> resultList = new ArrayList<Music>();
		List<Singer> singerList = new ArrayList<Singer>();
		//判断是否为搜索
		if(musicname == "") {
			resultList = musicService.getAllMusic();
			
		}else {
			List<Music> rl = musicService.getAllMusic();
			List<Singer> sl = singerService.getAllSinger();
			for(Music m : rl) {
				if(m.getMusicname().contains(musicname)) {
					resultList.add(m);
				}
			}
		}
		//获取对应的歌手
		for(Music m : resultList) {
			//System.out.println(m.getId());
			//System.out.println(musicSingerService.getSingerByMusicId(m.getId()).getSingerid());
			Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid());
			singerList.add(singer);
		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		List<Music> resultList1 = new ArrayList<Music>();
		List<Singer> resultList2 = new ArrayList<Singer>();
		List<Object> resultList3 = new ArrayList<Object>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList1 = resultList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
			resultList2 = singerList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList1 = resultList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
			resultList2 = singerList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		resultList3.add(resultList1);
		resultList3.add(resultList2);
		return resultList3;
	}
	
	/**
	 * 添加到收藏列表
	 * @param musicid
	 * @param userid
	 * @return
	 */
	@RequestMapping("/addCollection")
	public @ResponseBody List<String> addCollection(String musicid, String userid) {
		com.ruanko.hwm.bean.Collection coll = new Collection();
		int userId = Integer.parseInt(userid);
		int musicId = Integer.parseInt(musicid);
		//System.out.println(userid + musicid);
		String message_coll = "";
		//判断用户是否已经收藏
		boolean flag = true;
		List<Collection> collList = collectionService.getCollectionByUserid(userId);
		for(Collection c : collList) {
			if(c.getMusicid() == musicId) {
				flag = false;
			}
		}
		
		if(flag) {
			coll.setMusicid(musicId);
			coll.setUserid(userId);
			message_coll += "收藏成功";
			collectionService.addCollection(coll);
		}else {
			message_coll += "您已经收藏成功";
		}
		//System.out.println(message_coll);
		List<String> resultList = new ArrayList<String>();
 		resultList.add(message_coll);
		return resultList;
	}
	
	/**
	 * 添加列表到收藏列表
	 * @param musicid
	 * @param userid
	 * @return
	 */
	@RequestMapping("/addListCollection")
	public @ResponseBody List<String> addListCollection(String list) {
		//解析json数据
		String[] idList = list.split(",|\"|\\[|\\]");
		List<Integer> idList1 = new ArrayList<Integer>();
		for(String id : idList) {
			if(!id.equals("")){
				//System.out.println(id);
				idList1.add(Integer.parseInt(id));
			}
		}
		
		//收藏
		String message_coll = "";
		int userid = idList1.get(idList1.size()-1);
		List<Collection> collList = collectionService.getCollectionByUserid(userid);
		for(int i=0;i<idList1.size()-1;i++) {
			
			//判断用户是否已经收藏
			boolean flag = true;
			
			for(Collection c : collList) {
				if(c.getMusicid() == idList1.get(i)) {
					flag = false;
				}
			}
			
			if(flag) {
				com.ruanko.hwm.bean.Collection coll = new Collection();
				coll.setMusicid(idList1.get(i));
				coll.setUserid(userid);
				collectionService.addCollection(coll);
			}
		}
		
		message_coll += "收藏成功";
		//System.out.println(message_coll);
		List<String> resultList = new ArrayList<String>();
 		resultList.add(message_coll);
		return resultList;
	}
	
	
	/**
	 * 添加列表到收藏列表
	 * @param musicid
	 * @param userid
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/download1")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = request.getParameter("filename");
		//得到要下载的文件名
		int i =  Upload_Download.downloadByFilename(fileName, request, response);
		//System.out.println(fileName);
	}
	
	@RequestMapping("/download")
	public @ResponseBody List<String> download1(String userid, String musicid)  {
		int userId = Integer.parseInt(userid);
		int musicId = Integer.parseInt(musicid);
		//得到要下载的文件名
		String fileName = musicService.getMusicById(musicId).getMusicname(); 
		//System.out.println(fileName);
		List<String> resultList = new ArrayList<String>();
		//System.out.println(fileName);
		resultList.add(fileName);
		//获取该用户的下载列表
		boolean flag = false;//判断是否重复
		List<DownloadRela> downloadList = downloadService.getDownloadRelaByUserid(userId);
		DownloadRela download = new DownloadRela();
		for(DownloadRela d : downloadList) {
			if(d.getMusicid() == musicId) {
				download = downloadService.getDownloadById(d.getId());
				flag = true;
				break;
			}
		}
		
		if(flag) {
			download.setCounts(download.getCounts() + 1);
			download.setDownloadtime(DateTime.getCurrentTime());
			//保存下载记录到数据库
			downloadService.updateDownloadRela(download);
		}else {
			download.setUserid(Integer.parseInt(userid));
			download.setMusicid(Integer.parseInt(musicid));
			download.setDownloadtime(DateTime.getCurrentTime());
			download.setCounts(1);
			//保存下载记录到数据库
			downloadService.addDownloadRela(download);
		}
		
		
		return resultList;
	}
	
}
