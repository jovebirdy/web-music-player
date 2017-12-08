package com.ruanko.hwm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruanko.hwm.bean.Comments;
import com.ruanko.hwm.bean.CustomException;
import com.ruanko.hwm.bean.DownloadRela;
import com.ruanko.hwm.bean.LoveRela;
import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.MusicSingerRela;
import com.ruanko.hwm.bean.MusicType;
import com.ruanko.hwm.bean.MusicTypeRela;
import com.ruanko.hwm.bean.PlayRecord;
import com.ruanko.hwm.bean.SignRela;
import com.ruanko.hwm.bean.Singer;
import com.ruanko.hwm.bean.SingerType;
import com.ruanko.hwm.bean.SingerTypeRela;
import com.ruanko.hwm.bean.User;
import com.ruanko.hwm.bean.UserSingerRela;
import com.ruanko.hwm.service.ICollectionService;
import com.ruanko.hwm.service.ICommentService;
import com.ruanko.hwm.service.IDownloadService;
import com.ruanko.hwm.service.ILoveRelaService;
import com.ruanko.hwm.service.IMusicService;
import com.ruanko.hwm.service.IMusicSingerService;
import com.ruanko.hwm.service.IMusicTypeRelationService;
import com.ruanko.hwm.service.IMusicTypeService;
import com.ruanko.hwm.service.IPlayRecordService;
import com.ruanko.hwm.service.ISignService;
import com.ruanko.hwm.service.ISingerService;
import com.ruanko.hwm.service.ISingerTypeRelaService;
import com.ruanko.hwm.service.ISingerTypeService;
import com.ruanko.hwm.service.IUserService;
import com.ruanko.hwm.service.IUserSingerService;
import com.ruanko.hwm.test1.TestAdmin;
import com.ruanko.hwm.utl.DateTime;
import com.ruanko.hwm.utl.LrcAnalyze;
import com.ruanko.hwm.utl.LrcAnalyze.LrcData;
import com.ruanko.hwm.utl.MD5Util;
import com.ruanko.hwm.utl.Upload_Download;

@Controller
@RequestMapping("/home")
public class UserController {
	
	@Resource
	private IUserService userService;
	@Resource
	private IMusicTypeRelationService musicTypeRelaService;
	@Resource
	private IMusicTypeService musicTypeService;
	@Resource
	private IMusicService musicService;
	@Resource
	private ISingerTypeService singerTypeService;
	@Resource
	private ISingerService singerService;
	@Resource
	private ISingerTypeRelaService singerTypeRelaService;
	@Resource
	private ICollectionService collectionService;
	@Resource
	private IUserSingerService userSingerService;
	@Resource
	private IMusicSingerService musicSingerService;
	@Resource
	private IDownloadService downloadService;
	@Resource
	private ICommentService commentService;
	@Resource
	private ILoveRelaService loveRelaService;
	
	@Resource
	private IPlayRecordService playRecordService;
	
	@Resource
	private ISignService signService;
	
	//每页项数
	private Integer pageSize = 5;
	
	private static Logger logger = Logger.getLogger(UserController.class);
	
	/**
	 * 删除用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/deleteUser" })
	public String deleteUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);
		userService.deleteUserById(id);
		// 删除歌曲相关文件
		String root = request.getSession().getServletContext().getRealPath("/WEB-INF/user");
		String username = user.getUsername();
		if(user.getImg() != "" && user.getImg() != null) {
			Upload_Download.deleteFile(root + "/img/" + username + ".jpg");
		}
		

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute(new User());
		return "showManageUser";
	}
	//获得当前用户的资料
	@RequestMapping({ "/personMsg" })
	public String toPersonMsg(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		User currentUser=(User)session.getAttribute("user");
		currentUser = userService.getUserById(currentUser.getId());
		// 删除歌曲相关文件
		//System.out.println("返回当前用户信息");
		//System.out.println(currentUser.toString());
		model.addAttribute("currentUser", currentUser);
		
		model.addAttribute(new User());
		return "currentUserMsg";
	}
	
	@RequestMapping({"/personMsg/rf"})
	public String toPersonMsg1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "我的音乐");
		model.addAttribute("url", request.getRequestURL().toString().split("\\/rf")[0]);
		//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	//修改当前用户的资料
	@RequestMapping({ "/updateUserInfo" })
	public String toUpdateCurrentUser(@ModelAttribute("user") User user ,@RequestParam("imageInfo") MultipartFile image, Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User us = userService.getUserById(id);
		
		us.setAge(user.getAge());
		us.setEmail(user.getEmail());
		us.setTel(user.getTel());
		
		
		
		//System.out.println(image.getContentType());
		//String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		System.out.println(image.getSize());
		if(image.getSize() == 0){
			Upload_Download.updateFileName(us.getUsername(), user.getUsername(), request);
		}else {
			if (!image.getContentType().equals("image/jpeg")) {
				model.addAttribute("message", "图片文件必须是jpg格式");
				model.addAttribute(user);
				return toPersonMsg(model,request,response);
			} 

			try {
				Upload_Download.upload_img2(image, request, user.getUsername());
			} catch (IOException e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			}
			
			
			
		}
		us.setUsername(user.getUsername());
		us.setImg(user.getUsername() + ".jpg");
		userService.updateUser(us);
		
		model.addAttribute(new User());
		return toMyMusic(model, request);
	}
	/**
	 * 修改用户获取用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/getUser" })
	public String getUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(id);

//		// 获取所有的歌手并返回前台
//		List<Singer> singerList = singerService.getAllSinger();
//		model.addAttribute("singerList", singerList);

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute("singerList", userList);
		model.addAttribute("user",user);
		return "showManageUser";
	}

	/**
	 * 更新用户
	 * 
	 * @param model
	 * @param request
	 * @param response
	 */
	@RequestMapping({ "/updateUser" })
	public String updateMusic(@ModelAttribute("user") User user, @RequestParam("imageInfo") MultipartFile image, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User us = userService.getUserById(id);
		
		us.setAge(user.getAge());
		us.setEmail(user.getEmail());
		us.setImg(user.getUsername() + ".jpg");
		us.setTel(user.getTel());
		us.setUsername(user.getUsername());
		
		
		//System.out.println(image.getContentType());
		//String s[] = lrc.getOriginalFilename().split("\\.");
		// System.out.println(s.length);
		// 判断上传的文件类型
		if (!image.getContentType().equals("image/jpeg")) {
			model.addAttribute("message", "图片文件必须是jpg格式");
			List<User> userList = userService.findAllUser();
			//System.out.println(musicList);
			model.addAttribute("userList", userList);
			model.addAttribute("pageSize", pageSize);
	  		model.addAttribute("counts", userList.size());
			model.addAttribute(user);
			return "showManageUser";
		} 

		try {
			Upload_Download.upload_img2(image, request, user.getUsername());
		} catch (IOException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		}

		// 播放时长
//		String time = Upload_Download
//				.getMusicLength(new File(request.getSession().getServletContext().getRealPath("/WEB-INF/music/song")
//						+ "/" + music.getMusicname() + ".mp3"));
//		mus.setMusictime(time);

		userService.updateUser(us);

//		// 更新至歌曲类别表中
//		String radio = request.getParameter("radio");
//		// System.out.println(musicId);
//		// for(String s1 : checkbox) {
//		// System.out.println(s1);
//		// }
//		updateSingerAndTypeToRela(radio, id);

		// 更新至歌曲歌手关联表
//		int singerId = Integer.parseInt(request.getParameter("select"));
//		MusicSingerRela msr = new MusicSingerRela();
//		msr.setMusicid(id);
//		msr.setSingerid(singerId);
//		musicSingerService.updateMS(msr);

		List<User> userList = userService.findAllUser();
		// System.out.println(musicList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageSize", pageSize);
  		model.addAttribute("counts", userList.size());
		model.addAttribute("message", "修改成功");
		model.addAttribute(user);
		return "showManageUser";
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
	public @ResponseBody List<User> findSingerAjax1(String pageIndex, String pageSize, String totalPage, String userName) {
		//System.out.println(musicName);
		return ajax_common1(pageIndex, pageSize, totalPage, userName);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<User> ajax_common1(String pageIndex, String pageSize, String totalPage, String username) {
		List<User> userList = new ArrayList<User>();
		//判断是否为搜索
		if(username == "") {
			userList = userService.findAllUser();
			
		}else {
			List<User> sl = userService.findAllUser();
			for(User u : sl) {
				if(u.getUsername().contains((username))) {
					userList.add(u);
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
		List<User> resultList = new ArrayList<User>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList = userList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList = userList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		
		return resultList;
	}
	
	
	@RequestMapping("/ajax_musicList_operation/")
	public @ResponseBody List<Music> findMusicAjax1(String pageIndex, String pageSize, String totalPage, String cat) {
		//System.out.println(musicName);
		return ajax_common_musicList(pageIndex, pageSize, totalPage, cat);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<Music> ajax_common_musicList(String pageIndex, String pageSize, String totalPage, String cat) {
		List<Music> musicList = new ArrayList<Music>();
		//判断是否为搜索
		if(cat.equals("0")) {
			musicList = musicService.getAllMusic();
			//System.out.println("adfsfds");
		}else {
			Integer catid = Integer.parseInt(cat);
			//System.out.println(id);
			//根据id获取歌曲类别信息
			//String typeName = musicTypeService.getMusicTypeById(catid).getTypename();
			//获取歌曲列表
			List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(catid);
			for(MusicTypeRela m : mtrList) {
				musicList.add(musicService.getMusicById(m.getMusicid()));
			}
		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		//System.out.println(totalPage1);
		//System.out.println(musicList.size());
		List<Music> resultList = new ArrayList<Music>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList = musicList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList = musicList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		
		return resultList;
	}
	
	@RequestMapping("/ajax_album_operation/")
	public @ResponseBody List<Music> findAlbumAjax1(String pageIndex, String pageSize, String totalPage, String cat) {
		//System.out.println(musicName);
		return ajax_common_albumList(pageIndex, pageSize, totalPage, cat);
		
	}
	
	/**
	 * 返回每页的数据
	 * @param pageIndex
	 * @param pageSize
	 * @param totalPage
	 * @return
	 */
	public List<Music> ajax_common_albumList(String pageIndex, String pageSize, String totalPage, String cat) {
		List<Music> musicList = new ArrayList<Music>();
		//判断是否为搜索
		if(cat.equals("0")) {
			musicList = musicService.getAllMusic();
			//System.out.println("adfsfds");
		}else {
			Integer catid = Integer.parseInt(cat);
			//System.out.println(id);
			//根据id获取歌曲类别信息
			//String typeName = musicTypeService.getMusicTypeById(catid).getTypename();
			//获取歌曲列表
			List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(catid);
			for(MusicTypeRela m : mtrList) {
				musicList.add(musicService.getMusicById(m.getMusicid()));
			}
		}
		
		Integer pageIndex1 = Integer.parseInt(pageIndex);
		Integer pageSize1 = Integer.parseInt(pageSize);
		Integer totalPage1 = Integer.parseInt(totalPage);
		//System.out.println(totalPage1);
		//System.out.println(musicList.size());
		Collections.sort(musicList, new Comparator<Music>(){
            public int compare(Music arg0, Music arg1) {
                return arg1.getUploadtime().compareTo(arg0.getUploadtime()); 
            }  
        });
		List<Music> resultList = new ArrayList<Music>();
		if (pageIndex1 <= totalPage1 / pageSize1) {
			resultList = musicList.subList((pageIndex1 - 1) * pageSize1, pageIndex1 * pageSize1);
		} else {
			resultList = musicList.subList((pageIndex1 - 1) * pageSize1, totalPage1);
		}
		
		return resultList;
	}
	
	@RequestMapping({"/discover/"})
	public String toHome(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute("url", request.getRequestURL()+"1");
		logger.info(request.getRemoteAddr() + " : visit the websit");
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/1"})
	public String toHome1(Model model, HttpServletRequest request) {
		List<Object> resultList = new ArrayList<Object>();
		List<Music> musicList1 = new ArrayList<Music>();
		//List<Singer> singerList = new ArrayList<Singer>();
		List<Music> musicList_all = musicService.getAllMusic();
		//获取十首热门歌曲
		Collections.sort(musicList_all);
		musicList1 = musicList_all.subList(0, musicList_all.size() > 8 ? 8 : musicList_all.size());
		//resultList.add(musicList1);

		//获取十首新碟
		musicList_all = musicService.getAllMusic();
		List<Music> musicList2 = new ArrayList<Music>();
		Collections.sort(musicList_all, new Comparator<Music>(){
            public int compare(Music arg0, Music arg1) {
                int i = arg1.getUploadtime().compareTo(arg0.getUploadtime()); 
                if(i<0 || i>0) {
                	return i;
                }else {
                	return arg1.getPlaycounts().compareTo(arg0.getPlaycounts()) ;
                }
            }
        });
		musicList2 = musicList_all.subList(0, musicList_all.size() > 10 ? 10 : musicList_all.size());
		//resultList.add(musicList2);
		
		//获取榜单歌曲
		musicList_all = musicService.getAllMusic();
		//Collections.sort(musicList_all);
		List<Music> musicList3 = new ArrayList<Music>();
		musicList3 = musicList_all.subList(0, musicList_all.size() > 10 ? 10 : musicList_all.size());
		//resultList.add(musicList3);
		
		musicList_all = musicService.getAllMusic();
		List<Music> musicList4 = new ArrayList<Music>();
		List<Music> musicList5 = new ArrayList<Music>();
			
		Collections.sort(musicList_all, new Comparator<Music>(){
		    public int compare(Music arg0, Music arg1) {
		       return arg1.getUploadtime().compareTo(arg0.getUploadtime());
		    }
		});
		musicList4 = musicList_all.subList(0, musicList_all.size() > 10 ? 10 : musicList_all.size());
		//resultList.add(musicList4);		
		//获取入驻歌手
		List<Singer> singerList_all = singerService.getAllSinger();
		List<Singer> singerList = singerList_all.subList(0, singerList_all.size() > 5 ? 5 : singerList_all.size()); 
		
		//获取收藏、关注、下载的数量
		HttpSession session= request.getSession();
		User currentUser=(User)session.getAttribute("user");
		if(currentUser != null) {
			List<Music> musicList_l= new ArrayList<Music>();//musicService.findMusicByUserId(currentUser.getId());
			List<Singer> singerList_l = new ArrayList<Singer>();
			//获取收藏歌单
			List<com.ruanko.hwm.bean.Collection> collectionList = collectionService.getCollectionByUserid(currentUser.getId());
			
			//获取关注的歌手
			List<UserSingerRela> userSinger = new ArrayList<UserSingerRela>();
			userSinger = userSingerService.getUserSingerByUserid(currentUser.getId());
			
			//获取下载的歌曲信息
			List<DownloadRela> downloadList = downloadService.getDownloadRelaByUserid(currentUser.getId());
			
			model.addAttribute("size1_l",collectionList.size());
			model.addAttribute("size2_l", userSinger.size());
			model.addAttribute("size3_l", downloadList.size());
		}
		
		
		model.addAttribute("singerList", singerList);
		model.addAttribute("musicList1", musicList1);
		model.addAttribute("musicList2", musicList2);
		model.addAttribute("musicList3", musicList3);
		model.addAttribute("musicList4", musicList4);
		model.addAttribute("musicList5", musicList5);
		model.addAttribute("title", "心随乐动");
		model.addAttribute(new User());
		return "showHome1";
	}
	@RequestMapping({"/discover/rankList"})
	public String toRankList(Model model, HttpServletRequest request) throws Exception {
		
		int cat = 1;
		
		//String imgPath = "";
		//String info = "";
		List<Music> musicList = new ArrayList<Music>();
		List<Singer> singerList = new ArrayList<Singer>();
		List<Music> musicList_all = musicService.getAllMusic();
		if(request.getParameter("cat") == null) {
//			typeName += "心动飙升榜";
//			imgPath += "soar_big";
//			info += "根据歌曲的播放次数排序";
			//cat = 1;
			Collections.sort(musicList_all);
			musicList = musicList_all.subList(0, musicList_all.size() > 20 ? 20 : musicList_all.size());
			singerList = new ArrayList<Singer>();
			for(Music m : musicList ) {
				//System.out.println(m.getId());
				//System.out.println(musicSingerService.getSingerByMusicId(m.getId()));
				if(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()) == null) {
					throw new CustomException("歌手的信息不存在!");  
				}
				singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
			}
		}else {
//			String cat1 = "";
//			if(request.getParameter("cat").contains("/rf")){
//				cat1 += cat1.split("\\/rf")[0];
//			}
			Integer id = Integer.parseInt(request.getParameter("cat"));
			if(id == 2) {
//				typeName += "心动新歌榜";
//				imgPath += "newMusic_big";
//				info += "根据歌曲的播放次数排序";
				cat = 2;
				//List<Music> musicList_all = musicService.getAllMusic();
				Collections.sort(musicList_all, new Comparator<Music>(){
		            public int compare(Music arg0, Music arg1) {
		                return arg1.getUploadtime().compareTo(arg0.getUploadtime());
		            }
		        });
				musicList = musicList_all.subList(0, musicList_all.size() > 20 ? 20 : musicList_all.size());
				singerList = new ArrayList<Singer>();
				for(Music m : musicList ) {
					if(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()) == null) {
						throw new CustomException("歌手的信息不存在!");  
					}
					singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
				}
			}else if(id == 3) {
				cat = 3;
				Map<Integer, Integer> coll_music = new HashMap<Integer, Integer>();  
				List<com.ruanko.hwm.bean.Collection> collectionList = collectionService.getAllCollection();
				//获取每首歌的被收藏数量
				for(Music m : musicList_all) {
					int count = 0;
					for(com.ruanko.hwm.bean.Collection c : collectionList ) {
						if(c.getMusicid() == m.getId()) {
							count++;
						}
					}
					
					coll_music.put(m.getId(), count);
				}
				//降序排序
				List<Map.Entry<Integer, Integer>> list = new ArrayList<Map.Entry<Integer, Integer>>(coll_music.entrySet());
			
				Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
					public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
						return o2.getValue().compareTo(o1.getValue());
					}
				});
				
				for(Map.Entry<Integer, Integer> m : list) {
					//System.out.println(m.getValue());
					musicList.add(musicService.getMusicById(m.getKey()));
				}
				musicList = musicList.subList(0, musicList_all.size() > 20 ? 20 : musicList_all.size());
				singerList = new ArrayList<Singer>();
				for(Music m : musicList ) {
					if(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()) == null) {
						throw new CustomException("歌手的信息不存在!");  
					}
					singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
				}
			}
		}
		
		
		model.addAttribute("cat",cat);
		model.addAttribute("musicList", musicList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("title", "排行榜");
		model.addAttribute(new User());
		 
		return "showRank";
	}
	
	@RequestMapping({"/discover/musicList"})
	public String toMusicList(Model model, HttpServletRequest request) {
  		int counts = 0;
		String typeName = "";
		int size = 0;
		String cat = "";
		//System.out.println(size);
		List<Music> musicList = new ArrayList<Music>();
		if(request.getParameter("cat") == null) {
			typeName += "全部";
			musicList = musicService.getAllMusic();
			counts = musicList.size();
			size = musicList.size();
			cat += "";
		}else {
			Integer id = Integer.parseInt(request.getParameter("cat"));
			cat += id.toString();
			//System.out.println(id);
			//根据id获取歌曲类别信息
			typeName = musicTypeService.getMusicTypeById(id).getTypename();
			//获取歌曲列表
			List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(id);
			for(MusicTypeRela m : mtrList) {
				musicList.add(musicService.getMusicById(m.getMusicid()));
			}
			size = mtrList.size();
			counts = size;
		}
		model.addAttribute("cat", cat);
		model.addAttribute("pageSize", 20);
		model.addAttribute("counts", counts);
		model.addAttribute("typeName", typeName);
		model.addAttribute("musicList", musicList);
		model.addAttribute("size", (int)Math.ceil(size*1.0/5));
		model.addAttribute("title", "歌单");
		model.addAttribute(new User());
		return "showMusicList";
	}
	
	@RequestMapping({"/discover/radio"})
	public String toRadio(Model model, HttpServletRequest request) {
		model.addAttribute("title", "电台");
		model.addAttribute(new User());
		return "showRadio";
	}
	
	@RequestMapping({"/discover/singer"})
	public String toSinger(Model model, HttpServletRequest request) {
		String typeName = "";
		List<Singer> singerList = new ArrayList<Singer>();
		if(request.getParameter("cat") == null) {
			model.addAttribute("title", "推荐");
			//获取singerList1,singerList2,size
			int length = singerService.getAllSinger().size();
			//获取入驻歌手
			List<Singer> singerList1 = singerService.getAllSinger().subList(0, (length > 10 ? 10: length));
			int size = (int)Math.ceil(length*1.0/5);
			//System.out.println(size);
			//获取热门歌手
			List<Singer> singerList_2 = singerService.getAllSinger();
			Collections.sort(singerList_2);  
			//List<Singer> singerList2 = singerList_2.subList(0, (length > 9 ? 9: length));
		
			model.addAttribute("size", size);
			model.addAttribute("singerList1", singerList1);
			model.addAttribute("singerList2", singerList_2);
			model.addAttribute(new User());
			
			return "showSinger1";
		}else if(Integer.parseInt(request.getParameter("cat")) == 0){
			model.addAttribute("title", "入驻新歌");
			int length = singerService.getAllSinger().size();
			List<Singer> singerList1 = singerService.getAllSinger();
			int size = (int)Math.ceil(length*1.0/5);
			model.addAttribute("size", size);
			model.addAttribute("singerList1", singerList1);
			model.addAttribute(new User());
			
			return "showSinger2";
			
		}else {
			int id = Integer.parseInt(request.getParameter("cat"));
			typeName = singerTypeService.getSingerTypeById(id).getTypename();
			List<SingerTypeRela> singerTypeRelaList = singerTypeRelaService.getSingerByTypeId(id);
			for(SingerTypeRela s : singerTypeRelaList) {
				singerList.add(singerService.getSingerById(s.getSingerid()));
			}
		}
		
		model.addAttribute("typeName", typeName);
		model.addAttribute("singerList", singerList);
		model.addAttribute("title", "歌手");
		model.addAttribute(new User());
		return "showSinger";
	}

	
	@RequestMapping({"/discover/album"})
	public String toAlbum(Model model, HttpServletRequest request) {
//			typeName += "心动新歌榜";
//			imgPath += "newMusic_big";
//			info += "根据歌曲的播放次数排序";
			//cat = 2;
			//List<Music> musicList_all = musicService.getAllMusic();
			List<Music> musicList = new ArrayList<Music>();
			//List<Singer> singerList = new ArrayList<Singer>();
			List<Music> musicList_all = musicService.getAllMusic();
			String cat = request.getParameter("cat");
			List<Music> musicList_all_1 = new  ArrayList<Music>();
			if(cat == null || cat.equals("0")) {
				musicList_all_1 = musicList_all;
			}else {
				int catid = Integer.parseInt(cat);
				List<MusicTypeRela> mtrList = musicTypeRelaService.getMusicByTypeId(catid);
				for(MusicTypeRela mtr1 : mtrList) {
					musicList_all_1.add(musicService.getMusicById(mtr1.getMusicid()));
				}
			}
			
			Collections.sort(musicList_all, new Comparator<Music>(){
	            public int compare(Music arg0, Music arg1) {
	                int i = arg1.getUploadtime().compareTo(arg0.getUploadtime()); 
	                if(i<0 || i>0) {
	                	return i;
	                }else {
	                	return arg1.getPlaycounts().compareTo(arg0.getPlaycounts()) ;
	                }
	            }
	        });
			
			Collections.sort(musicList_all_1, new Comparator<Music>(){
	            public int compare(Music arg0, Music arg1) {
	                return arg1.getUploadtime().compareTo(arg0.getUploadtime()); 
	            }  
	        });
			
			musicList = musicList_all.subList(0, musicList_all.size() > 10 ? 10 : musicList_all.size());
			//singerList = new ArrayList<Singer>();
//			for(Music m : musicList ) {
//				singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
//			}
		int size = (int)Math.ceil(musicList_all_1.size()*1.0/5);
		
		model.addAttribute("pageSize", 20);
		model.addAttribute("counts", musicList_all_1.size());
		model.addAttribute("cat", cat);
		model.addAttribute("size", size);
		model.addAttribute("musicList", musicList);
		model.addAttribute("musicList_all_1", musicList_all_1);
		model.addAttribute("title", "新碟上架");
		model.addAttribute(new User());
		return "showAlbum";
	}
	
	
	
	
	@RequestMapping({"/discover/1/rf"})
	public String toHome11(Model model, HttpServletRequest request) {
		model.addAttribute("title", "心随乐动");
		model.addAttribute("url", request.getRequestURL().toString().split("\\/rf")[0]);
		//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	@RequestMapping({"/discover/rankList/rf"})
	public String toRankList1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "排行榜");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/musicList/rf"})
	public String toMusicList1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌单");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/radio/rf"})
	public String toRadio1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "电台");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/singer/rf"})
	public String toSinger1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "歌手");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	@RequestMapping({"/discover/album/rf"})
	public String toAlbum1(Model model, HttpServletRequest request) {
		model.addAttribute("title", "新碟上架");
		model.addAttribute("url", request.getRequestURL().toString().split("/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	@RequestMapping({"/myMusic/rf"})
	public String toMyMusic11(Model model, HttpServletRequest request) {
		model.addAttribute("title", "我的音乐");
		model.addAttribute("url", request.getRequestURL().toString().split("\\/rf")[0]);
		//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
		model.addAttribute(new User());
		return "showHome";
	}
	
	
	@RequestMapping({"/music"})
	public String toMusic(Model model, HttpServletRequest request) {
		if(!request.getParameter("id").contains("/rf")) {
			int id = Integer.parseInt(request.getParameter("id"));
			//获取歌曲和歌手
			Music music = musicService.getMusicById(id);
			Singer singer = singerService.getSingerById(musicSingerService.getSingerByMusicId(id).getSingerid());
			//获取所属分类
			List<MusicTypeRela> musicTypeRela = musicTypeRelaService.getMusicTypeByMusicId(id);
			List<MusicType> musicType = new ArrayList<MusicType>();
			for(MusicTypeRela mtr : musicTypeRela) {
				musicType.add(musicTypeService.getMusicTypeById(mtr.getTypeid()));
			}
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
			
			//获取评论信息
			
			//查询出该歌曲的所有评论
			List<Comments> commentsList = commentService.getCommentsListByMusicId(id);
			List<User> userList = new ArrayList<User>();
			for(Comments c : commentsList) {
				userList.add(userService.getUserById(c.getUserid()));
			}
			
			
			model.addAttribute("commentList", commentsList);
			model.addAttribute("userList", userList);
			model.addAttribute("lrcList", lrcList1);
			model.addAttribute("musicType", musicType);
			model.addAttribute("title", music.getMusicname());
			model.addAttribute("music", music);
			model.addAttribute("singer", singer);
			model.addAttribute(new User());
			return "showMusicInfo";
		}else {
			model.addAttribute("title", "心随乐动");
			model.addAttribute("url", request.getRequestURL().toString() + "?id=" +request.getParameter("id").split("\\/rf")[0]);
			//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
			model.addAttribute(new User());
			return "showHome";
		}
	}
	
	
	
	
	@RequestMapping({"/singer"})
	public String toSingerMess(Model model, HttpServletRequest request) {
		if(!request.getParameter("id").contains("/rf")) {
			int id = Integer.parseInt(request.getParameter("id"));
			//获取歌手id
			//System.out.println(id);
			Singer singer = singerService.getSingerById(id);
			List<Music> musicList = new ArrayList<Music>();
			List<MusicSingerRela> musicSinger = musicSingerService.getMusicBySingerId(id);
			for(MusicSingerRela msr : musicSinger) {
				musicList.add(musicService.getMusicById(msr.getMusicid()));
			}
			//获取相似歌曲
			int singerTypeId = singerTypeRelaService.getSingerTypeBySingerId(id).getTypeid();
			//System.out.println(singerTypeId);
			List<SingerTypeRela> strList = singerTypeRelaService.getSingerByTypeId(singerTypeId);
			
			List<Singer> singerList = new ArrayList<Singer>();
			//移除
			Iterator<SingerTypeRela> it = strList.iterator();
			while(it.hasNext()) {
				SingerTypeRela str = it.next();
				if(str.getSingerid() == id)
					it.remove();
			}
			//随机获取四首歌
			//获取四个随机数
			Set<Integer> set = new TreeSet<Integer>();
			while (set.size() < 4) {
				int number = (int) (Math.random() * strList.size());
				if (!set.contains(number)) {
					set.add(number);
				}
			}
			for(Integer in : set){
				//System.out.println(random);
				singerList.add(singerService.getSingerById(strList.get(in).getSingerid()));
			}
	//		for(Singer s:singerList){
	//			System.out.println(s.getSingername());
	//		}
			model.addAttribute("singerList", singerList);
			model.addAttribute("musicList",musicList);
			model.addAttribute("title", singer.getSingername());
			model.addAttribute("introduction",singer.getIntroduction());
			model.addAttribute("singer",singer);
			model.addAttribute(new User());
			return "showSingerInfo";
		}else {
			model.addAttribute("title", "心随乐动");
			model.addAttribute("url", request.getRequestURL().toString() + "?id=" +request.getParameter("id").split("\\/rf")[0]);
			//System.out.println(request.getRequestURL().toString().split("\\/rf")[0]);
			model.addAttribute(new User());
			return "showHome";
		}
	}

	@RequestMapping({"/logup"})
	public String toLogup(Model model, HttpServletRequest request) {
		model.addAttribute("title", "用户注册");
		model.addAttribute(new User());
		return "showLogup";
	}
	@RequestMapping({"/doLogup"}) //用户注册
	public String doLogup(@ModelAttribute("user") User user, Model model, HttpServletRequest request){
		System.out.println(user.getUsername());
		User user1 = userService.getUserByName(user.getUsername());
		String message = "";
		if(user1 == null){
			user.setPassword(MD5Util.getMD5Code(user.getPassword()));
			user.setImg("0");
			user.setLevel(0);
			user.setGrade(0);
			user.setPlaycount(0);
			userService.addUser(user);
			message = "注册成功！";
			model.addAttribute("message",message);
		}
		else{
			message = "该用户名已经存在";
			model.addAttribute("message",message);
			
		}
		model.addAttribute(new User());
		return "showLogup";
	}
	
	//点击我的音乐，显示用户的歌单情况
	@RequestMapping({"/myMusic"})
	public String toMyMusic(Model model, HttpServletRequest request) {
		HttpSession session= request.getSession();
		User currentUser=(User)session.getAttribute("user");
		if(currentUser == null) {
			model.addAttribute("title", "我的音乐");
			model.addAttribute(new User());
			return "showMusicListOfUser";
		}else {
			List<Music> musicList= new ArrayList<Music>();//musicService.findMusicByUserId(currentUser.getId());
			List<Singer> singerList = new ArrayList<Singer>();
			//获取收藏歌单
			List<com.ruanko.hwm.bean.Collection> collectionList = collectionService.getCollectionByUserid(currentUser.getId());
			for(com.ruanko.hwm.bean.Collection c : collectionList) {
				musicList.add(musicService.getMusicById(c.getMusicid()));
			}
			
			for(Music m : musicList) {
				singerList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
			}
			model.addAttribute("musicList", musicList);
			//System.out.println(musicList.size());
			//System.out.println((int)Math.ceil(musicList.size()*1.0/3));
			model.addAttribute("size1", (int)Math.ceil(musicList.size()*1.0/3));
			model.addAttribute("singerList", singerList);
			
			//获取关注的歌手
			List<UserSingerRela> userSinger = new ArrayList<UserSingerRela>();
			userSinger = userSingerService.getUserSingerByUserid(currentUser.getId());
			List<Singer> singerList1 = new ArrayList<Singer>();
			for(UserSingerRela usr : userSinger) {
				singerList1.add(singerService.getSingerById(usr.getSingerid()));
			}
			model.addAttribute("size2", (int)Math.ceil(singerList1.size()*1.0/3));
			model.addAttribute("singerList1", singerList1);	
			
			//获取下载的歌曲信息
			List<DownloadRela> downloadList = downloadService.getDownloadRelaByUserid(currentUser.getId());
			List<Music> musicList1 = new ArrayList<Music>();
			List<Singer> singerList2 = new ArrayList<Singer>();
			for(DownloadRela d : downloadList) {
				musicList1.add(musicService.getMusicById(d.getMusicid()));
			}
			
			for(Music m : musicList1) {
				singerList2.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
			}
			
			//获取用户的播放记录
			List<PlayRecord> playRecordList = playRecordService.getPlayRecordByUserid(currentUser.getId());
			List<Music> musicRecordList = new ArrayList<Music>();
			List<Singer> singerRecordList = new ArrayList<Singer>();
			for(PlayRecord pr : playRecordList) {
				musicRecordList.add(musicService.getMusicById(pr.getMusicid()));
			}
			
			for(Music m : musicRecordList) {
				singerRecordList.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
			}
			
			model.addAttribute("musicRecordList", musicRecordList);
			model.addAttribute("singerRecordList", singerRecordList);
			model.addAttribute("playRecordList", playRecordList);
			model.addAttribute("size_record", (int)Math.ceil(playRecordList.size()*1.0/3));
			
			
			//返回用户信息
			User user1 = userService.getUserById(currentUser.getId());
			model.addAttribute("user1", user1);
			model.addAttribute("musicList1", musicList1);
			model.addAttribute("size3", (int)Math.ceil(musicList1.size()*1.0/3));
			model.addAttribute("singerList2", singerList2);
			model.addAttribute("downloadList", downloadList);
			
			model.addAttribute("title", "我的音乐");
			model.addAttribute(new User());
			return "showMusicListOfUser";
		}
		
	}
		
	@RequestMapping({"/doLogin"})//用户登录
	public String doLogin(@ModelAttribute("user") User user, Model model,HttpServletRequest request){
		String message = "";
		User user1 = userService.getUserByName(user.getUsername());		
		if(user1 == null){
			message = "用户名不存在";
		}
		else if(user1.getPassword().equalsIgnoreCase(MD5Util.getMD5Code(user.getPassword()))){
			request.getSession().setAttribute("user", user1);	
			user1.setLastlogintime(DateTime.getCurrentTime());
			user1.setLastloginip(request.getRemoteAddr());
			userService.updateUser(user1);
			
			//model.addAttribute("url", request.getContextPath() + "/home/discover/" +"1");
		}
		else{
			message = "密码错误";
			
		}
		model.addAttribute("user1", user1);
		model.addAttribute(new User());
		//model.addAttribute("login_state", 1);
		request.getSession().setAttribute("message",message);	
		return toHome1(model,request);
	}
	@RequestMapping({"/clearSession/"})
	public @ResponseBody void clearSession(HttpServletRequest request) {
		request.getSession().setAttribute("message", "");
		request.getSession().setAttribute("login_state", "");
	}
	@RequestMapping({"/getPassword/"})
	public String toGetPwd(Model model, HttpServletRequest request){
		model.addAttribute("title", "找回密码");
		model.addAttribute(new User());
		model.addAttribute("message","");
		return "showGetPassword";
	}
	@RequestMapping({"/doGetPwd/"})//用户找回密码
	public String doGetPwd(@ModelAttribute("user") User user,Model model, HttpServletRequest request){
		String message = "";
		System.out.println(user.getUsername());
		User user1 = userService.getUserByName(user.getUsername());
		if(user1 == null){
			message = "该用户名未注册";	
			//model.addAttribute(new User());
			model.addAttribute("message",message);
			
		}
		else if(user1.getEmail().equals(user.getEmail())){
			//message = "验证成功";
			//model.addAttribute("message",message);
			User user2 = userService.getUserByName(user.getUsername());
			//System.out.println(user2.getId());
			model.addAttribute("user2",user2);
			
			return "showAlterPwd";
		}
		else{
			System.out.println(user1.getEmail());
			message = "邮箱和用户名不一致";
			model.addAttribute("message",message);
			
		}
		return "showGetPassword";		
	}
	@RequestMapping({"/doAlterPwd/"})//用户找回密码
	public String doAlterPwd(@ModelAttribute("user") User user,Model model, HttpServletRequest request){
		String username = request.getParameter("user2");
		//System.out.println(username);
		User user1 = userService.getUserByName(username.trim());
		//System.out.println(user1);
		user1.setPassword(MD5Util.getMD5Code(user.getPassword()));
		userService.updateUser(user1);
		String message= "密码修改成功";
		model.addAttribute("message",message);
		model.addAttribute(new User());
		return "showAlterPwd";
	}
	@RequestMapping({"/logOut"})
	public String doLogOut(Model model, HttpServletRequest request){
		request.getSession().setAttribute("user", null);
		model.addAttribute(new User());
		return toHome1(model,request);
	}
	
	@RequestMapping({"/addLevel"})
	public @ResponseBody List<String> addLevel(String userid){
		int userId = Integer.parseInt(userid);
		String message = "";
		SignRela signRela = signService.getSignRelaByUseid(userId);
		if(signRela == null) {
			//添加到签到记录表
			SignRela signRela1 = new SignRela();
			signRela1.setUserid(userId);
			signRela1.setSigntime(DateTime.getCurrentTime());
			
			signService.addSignRela(signRela1);
			//保存积分
			User user = userService.findUser(userId);
			//int userGrade = user.getGrade();
			user.setGrade(user.getGrade() + 10);
			user.setLevel(setLevel(user.getGrade(), user.getLevel()));
			
			userService.updateUser(user);
			
			message += "success";
		}else {
			Date lastSignDate = signRela.getSigntime();
			Date now = DateTime.getCurrentTime();
			if(DateTime.judgeSameDay(lastSignDate, now)) {
				message += "sameday";
			}else {
				//更新签到时间
				signRela.setSigntime(now);
				signService.updateSignRela(signRela);
				//保存积分
				User user = userService.findUser(userId);
				//int userGrade = user.getGrade();
				user.setGrade(user.getGrade() + 10);
				user.setLevel(setLevel(user.getGrade(), user.getLevel()));
				
				userService.updateUser(user);
				message += "success";
			}
		}
		
		List<String> resultList = new ArrayList<String>();
		resultList.add(message);
		return resultList;
	}
	
	@RequestMapping({"/search"})
	public String search(Model model, HttpServletRequest request){
		String search = request.getParameter("searchCondition").trim();
		List<Music> musicList = musicService.getAllMusic();
		List<Singer> singerList = singerService.getAllSinger();
		
		List<Music> musicResultList = new ArrayList<Music>();
		List<Singer> singerResultList1 = new ArrayList<Singer>();
		List<Singer> singerResultList = new ArrayList<Singer>();
		
		for(Music m : musicList) {
			if(m.getMusicname().contains(search)) {
				musicResultList.add(m);
			}
		}
		
		for(Music m : musicResultList) {
			singerResultList1.add(singerService.getSingerById(musicSingerService.getSingerByMusicId(m.getId()).getSingerid()));
		}
		
		for(Singer s : singerList) {
			if(s.getSingername().contains(search)) {
				singerResultList.add(s);
			}
		}
	
		model.addAttribute("totalSize", musicResultList.size() + singerResultList.size());
		model.addAttribute("size1", (int)Math.ceil(musicResultList.size()*1.0/3));
		model.addAttribute("size2", (int)Math.ceil(singerResultList.size()*1.0/3));
		model.addAttribute("musicList", musicResultList);
		model.addAttribute("singerResultList1", singerResultList1);
		model.addAttribute("singerResultList", singerResultList);
		model.addAttribute("search", search);
		model.addAttribute(new User());
		return "showSearchResult";
	}
	
	@RequestMapping({"/comment"})
	public @ResponseBody List<Object> comment(String userid, String musicid, String comment){
		int userId = Integer.parseInt(userid);
		int musicId = Integer.parseInt(musicid);
		
		Comments comments = new Comments();
		comments.setUserid(userId);
		comments.setMusicid(musicId);
		comments.setComment(comment);
		comments.setCommenttime(DateTime.getCurrentTime());
		comments.setLove(0);
		//添加到数据库
		commentService.addComment(comments);
		
		//查询出该歌曲的所有评论
		List<Comments> commentsList = commentService.getCommentsListByMusicId(musicId);
		List<User> userList = new ArrayList<User>();
		for(Comments c : commentsList) {
			userList.add(userService.getUserById(c.getUserid()));
		}
		
		
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(commentsList);
		resultList.add(userList);
		resultList.add("success");
		return resultList;
	}
	
	@RequestMapping({"/addLove"})
	public @ResponseBody List<String> addLove(String userid, String commentid){
		int userId = Integer.parseInt(userid);
		int commentId = Integer.parseInt(commentid);
		//int musicId = Integer.parseInt(musicid);
		//判断点赞表是否存在该点赞信息
		LoveRela love = new LoveRela();
		love.setUserid(userId);
		love.setCommentid(commentId);
		Integer i;
		LoveRela love2 = loveRelaService.getLoveByUserAndComment(love);
		if(love2 == null) {
			//添加点赞记录并为评论点赞数加1
			loveRelaService.addLoveRela(love);
			Comments comment = commentService.getCommentsById(commentId);
			comment.setLove(comment.getLove() + 1);
			commentService.updateComment(comment);
			i = 1;
		}else {
			//取消点赞
			loveRelaService.deleteLoveRela(love2);
			Comments comment = commentService.getCommentsById(commentId);
			comment.setLove(comment.getLove() - 1);
			commentService.updateComment(comment);
			i = 0;
		}
		Comments comment = commentService.getCommentsById(commentId);
		//返回该评论的点赞数
		List<String> resultList = new ArrayList<String>();
		resultList.add(comment.getLove().toString());
		resultList.add(i.toString());
		
		return resultList;
	}
	
	public int setLevel(int userGrade, int userLevel) {
		if(userGrade >= 500 && userGrade <1000) {
			userLevel = 1;
		}else if(userGrade >=1000 && userGrade <2000) {
			userLevel += 1;
		}if(userGrade >= 2000 && userGrade <3000) {
			userLevel = 2;
		}else if(userGrade >=3000 && userGrade <4000) {
			userLevel += 1;
		}if(userGrade >= 4000 && userGrade <5000) {
			userLevel = 3;
		}else if(userGrade >=5000 && userGrade <6000) {
			userLevel = 4;
		}
		if(userGrade >= 6000 && userGrade <7000) {
			userLevel = 5;
		}else if(userGrade >=7000 && userGrade <8000) {
			userLevel = 6;
		}
		if(userGrade >= 8000 && userGrade <90000) {
			userLevel = 7;
		}else if(userGrade >=9000 && userGrade <10000) {
			userLevel = 8;
		}
		if(userGrade >= 10000 && userGrade <11000) {
			userLevel = 9;
		}else if(userGrade >=11000 && userGrade <12000) {
			userLevel = 10;
		}
		
		return userLevel;
	}
	
	/**
	 * 删除收藏
	 * @return
	 */
	@RequestMapping("/deleteMusicCollection")
	public String deleteMusicCollection(Model model, HttpServletRequest request) {
		if(!request.getParameter("musicid").contains("/rf")) {
			int userId = Integer.parseInt(request.getParameter("userid"));
			int musicId = Integer.parseInt(request.getParameter("musicid"));
			int id = 0;
			List<com.ruanko.hwm.bean.Collection> collectionList = collectionService.getCollectionByUserid(userId);
			for(com.ruanko.hwm.bean.Collection c : collectionList) {
				if(c.getMusicid() == musicId) {
					id = c.getId();
				}
			}
			
			if(id != 0) {
				collectionService.deleteCollectionById(id);
			}
		}
		
		return toMyMusic(model, request);
	}
	
	/**
	 * 删除收藏
	 * @return
	 */
	@RequestMapping("/deleteUserSinger")
	public String deleteUserSinger(Model model, HttpServletRequest request) {
		if(!request.getParameter("singerid").contains("/rf")) {
			int userId = Integer.parseInt(request.getParameter("userid"));
			int singerId = Integer.parseInt(request.getParameter("singerid"));
			int id = 0;
			List<UserSingerRela> usr = userSingerService.getUserSingerByUserid(userId);
			for(UserSingerRela u : usr) {
				if(u.getSingerid() == singerId) {
					id = u.getId();
				}
			}
			
			if(id != 0) {
				userSingerService.deleteUserSingerById(id);
			}
		}
		
		return toMyMusic(model, request);
	}
}