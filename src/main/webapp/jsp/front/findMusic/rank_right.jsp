<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/rankList.css"rel="stylesheet">

<div id="rank_list">
	<div style = "width:740px;height:208px; margin: 0 auto;">
		<div id = "item" style = "width:473px; height:114x; float:right;margin-right:50px; margin-top: 15px;">
			<c:if test="${cat == 1}">
				<p style ="line-height: 24px;font-size: 20px;font-weight: normal;">心动飙升榜</p>
				<p style = "color:#999">根据歌曲的播放次数排序</p>
			</c:if>
			<c:if test="${cat == 2}">
				<p style ="line-height: 24px;font-size: 20px;font-weight: normal;">心动新歌榜</p>
				<p style = "color:#999">根据歌曲的上传时间排序</p>
			</c:if>
			<c:if test="${cat == 3}">
				<p style ="line-height: 24px;font-size: 20px;font-weight: normal;">心动热歌榜</p>
				<p style = "color:#999">根据歌曲的被收藏次数排序</p>
			</c:if>
		</div>
		<div id = "item" style = "width:473px; float:right;clear:both;margin-right: 50px;margin-top: 20px;">
			<div style = "width:380px;height:40px;">	<!--操作-->				
								<button onclick="playList1()" style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button3.png');width:66px;height:31px;text-align:right;color:white;float:left;">播放</button>
								<button onclick="addPlayList1()" style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button4.png');width:33px;height:31px;float:left;margin-top:-1px;" title="添加到播放列表"></button>
								<button onclick="addListColl2(${musicList})" class="btn btn-default" style = "width:75px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class="glyphicon glyphicon-folder-open" style="margin-right:5px;"></i>收藏</button>
								<!--  <button class="btn btn-default" style = "width:75px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class=" 	glyphicon glyphicon-download-alt" style="margin-right:5px;"></i>下载</button>-->
								<!--  <a href = "#pinglun" class = "btn btn-default"style = "width:100px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class="glyphicon glyphicon-comment" style="margin-right:5px;"></i>评论（10）</a>-->
							
							</div>
		</div>
		<div id = "coverImage" style = "width:158px;height:158px;margin-top:40px;margin-left:30px; border: 1px solid #ccc;">
			<c:if test="${cat == 1}">
				<img src = "<%=request.getContextPath()%>/img/front/home/soar_big.png" style = "margin-top:3px; margin-left: 3px;">
			</c:if>
			<c:if test="${cat == 2}">
				<img src = "<%=request.getContextPath()%>/img/front/home/newMusic_big.png" style = "margin-top:3px; margin-left: 3px;">
			</c:if>
			<c:if test="${cat == 3}">
				<img src = "<%=request.getContextPath()%>/img/front/home/hot_big.png" style = "margin-top:3px; margin-left: 3px;">
			</c:if>
			
		</div>
	</div>
	<div id="topList">
		<div id="hotList">
			<table id="rank_musicList" class="table table-striped" style="">

				<caption>
					<h3 style="padding-left: 2px;border-left: 5px solid gray;margin-left: 5px;">歌曲列表</h3>
				</caption>
				<tbody>
					<tr>
						<th></th>
						<th style = "padding-left: 50px;">歌曲</th>
						<th>时长</th>
						<th style = "padding-left: 25px;">操作</th>
						<th>歌手</th>
					</tr>
					<c:forEach items="${musicList}" var="music" varStatus="i">
						<tr>
							<td class="rank_list" id="rank_list_${i.count}" style = "width:40px;">${i.count }</td>
							<td style="">
									<span class="rank_m" id="rank_m_${music.id }" onmouseover="change_rank_music_state1(${music.id })" onmouseout="change_rank_music_state2(${music.id })" onclick="change_rank_play_state(${music.id})" title="播放"  > 
									 <i id="music_${music.id }"  class="glyphicon glyphicon-expand music_play" style="width: 20px;font-size:18px;top:3px;"></i></span>
									 &nbsp;&nbsp;&nbsp; <a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
							</td>
							<td>${music.musictime}</td>
							<td style="font-size:12px;"><span id="rankList1_index1_${music.id}" onmouseover="change1_rankList1_index1(${music.id})" onmouseout="change2_rankList1_index1(${music.id})" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
									class="glyphicon glyphicon-plus"  style="margin-left: 5px;"></i>&nbsp;&nbsp;</span>
								<span onclick="addColl2(${music.id})" id="rankList2_index1_${music.id}" onmouseover="change1_rankList2_index1(${music.id})" onmouseout="change2_rankList2_index1(${music.id})"  title="收藏"><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;</span>
								<span onclick="download(${music.id})" id="rankList3_index1_${music.id}" onmouseover="change1_rankList3_index1(${music.id})" onmouseout="change2_rankList3_index1(${music.id})"  title="下载"><i class="glyphicon glyphicon-save"></i></span></td>
							<c:forEach items="${singerList}" var="singer" varStatus="j">
								<c:if test="${i.index==j.index}">
									<td><a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a></td>
								</c:if>
							</c:forEach>
						</tr>
					
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	var rankList = $(".rank_list");
	
	for(var i=0;i<rankList.length;i++) {
		if(rankList.eq(i).attr("id") == "rank_list_" + 1) {
			rankList.eq(i).css({"font-size": "15px","color": "gold","font-style": "italic","font-weight": "bold"});
		}else if(rankList.eq(i).attr("id") == "rank_list_" + 2){
			rankList.eq(i).css({"font-size": "15px","color": "silver","font-style": "italic","font-weight": "bold"});
		}else if(rankList.eq(i).attr("id") == "rank_list_" + 3){
			rankList.eq(i).css({"font-size": "15px","color": "brown","font-style": "italic","font-weight": "bold"});
		}
	}
	function change_rank_music_state1(id){
		if(!$("#rank_m_"+id +" i").is('.play_music')){
			//alert("#singer_m_"+id+" i");
			$("#rank_m_"+id+" i").css("color","red");
			$("#rank_m_"+id).css("cursor","pointer");
		}
	}
	
	function change_rank_music_state2(id){
		if(!$("#rank_m_"+id +" i").is('.play_music')){
			$("#rank_m_"+id+" i").css("color","black");
		}
	}
	function change_rank_play_state(id) {
		playSongById(id);
	}
	
	var music_play = $(".music_play");
    //alert(music_play.length);
    for(var k=0;k<music_play.length;k++){
		music_play.eq(k).css("color","black"); 
		music_play.eq(k).removeClass("play_music");
	}
	for(var k=0;k<music_play.length;k++) {
		//alert(music_play.eq(k).attr("id"));
		if(music_play.eq(k).attr("id") == "music_" + window.parent.Player.data[window.parent.Player.currentIndex].id) {
			music_play.eq(k).css("color","red"); 
			music_play.eq(k).addClass("play_music");
		}
	}
	function addPlayList1() {
		var musicList = new Array();
		musicList = "${musicList}".split("[");
		musicList = musicList[1];
		musicList = musicList.split("]");
		musicList = musicList[0].split(",");
		for(var i=0;i<musicList.length;i++) {
			var k = parseInt(musicList[i]);
			//alert(k);
			if(!isNaN(k)) {
				addPlayList(k);
			}
		}
	}
	
	function playList1() {
		addPlayList1();
		var musicList = new Array();
		musicList = "${musicList}".split("[");
		musicList = musicList[1];
		musicList = musicList.split("]");
		musicList = musicList[0].split(",");
		playSongById(parseInt(musicList[0]));
	}
	
	function change1_rankList1_index1(id) {
		
		$("#rankList1_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_rankList1_index1(id) {
		$("#rankList1_index1_"+id).css("color","black");
	}
	
	function change1_rankList2_index1(id) {
		
		$("#rankList2_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_rankList2_index1(id) {
		$("#rankList2_index1_"+id).css("color","black");
	}
	
	function change1_rankList3_index1(id) {
		
		$("#rankList3_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_rankList3_index1(id) {
		$("#rankList3_index1_"+id).css("color","black");
	}
	function addColl2(id) {
		addCollection(id);
	}
	function addListColl2(id) {
		addListCollection(id);
	}
	function addCollection(id) {
		//alert(id);
		//alert("${sessionScope.user == null}");
		var user = "${sessionScope.user}";
		var userid = "${sessionScope.user.id}";
		if(user == "") {
			$("#myModal").modal('show');
		}else {
			//alert(id);
			$.ajax({  
		        type : "post",  
		        url : $('#contextPath').val() + "/music/addCollection",  
		        dataType:"json",
		        cache : false,  
		        data : {  
		            userid : userid,
		            musicid : id
		        },  
		        async : false,  
		        error : function() {  
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html("网络异常");    
		        },  
		        success : function(data) { 
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html(data[0]);  
		        }  
		    }); 
		}
	};
	
	function addListCollection(list) {
		//alert(id);
		//alert("${sessionScope.user == null}");
		
		//alert(list.length);
		//alert(list[1]);
		//alert(typeof(list));
		var list1 = new Array();
		//alert(typeof(list1));
		var i=0;
		for(;i<list.length;i++) {
			list1[i] = "" + list[i];
		}
		//alert(list1.length);

		
		
		var user = "${sessionScope.user}";
		var userid = "${sessionScope.user.id}";
		
		list1[i] =  userid;
		var params = {};  
		params = JSON.stringify(list1); 
		//alert(params);
		if(user == "") {
			$("#myModal").modal('show');
		}else {
			//alert(id);
			$.ajax({  
		        type : "post",  
		        url : $('#contextPath').val() + "/music/addListCollection",  
		        dataType:"json",
		        cache : false,  
		        data : {list :params},
		        async : false,  
		        error : function() {  
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html("网络异常");    
		        },  
		        success : function(data) { 
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html(data[0]);  
		        }  
		    }); 
		}
	};
	// 文件下载
	function download1(url, method,filename){
	    jQuery('<form action="'+url+'" method="'+(method||'post')+'">' +  // action请求路径及推送方法
	                '<input type="text" name="filename" value="'+filename+'"/>' + // 文件名称
	            '</form>')
	    .appendTo('body').submit().remove();
	};
	function download(id) {
		//alert(id);
		//alert("${sessionScope.user == null}");
		var user = "${sessionScope.user}";
		var userid = "${sessionScope.user.id}";
		if(user == "") {
			$("#myModal").modal('show');
		}else {
			//alert(id);
			$.ajax({  
		        type : "post",  
		        url : $('#contextPath').val() + "/music/download",  
		        dataType:"json",
		        cache : false,  
		        data : {  
		            userid : userid,
		            musicid : id
		        },  
		        async : false,  
		        error : function() {  
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html("网络异常");  
		        },  
		        success : function(data) { 
	                 download1($('#contextPath').val() + "/music/download1", 'post', data[0]); // 下载文件
		        }  
		    }); 
		}
	};
	
	
	
</script>