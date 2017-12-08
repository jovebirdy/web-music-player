<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<style>
	#user_whole {
		width:1000px;
		margin:0 auto;
		min-height:700px;
		border:1px solid #d3d3d3;
		background-color: white;
	}	
	
	#user_whole_padding {
		padding:40px;
	}
	
	#user_header {
		margin-bottom:40px;
		overflow:hidden;
	}
	
	#user_header_img {
		float:left;
		width:180px;
		margin-right:40px;
		
	}
	
	#user_header_info {
		float:left;
		width:670px;
	}
	
	#user_header_info1 {
		padding-bottom: 10px;
		margin-bottom: 10px;
		border-bottom: 1px solid #ddd;
		overflow: hidden;
	}
	
	#user_header_info2 ul li {
		border-right:2px solid #d3d3d3;
		padding-left:15px;
		padding-right:15px;
		float:left;
		
	}
	#user_header_info2 {
		overflow:hidden;
	}
	
	#user_header_info2 ul {
		border-bottom:1px solid #d3d3d3;
		padding-bottom:20px;
	}
	#user_header_info2 ul li:last-child {
		border-right:none;
	}
	
	#user_header_info2 ul li a strong{
		display:block;
		margin-bottom:5px;
		font-size:24px;
	}
	
	#user_header_info2 ul li a span {
		font-size:12px;
	}
	
	#user_header_info2 ul li a  {
		color:#666;
		text-decoration: none;
	}
	#user_header_info2 ul li a:hover {
		color:#0c73c2;
		cursor:pointer;
	}
	
	#user_header_info3 {
		margin-top:10px;
		color:#666;
		font-size:15px;
	}
</style>
<div id="user_whole">
	<input type="hidden" value="<%=request.getContextPath()%>" id="contextPath1"/>
	<input type="hidden" value="${sessionScope.user.id }" id="sessionuserid1"/>
	<c:choose>
			<c:when test="${sessionScope.user == null }">
				<!-- 没有登录显示-->
				<div style="background:#F5F5F5;border:1px solid  #DCDCDC;width: 800px;margin: 20px auto;height: 200px;">
					<p style="width:400px;margin:20px auto;font-size:10pt;margin: 50px auto;font-size:20px;">
						登录心随乐动，可以享受无限收藏的乐趣
					</p>
					<div style="width:82px;margin:50px auto;">
						<button type="button" class="btn btn-danger" style="margin-top:10px;margin-bottom:15px;" data-toggle="modal" data-target="#myModal">用户登录</button>
					</div>
				</div>
			</c:when>
			<c:when test="${sessionScope.user != null }">
				<!--登录之后显示-->
				<div id="user_whole_padding">
					<div id="user_header">
						<div id="user_header_img">
							<c:if test="${sessionScope.user.img == '0'}">
								<a ><img style="border:2px solid #d3d3d3;border-radius:5px;padding:3px;" src="<%=request.getContextPath()%>/img/front/home/default_user.jpg"></a>
							</c:if>
							<c:if test="${sessionScope.user.img != '0'}">
								<a ><img style="width: 200px;height: 200px;border:2px solid #d3d3d3;border-radius:5px;padding:3px;" src="<%=request.getContextPath()%>/static/user/${user1.img}"></a>			
							</c:if>
							</div>
						<div id="user_header_info">
							<div id="user_header_info1">
								<div style="float:left;">
									<h2 style="margin:0;padding:0;display:inline;float:left;">${user1.username}</h2>
									<span style="font-size: 15px;color: gold;font-style: italic;border: 2px solid #e03a24;border-radius: 12px;padding-left: 5px;padding-right: 5px;font-weight: bolder;float: left;margin: 5px 10px;">Lv.${sessionScope.user.level}</span>
								</div>
								<div style="float:right;margin-right:10px;">
									<a  href="<%=request.getContextPath()%>/home/personMsg"><i style="border:1px solid #d3d3d3;border-radius:3px;padding:5px;box-shadow:1px 1px 3px #d3d3d3;background-color:#f5f5f5; display: inline-block;height: 31px;overflow: hidden;vertical-align: top;text-align: center;cursor: pointer;">修改个人资料</i></a>
								</div>
							</div>
							<div id="user_header_info2">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;">
									<li>
										<a href="#gequ">
											<strong>
												${fn:length(musicList) }
											</strong>
											<span>收藏的歌曲</span>
										</a>
									</li>
									<li>
										<a href="#geshou">
											<strong>${fn:length(singerList1) }</strong>
											<span>关注的歌手</span>
										</a>
									</li>
									<li>
										<a href="#download">
											<strong>${fn:length(musicList1) }</strong>
											<span>下载的歌曲</span>
										</a>
									</li>
									<li>
										<a href="#playRecord">
											<strong>${user1.playcount}</strong>
											<span>播放次数</span>
										</a>
									</li>
								</ul>
							</div>
							<div id="user_header_info3">
								<span>最近一次登录时间:</span>
								<span><fmt:formatDate value="${sessionScope.user.lastlogintime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/></span>
							</div>
						</div>
					</div>
					<div id="user_musicList">
						<div id="user_musicList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="gequ"></a>
							<h4><i class="glyphicon glyphicon-music" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">收藏的歌曲(${fn:length(musicList) })</span></h4>
						</div>
						<div id="user_musicList_info">
							<c:forEach begin="0" end="${size1}" var="i">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;margin-left:10px;">
									<c:forEach items="${musicList}" var="music" begin="${i*3}" end="${i*3 + 2}" varStatus="j">
										<li style="float:left;padding:10px;width:290px;margin:5px;border:1px solid #ccc;">
										<div style="float:left;">
											<img width="60px"; height="60px"; src="<%=request.getContextPath()%>/static/music/img/${music.img}"></a>
										</div>
										<div style="float:left;margin-left:0px;padding:5px;">
											<div title="${music.musicname }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
												歌名:<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname }</a>
											</div>
											<c:forEach items="${singerList}" var="singer" varStatus="i">
												<c:if test="${i.index == j.index }">
													<div title="${singer.singername }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
														歌手:<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<div style="float: right;">
											<span  onclick="playSongById(${music.id})"><i title="播放" id="mymusic_index1_${music.id}" onmouseover="change1_mymusic_index1(${music.id})" onmouseout="change2_mymusic_index1(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:20px;"></i></span>
													
													<span id="mymusic_index2_${music.id}" onmouseover="change1_mymusic_index2(${music.id})" onmouseout="change2_mymusic_index2(${music.id})" style="text-decoration:none;" href="#" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
												class="glyphicon glyphicon-plus"  style="margin-left: 5px;font-size:20px;"></i>&nbsp;&nbsp;</span>
											
										</div>
										<div style="float: right;">
											<button class="btn btn-primary" style = "width: 50px;font-size: 10px;padding: 2px;float: right;margin-top: -50px;margin-right: -50px;" onclick="cancelMusic(${music.id})" >取消收藏</button>
										</div>
									</li>
									</c:forEach>
								</ul>
							</c:forEach>
							
						</div>
					</div>
					<div id="user_singerList">
						<div id="user_singerList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="geshou"></a>
							<h4><i class="glyphicon glyphicon-user" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">关注的歌手(${fn:length(singerList1) })</span></h4>
						</div>
						<div id="user_singerList_info">
							<c:forEach begin="0" end="${size2}" var="i">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;margin-left:10px;">
									<c:forEach items="${singerList1}" var="singer" begin="${i*3}" end="${i*3 + 2}" varStatus="j">
										<li style="float:left;padding:10px;width:290px;margin:5px;border:1px solid #ccc;">
										<div style="float:left;">
											<img width="60px"; height="60px"; src="<%=request.getContextPath()%>/static/singer/${singer.img}"></a>
										</div>
										<div style="float:left;margin-left:20px;padding:10px;">
											<div title="${singer.singername }">
												歌手:<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a>
											</div>
											<div title="${singer.introduction}" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
												简介:${singer.introduction}
											</div>
										</div>
										<div style="float: right;">
											<button class="btn btn-primary" style = "width: 50px;font-size: 10px;padding: 2px;float: right;" onclick="cancelSinger(${singer.id})" >取消关注</button>
										</div>
									</li>
									</c:forEach>
								</ul>
							</c:forEach>
							
						</div>
					</div>
					<div id="user_downloadList">
						<div id="user_downloadList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="download"></a>
							<h4><i class="glyphicon glyphicon-download-alt" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">下载的歌曲(${fn:length(musicList1) })</span></h4>
						</div>
						<div id="user_downloadList_info">
							<c:forEach begin="0" end="${size3}" var="i">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;margin-left:10px;">
									<c:forEach items="${musicList1}" var="music" begin="${i*3}" end="${i*3 + 2}" varStatus="j">
										<li style="float:left;padding:10px;width:290px;margin:5px;border:1px solid #ccc;">
											<div style="float:left;">
												<img width="60px"; height="60px"; src="<%=request.getContextPath()%>/static/music/img/${music.img}"></a>
											</div>
											<div style="float:left;margin-left:0px;padding:10px;">
												<div title="${music.musicname }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
													歌名:<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname }</a>
												</div>
												<c:forEach items="${singerList2}" var="singer" varStatus="i">
													<c:if test="${i.index == j.index }">
														<div title="${singer.singername }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
															歌手:<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a>
														</div>
													</c:if>
												</c:forEach>
												<c:forEach items="${downloadList}" var="download" varStatus="k">
													<c:if test="${download.musicid == music.id}">
														<div title='<fmt:formatDate value="${download.downloadtime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/>' style="width: 188px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size:10px;">
															最近一次下载时间:<fmt:formatDate value="${download.downloadtime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/>
														</div>
														<div title="${download.downloadtime}" style="width: 188px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size:10px;">
															下载次数:${download.counts}
														</div>
													</c:if>
												</c:forEach>
												
											</div>
											<div style="float: right;">
											<span  onclick="playSongById(${music.id})"><i title="播放" id="mymusic_index3_${music.id}" onmouseover="change1_mymusic_index3(${music.id})" onmouseout="change2_mymusic_index3(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:20px;"></i></span>
													
													<span id="mymusic_index4_${music.id}" onmouseover="change1_mymusic_index4(${music.id})" onmouseout="change2_mymusic_index4(${music.id})" style="text-decoration:none;" href="#" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
												class="glyphicon glyphicon-plus"  style="margin-left: 5px;font-size:20px;"></i>&nbsp;&nbsp;</span>
											
										</div>
										</li>
									</c:forEach>
								</ul>
							</c:forEach>
						</div>
					</div>
					<div id="user_playRecordList">
						<div id="user_playRecordList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="playRecord"></a>
							<h4><i class="glyphicon glyphicon-calendar" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">播放记录</span></h4>
						</div>
						<div id="user_playRecordist_info">
							<c:forEach begin="0" end="${size_record}" var="i">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;margin-left:10px;">
									<c:forEach items="${musicRecordList}" var="music" begin="${i*3}" end="${i*3 + 2}" varStatus="j">
										<li style="float:left;padding:10px;width:290px;margin:5px;border:1px solid #ccc;">
											<div style="float:left;">
												<img width="60px"; height="60px"; src="<%=request.getContextPath()%>/static/music/img/${music.img}"></a>
											</div>
											<div style="float:left;margin-left:0px;padding:10px;">
												<div title="${music.musicname }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
													歌名:<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname }</a>
												</div>
												<c:forEach items="${singerRecordList}" var="singer" varStatus="i">
													<c:if test="${i.index == j.index }">
														<div title="${singer.singername }" style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
															歌手:<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a>
														</div>
													</c:if>
												</c:forEach>
												<c:forEach items="${playRecordList}" var="playRecord" varStatus="k">
													<c:if test="${playRecord.musicid == music.id}">
														<div title='<fmt:formatDate value="${playRecord.playtime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/>' style="width: 188px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size:10px;">
															最近一次播放时间:<fmt:formatDate value="${playRecord.playtime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/>
														</div>
														<div title="${download.downloadtime}" style="width: 188px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size:10px;">
															播放次数:${playRecord.playcounts}
														</div>
													</c:if>
												</c:forEach>
												
											</div>
											<div style="float: right;">
											<span  onclick="playSongById(${music.id})"><i title="播放" id="mymusic_index3_${music.id}" onmouseover="change1_mymusic_index3(${music.id})" onmouseout="change2_mymusic_index3(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:20px;"></i></span>
													
													<span id="mymusic_index4_${music.id}" onmouseover="change1_mymusic_index4(${music.id})" onmouseout="change2_mymusic_index4(${music.id})" style="text-decoration:none;" href="#" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
												class="glyphicon glyphicon-plus"  style="margin-left: 5px;font-size:20px;"></i>&nbsp;&nbsp;</span>
											
										</div>
										</li>
									</c:forEach>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:when>
	</c:choose>
	
</div>
<div class="modal fade" id="myModal_tip2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" id = "dialog" style = "width:500px;margin-top:150px" role="document"> <!--修改窗口位置-->
		<div class="modal-content" style = "width:500px;height:300px;">
			<div class="modal-header" id ="aaa" style = "padding:0px !important; background-color:#2D2D2D;border-radius:5px 5px 0px 0px;height:40px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style = "color:white;padding-right:20px;padding-top:10px;">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel" style = "color:white;font-size:150%;padding-left:15px;padding-top:5px;">
					提示信息
				</h4>
			</div>
			<div class="modal-body" style = "height:260px;width:500px;"> 
				<div id="my_tip_info" style="font-size:18px;height:130px;margin-top:40px;text-align: center;word-break:break-all;"  >
					确定取消收藏歌曲?
				</div>
				<div style = "padding-top: 30px;width: 400px;margin-top: -20px;margin-left: 80px;">
						<button type="button" style="width:150px;" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button onclick="deleteMusic()" type="button" style="width:150px;" class="btn btn-primary">
							确定
						</button>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal_tip3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" id = "dialog" style = "width:500px;margin-top:150px" role="document"> <!--修改窗口位置-->
		<div class="modal-content" style = "width:500px;height:300px;">
			<div class="modal-header" id ="aaa" style = "padding:0px !important; background-color:#2D2D2D;border-radius:5px 5px 0px 0px;height:40px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style = "color:white;padding-right:20px;padding-top:10px;">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel" style = "color:white;font-size:150%;padding-left:15px;padding-top:5px;">
					提示信息
				</h4>
			</div>
			<div class="modal-body" style = "height:260px;width:500px;"> 
				<div id="my_tip_info" style="font-size:18px;height:130px;margin-top:40px;text-align: center;word-break:break-all;"  >
					确定取消关注歌手?
				</div>
				<div style = "padding-top: 30px;width: 400px;margin-top: -20px;margin-left: 80px;">
						<button type="button" style="width:150px;" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button onclick="deleteSinger()" type="button" style="width:150px;" class="btn btn-primary">
							确定
						</button>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script>
function change1_mymusic_index1(id) {
		
		$("#mymusic_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_mymusic_index1(id) {
		$("#mymusic_index1_"+id).css("color","black");
	}
	
	function change1_mymusic_index2(id) {
		
		$("#mymusic_index2_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_mymusic_index2(id) {
		$("#mymusic_index2_"+id).css("color","black");
	}
function change1_mymusic_index3(id) {
		
		$("#mymusic_index3_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_mymusic_index3(id) {
		$("#mymusic_index3_"+id).css("color","black");
	}
	
	function change1_mymusic_index4(id) {
		
		$("#mymusic_index4_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_mymusic_index4(id) {
		$("#mymusic_index4_"+id).css("color","black");
	}
	
	var musicid;
	var singerid;
	
	function cancelMusic(id){
		$("#myModal_tip2").modal('show');
		musicid = id;
	}

	function cancelSinger(id){
		$("#myModal_tip3").modal('show');
		singerid = id;
	}
	
	function deleteMusic(){
		window.location.href=document.getElementById("contextPath1").value + "/home/deleteMusicCollection?userid=" + document.getElementById("sessionuserid1").value  + "&musicid=" + musicid ;
	}

	function deleteSinger(){
		window.location.href=document.getElementById("contextPath1").value + "/home/deleteUserSinger?userid=" + document.getElementById("sessionuserid1").value  + "&singerid=" + singerid ;
	}
	</script>