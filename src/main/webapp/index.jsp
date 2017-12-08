<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<style>
	.left_menu {
		float:left;
		border-left:1px solid #DCDCDC;
	}
	.left_menu_header {
		margin-top:20px;
		height:50px;
		border-bottom: 2px solid #C10D0C;"
	}
	
	
	
</style>    
<!--第二层导航栏对应的转换页面-->
<div class="tab-content" style="margin-top:20px;"></div>
<!--“推荐”对应转换页面-->
<!--div class="tab-pane" id="recommend" class="carousel slide" data-ride="carousel"-->

<div id="recommend" class="carousel slide" style="margin-top:-20px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');background-repeat:repeat-x;">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#recommend" data-slide-to="0" class="active"></li>
		<li data-target="#recommend" data-slide-to="1"></li>
		<li data-target="#recommend" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	
	<div class="carousel-inner" >
		<div class="item active">
			<img src="<%=request.getContextPath()%>/img/front/home/picture4.png" alt="First slide" width="700" height="99" style="margin:auto;">
		</div>
		<div class="item">
			<img src="<%=request.getContextPath()%>/img/front/home/picture2.png" alt="Second slide"  width="700" height="99" style="margin:auto;">
		</div>
		<div class="item">
			<img src="<%=request.getContextPath()%>/img/front/home/picture3.png" alt="Third slide"  width="700" height="99" style="margin:auto;">
		</div>
	</div>
	
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#recommend" 
	   data-slide="prev"  style="width:50px;height:90px; margin-top:130px;margin-left:250px;font-size:60px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');	">&lsaquo;</a>
	<a class="carousel-control right" href="#recommend" 
	   data-slide="next"  style="width:50px;height:90px; margin-top:130px;margin-right:250px;font-size:60px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');">&rsaquo;</a>
</div> 
<!-- 整体div -->
<div style="margin:0 auto;width:1000px;padding:0px;background:white;overflow:hidden;">
	<!-- 热门搜索栏  导航栏-->
	<div style="width:750px;float:left;">
		<!-- 热门推荐 -->
		<div class="left_menu">
			<div class="left_menu_header">
				<ol class="breadcrumb" style="background:none;height:30px;padding-left: 15px;" >
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList" style="font-size:15pt; color:black;">热门推荐</a></li>
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList?cat=1" style="color:gray;">华语</a></li>
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList?cat=6" style="color:gray;">流行</a></li>
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList?cat=7" style="color:gray;">摇滚</a></li>
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList?cat=8" style="color:gray;">民谣</a></li>
					<li><a href="<%=request.getContextPath()%>/home/discover/musicList?cat=10" style="color:gray;">电子</a></li>
					<a href="<%=request.getContextPath()%>/home/discover/musicList" style="margin-left:320px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			<!--缩略图  热门推荐栏-->
			<div class="row">
				<c:forEach items="${musicList1}" var="music" begin="0" end="3">
						
						<div class="col-sm-6 col-md-3 row_left" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
					        <a href="<%=request.getContextPath()%>/home/music?id=${music.id}" class="thumbnail" style="height:160px;width:150px">
					            <img src="<%=request.getContextPath()%>/static/music/img/${music.img}"
					                 alt="通用的占位符缩略图"
									style="height:150px;width:150px">
					        </a>
							<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:5px;">
								<i class="glyphicon glyphicon-headphones"  style="color:white;margin-left:5px;margin-top:5px;"></i>  
													<span style="margin-top:5px;width:60px;">${music.playcounts }</span>
													<span onclick="playSongById(${music.id})" ><i id="index_${music.id }" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})"  class="glyphicon glyphicon-play-circle"  style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>
							</div>
							<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">${music.musicname}</a></div>
					    </div>
						
				</c:forEach>	
			    
			</div>
			<div class="row">
				<c:forEach items="${musicList1}" var="music" begin="4" end="7">
						
						<div class="col-sm-6 col-md-3 row_left" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
					        <a href="<%=request.getContextPath()%>/home/music?id=${music.id}" class="thumbnail" style="height:160px;width:150px">
					            <img src="<%=request.getContextPath()%>/static/music/img/${music.img}"
					                 alt="通用的占位符缩略图"
									style="height:150px;width:150px">
					        </a>
							<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:5px;">
								<i class="glyphicon glyphicon-headphones"  style="color:white;margin-left:5px;margin-top:5px;"></i>  
													<span style="margin-top:5px;width:60px;">${music.playcounts }</span>
													<span onclick="playSongById(${music.id})" ><i id="index_${music.id}" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})" class="glyphicon glyphicon-play-circle"  style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>
							</div>
							<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">${music.musicname}</a></div>
					    </div>
						
				</c:forEach>
			 </div>   
		</div>
		
		<!--个性化推荐   导航栏-->
		<!-- <div class="left_menu">
			<div class="left_menu_header">
				<ol class="breadcrumb" style="background:none;height:30px;padding-left: 15px;" >
					<li><a href="#" style="font-size:15pt;color:black;">个性化推荐</a></li>
				</ol>
			</div>-->
			
			<!-- 缩略图   个性化推荐-->
			<!--  
			<div class="row">
			    <div class="col-sm-6 col-md-3" style="margin-left:30px;margin-top:20px;	height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;"></i>  
											<span style="margin-top:5px;">0</span>
											<a href="#"><i class="glyphicon glyphicon-play-circle" style="color:white;margin-left:80px;font-size:18px;margin-top:2px;"></i></a>
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;"></i>  
											<span style="margin-top:5px;">0</span>
											<a href="#"><i class="glyphicon glyphicon-play-circle" style="color:white;margin-left:80px;font-size:18px;margin-top:2px;"></i></a>
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			     <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;"></i>  
											<span style="margin-top:5px;">0</span>
											<a href="#"><i class="glyphicon glyphicon-play-circle" style="color:white;margin-left:80px;font-size:18px;margin-top:2px;"></i></a>
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;"></i>  
											<span style="margin-top:5px;">0</span>
											<a href="#"><i class="glyphicon glyphicon-play-circle" style="color:white;margin-left:80px;font-size:18px;margin-top:2px;"></i></a>
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			</div>
		</div>-->
		
		<!-- 新碟上架-->
		<div class="left_menu">
			<div class="left_menu_header" >
				<ol class="breadcrumb" style="background:none;padding-left: 15px;" >
					<li><a href="<%=request.getContextPath()%>/home/discover/album" style="font-size:15pt;color:black;">新碟上架</a></li>
					<a href="<%=request.getContextPath()%>/home/discover/album" style="margin-left:560px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			
			<!--新碟上架  滚轮-->
			<div id="newdish" class="carousel slide" style="margin-top:30px;margin-left:20px;width:720px;background:none repeat scroll 0% 0% #F5F5F5;">
				<!-- 轮播（Carousel）指标 -->
				<!--<ol class="carousel-indicators">
					<li data-target="#newdish" data-slide-to="0" class="active"></li>
					<li data-target="#newdish" data-slide-to="1"></li>
					<li data-target="#newdish" data-slide-to="2"></li>
				</ol>-->   
				<!-- 轮播（Carousel）项目 -->
				
				<div class="carousel-inner" style="margin-top:20px;height:180px;border:1px solid #d3d3d3;">
					<div class="item active">
						
						<li style="list-style:none;">
							<div class="item active" >
								<c:forEach items="${musicList2}" var="music" begin="0" end="4" varStatus="i">
									<c:choose>
										<c:when test="${i.index == 4}">
											<a class='msk' href="<%=request.getContextPath()%>/home/music?id=${music.id}">
												<div class="lunbo_left" style="float:left;width: 100px;margin-left:20px;margin-top: 25px;" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})" >
													<img width="100px" height="100px" class='j-img' src="<%=request.getContextPath()%>/static/music/img/${music.img}"></img>
													<div style="width:100px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${music.musicname }</div>
													<span class="index_index" onclick="playSongById(${music.id})" ><i  id="index_${music.id }" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})"   class="glyphicon glyphicon-play-circle "  style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:-45px;"></i></span>
												
												</div>
											</a>
										</c:when>
										<c:otherwise>
											<a class='msk' href="<%=request.getContextPath()%>/home/music?id=${music.id}">
												<div class="lunbo_left" style="float:left;width: 100px;margin-left:20px;margin-top: 25px;" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})" >
													<img width="100px" height="100px" class='j-img' src="<%=request.getContextPath()%>/static/music/img/${music.img}"></img>
													<div style="width:100px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${music.musicname }</div>
													<span class="index_index" onclick="playSongById(${music.id})" ><i  id="index_${music.id }" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})"   class="glyphicon glyphicon-play-circle "  style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:-45px;"></i></span>
												
												</div>
											</a>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
							</div>
						</li>
						<!--  <li style="list-style:none;">
							<div class="item active" >
								<a class='msk' href="#">
									
									<div style="float:left;width: 100px;margin-left:70px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第一首歌曲</div>
									</div>
								</a>
								
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第一首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第一首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第一首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第一首歌曲</div>
									</div>
								</a>
								
							</div>
						</li>-->
					</div>
					<div class="item">
						<li style="list-style:none;">
							<div class="item active" >
								<c:forEach items="${musicList2}" var="music" begin="5" end="9">
									<a class='msk' href="<%=request.getContextPath()%>/home/music?id=${music.id}">
											<div class="lunbo_left" style="float:left;width: 100px;margin-left:20px;margin-top: 25px;" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})" >
											<img width="100px" height="100px" class='j-img' src="<%=request.getContextPath()%>/static/music/img/${music.img}"></img>
												<div style="width:100px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${music.musicname }</div>
												<span onclick="playSongById(${music.id})" ><i id="index_${music.id }" onmouseover="change1_index(${music.id})" onmouseout="change2_index(${music.id})"   class="glyphicon glyphicon-play-circle"  style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:-45px;"></i></span>
											
											</div>
										</a>
								</c:forEach>
							</div>
						</li>
					</div>
					<!--  <div class="item">
						<li style="list-style:none;">
							<div class="item active" >
								<a class='msk' href="#">
									
									<div style="float:left;width: 100px;margin-left:70px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第2首歌曲</div>
									</div>
								</a>
								
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第2首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第2首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第2首歌曲</div>
									</div>
								</a>
								<a class='msk' href="#" >
									
									<div style="float:left;width: 100px;margin-left:20px;margin-top: 25px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
										<div style="width:100px">第2首歌曲</div>
									</div>
								</a>
								
							</div>
						</li>
					</div>-->
			</div>
			
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#newdish" 
			   data-slide="prev"  style="width:30px;height:50px; margin-top:48px;font-size:40px;background:none repeat scroll 0% 0% #F5F5F5;margin-left:2px;">&lsaquo;</a>
			<a class="carousel-control right" href="#newdish" 
			   data-slide="next"  style="width:30px;height:50px; margin-top:48px;font-size:40px;background:none repeat scroll 0% 0% #F5F5F5;margin-right:2px">&rsaquo;</a>
		</div>
		</div>
		
		<!-- 榜单 -->	
		<div class="left_menu">
			<div class="left_menu_header" style="width:740px;">
				<ol class="breadcrumb" style="background:none;padding-left: 15px;">
					<li><a href="<%=request.getContextPath()%>/home/discover/rankList" style="font-size:15pt;color:black;">音乐榜单</a></li>
					<a href="<%=request.getContextPath()%>/home/discover/rankList" style="margin-left:564px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			
			<!--榜单 -->
			<div class="row" id="top-flag"  style="margin-left:30px;margin-top:20px;width:690px;background-image:url('<%=request.getContextPath()%>/img/front/home/rankListBg.png');background-repeat:no-repeat;">
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:212px;">
						<div style="margin-left:5px;width:100px;float:left;" >
							<a href="<%=request.getContextPath()%>/home/discover/rankList"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/soar.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:5px;width:100px;height:100px;display:inline-block;">
							<a href="<%=request.getContextPath()%>/home/discover/rankList" style="float:right;margin-right:30px;margin-top:30px;">心动飙升榜</a>
							<!--需要加一个触发事件，鼠标经过下面图片时  改变图片  点击图片时 开始播放音乐-->
							<img id="img_1_1" onmouseover="change1()" title="播放" onclick="playList11(1)" class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:10px;margin-right:70px;width:30px;height:30px;"></img>
							<img onclick="addListColl(${musicList3})" class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
						
					</dt>
					<dd style="width:215px;">
						<ol style="margin-left:-30px;margin-top: 22px;">
							<c:forEach items="${musicList3}" var="music">
								<li class="bangdan" style="margin-top:12px;">
									<span></span>
									<div style="width: 100px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><a href="<%=request.getContextPath()%>/home/music?id=${music.id}"  >${music.musicname }</a></div>
									<span style="float:right;margin-top:-20px;margin-right:15px;">
										<span  onclick="playSongById(${music.id})"><i title="播放" id="musicList_index1_${music.id}" onmouseover="change1_musicList_index1(${music.id})" onmouseout="change2_musicList_index1(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:15px;"></i></span>
										<span id="musicList1_index1_${music.id}" onmouseover="change1_musicList1_index1(${music.id})" onmouseout="change2_musicList1_index1(${music.id})"  style="text-decoration:none;"  onclick="addPlayList(${music.id})" title="添加到播放列表">
										<i id="coll" class="glyphicon glyphicon-plus" style="margin-left: 5px;"></i>&nbsp;&nbsp;</span>
										<span onclick="addColl(${music.id })" id="musicList2_index1_${music.id}" onmouseover="change1_musicList2_index1(${music.id})" onmouseout="change2_musicList2_index1(${music.id})" style="text-decoration:none;"  title="收藏"><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;</span>
									</span>
								</li>
							</c:forEach>
						
						</ol>
						<div style="margin-left:150px;">
						<a href="<%=request.getContextPath()%>/home/discover/rankList" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:212px;">
						<div style="margin-left:15px;width:90px;float:left;" >
							<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=2"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/newMusic.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:5px;width:100px;height:100px;display:inline-block;">
							<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=2" style="float:right;margin-right:30px;margin-top:30px;">心动新歌榜</a>
							<img id="img_1_2" onmouseover="change2()" title="播放" onclick="playList11(2)" class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:10px;margin-right:70px;width:30px;height:30px;"></img>
							<img onclick="addListColl(${musicList4})" class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
					</dt>
					<dd style="width:215px;">
						<ol style="margin-left:-21px;margin-top: 22px;">
							<c:forEach items="${musicList4}" var="music">
								<li class="bangdan" style="margin-top:12px;">
									<span></span>
									<div style="width: 100px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><a href="<%=request.getContextPath()%>/home/music?id=${music.id}" >${music.musicname }</a></div>
									<span style="float:right;margin-top:-20px;margin-right:10px;">
									<span  onclick="playSongById(${music.id})"><i title="播放" id="musicList_index2_${music.id}" onmouseover="change1_musicList_index2(${music.id})" onmouseout="change2_musicList_index2(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:15px;"></i></span>
										
										<span id="musicList3_index1_${music.id}" onmouseover="change1_musicList3_index1(${music.id})" onmouseout="change2_musicList3_index1(${music.id})" style="text-decoration:none;" href="#" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
									class="glyphicon glyphicon-plus"  style="margin-left: 5px;"></i>&nbsp;&nbsp;</span>
								<span onclick="addColl(${music.id})" id="musicList4_index1_${music.id}" onmouseover="change1_musicList4_index1(${music.id})" onmouseout="change2_musicList4_index1(${music.id})" style="text-decoration:none;"  href="#" title="收藏"><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;</span>
									</span>
								</li>
							</c:forEach>
						</ol>
						<div style="margin-left:150px;">
						<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=2" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:230px;">
						<div style="margin-left:25px;width:60px;float:left;" >
							<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=3"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/hot_big.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:18px;width:120px;height:100px;display:inline-block;">
							<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=3" style="float:right;margin-right:30px;margin-top:30px;">心动热歌榜</a>
							<img id="img_1_3" onmouseover="change3()" title="播放" onclick="playList11(3)" class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:10px;margin-right:70px;width:30px;height:30px;"></img>
							<img onclick="addListColl(${musicList3})" class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
					</dt>
					<dd style="width:215px;">
						<ol style="margin-top: 22px;">
							<c:forEach items="${musicList3}" var="music">
								<li class="bangdan" style="margin-top:12px;">
									<span></span>
									<div style="width: 100px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><a href="<%=request.getContextPath()%>/home/music?id=${music.id}" >${music.musicname }</a></div>
									<span style="float:right;margin-top:-20px;margin-right:-3px;">
									<span  onclick="playSongById(${music.id})"><i title="播放" id="musicList_index3_${music.id}" onmouseover="change1_musicList_index3(${music.id})" onmouseout="change2_musicList_index3(${music.id})" class="glyphicon glyphicon-play-circle" style="color:black;font-size:15px;"></i></span>
										
										<span id="musicList5_index1_${music.id}" onmouseover="change1_musicList5_index1(${music.id})" onmouseout="change2_musicList5_index1(${music.id})" style="text-decoration:none;" href="#" onclick="addPlayList(${music.id})" title="添加到播放列表"><i id="coll"
									class="glyphicon glyphicon-plus"  style="margin-left: 5px;"></i>&nbsp;&nbsp;</span>
								<span onclick="addColl(${music.id})" id="musicList6_index1_${music.id}" onmouseover="change1_musicList6_index1(${music.id})" onmouseout="change2_musicList6_index1(${music.id})" style="text-decoration:none;" href="#" title="收藏"><i class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;</span>
									</span>
								</li>
							</c:forEach>
						</ol>
						<div style="margin-left:150px;">
						<a href="<%=request.getContextPath()%>/home/discover/rankList?cat=3" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
		</div>
			
	</div>
	</div>
	<!--右侧栏-->
	<div style="float:right;margin-top:2px;width:250px;">
		<c:choose>
			<c:when test="${sessionScope.user == null }">
				<!-- 没有登录显示-->
				<div style="background: 	#F5F5F5;border:1px solid  #DCDCDC">
					<p style="font-size:10pt;margin-left:20px;margin-right:20px;margin-top:15px;text-align: center;">
						登录心随乐动，可以享受无限收藏的乐趣
					</p>
					<button type="button" class="btn btn-danger" style="margin-left:80px;margin-top:10px;margin-bottom:15px;" data-toggle="modal" data-target="#myModal">用户登录</button>
				</div>
			</c:when>
			<c:when test="${sessionScope.user != null }">
				<!--登录之后显示-->
				<div style="height:200px;background: #F5F5F5;border:1px solid #DCDCDC">
					<div>
						
						<a href="<%=request.getContextPath()%>/home/myMusic">
							<c:if test="${sessionScope.user.img == '0'}">
								<img src="<%=request.getContextPath()%>/img/front/home/default_user.jpg" style="margin-left:20px;margin-top:20px;width:75px;height:90px;border:2px solid #d3d3d3;border-radius:5px;padding:3px;">
							</c:if>
							<c:if test="${sessionScope.user.img != '0'}">
								<img src="<%=request.getContextPath()%>/static/user/${sessionScope.user.img}" style="margin-left:20px;margin-top:20px;width:75px;height:90px;border:2px solid #d3d3d3;border-radius:5px;padding:3px;">
						</c:if>
								</a>
						<a href="<%=request.getContextPath()%>/home/myMusic" style="float:right;margin-right:60px;padding-top:18px;"><strong>${sessionScope.user.username}<strong></a>
						<a href="<%=request.getContextPath()%>/home/myMusic" style="float:right;margin-right:95px;margin-top:-70px;color:#A9A9A9"><i>LV.${sessionScope.user.level}</i></a>
						 <button onclick="addExperience()" type="button" class="btn btn-primary btn-sm" style="width:100px;float:right;margin-right:25px;margin-top:-35px;">签到</button>
						
					</div>
						<ul  style="list-style:none;padding-left:0px;overflow:hidden;font-size:12.5px;margin:25px auto;">
									<li style="float:left;border-right:1px solid #ccc;padding:5px;">
										<a href="<%=request.getContextPath()%>/home/myMusic" style="text-decoration:none;">
											<strong style="display:block">
												${size1_l }
											</strong>
											<span>收藏歌曲</span>
										</a>
									</li>
									<li style="float:left;border-right:1px solid #ccc;padding:5px;">
										<a href="<%=request.getContextPath()%>/home/myMusic" style="text-decoration:none;">
											<strong  style="display:block">${size2_l}</strong>
											<span>关注歌手</span>
										</a>
									</li>
									<li style="float:left;border-right:1px solid #ccc;padding:5px;">
										<a href="<%=request.getContextPath()%>/home/myMusic"  style="text-decoration:none;">
											<strong  style="display:block">${size3_l}</strong>
											<span>下载歌曲</span>
										</a>
									</li>
									<li style="float:left;padding:5px;">
										<a href="<%=request.getContextPath()%>/home/myMusic"  style="text-decoration:none;">
											<strong  style="display:block">${sessionScope.user.playcount}</strong>
											<span>播放次数</span>
										</a>
									</li>
								</ul>
				</div>
			</c:when>
		</c:choose>
		
		
		
	<!--入驻歌手-->	
		<div style="border:1px solid #DCDCDC;height:1300px">
			<div style="margin-top:20px;">
				<span style="margin-left:20px;">入驻歌手</span>
				<a href="<%=request.getContextPath()%>/home/discover/singer?cat=0" style="margin-left:70px;color:gray;font-size:10pt;">查看全部></a>
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/img/front/home/bottomLine.png" style="width:90%;margin-left:10px;;height:1pt;"></img>
			</div>
			<c:forEach items="${singerList}" var="singer">
				<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC;">
					<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">
						<img src="<%=request.getContextPath()%>/static/singer/${singer.img}" style=";width:62px;height:62px;">
						<div style="float:right;margin-right:50px;margin-top:10px;">
							<p>${singer.singername }</p></br>
							<!-- <a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a> -->
						</div>
					</a>
					
				</div>
			</c:forEach>
			
			
		</div>
	    <!--热门DJ-->
		<!--  <div style="border:1px solid #DCDCDC;height:931px;">
			<div style="margin-top:20px;">
				<a style="margin-left:20px;">热门DJ</a>
			
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/img/front/home/bottomLine.png" style="width:90%;margin-left:10px;;height:1pt;"></img>
			</div>
	
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
		</div>-->
	</div>
</div>
<input id="path23" type="hidden" value="<%=request.getContextPath()%>"/>
<script>
	var row = $(".row_left");
	var lunbo = $(".lunbo_left");
	var bangdan = $(".bangdan");
	//alert(row.length);
	for(var i=0;i<row.length;i++) {
		if(i == 0 || i == 4)
			row.eq(i).css("margin-left","20px")
	}
	
	for(var i=0;i<lunbo.length;i++) {
		if(i == 0 || i == 5) {
			lunbo.eq(i).css("margin-left","70px");
			lunbo.eq(i).children("span").children("i").css("margin-top:-65px !important");
		}
	}
	
	for(var i=0;i<bangdan.length;i++) {
		if(i == 0 || i == 10 || i == 20)
			bangdan.eq(i).css("margin-top","22px")
	}
	
	function change1_index(id) {
		
		$("#index_"+id).css({"color":"white","cursor":"pointer"});
	}
	
	function change2_index(id) {
		$("#index_"+id).css("color","#ccc");
	}
	
	function change1_musicList_index1(id) {
		
		$("#musicList_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList_index1(id) {
		$("#musicList_index1_"+id).css("color","black");
	}
	function change1_musicList_index2(id) {
		
		$("#musicList_index2_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList_index2(id) {
		$("#musicList_index2_"+id).css("color","black");
	}
	function change1_musicList_index3(id) {
		
		$("#musicList_index3_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList_index3(id) {
		$("#musicList_index3_"+id).css("color","black");
	}
	//change2_musicList1_index1
	function change1_musicList1_index1(id) {
		
		$("#musicList1_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList1_index1(id) {
		$("#musicList1_index1_"+id).css("color","black");
	}
	
	function change1_musicList2_index1(id) {
		
		$("#musicList2_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList2_index1(id) {
		$("#musicList2_index1_"+id).css("color","black");
	}
	
	function change1_musicList3_index1(id) {
		
		$("#musicList3_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList3_index1(id) {
		$("#musicList3_index1_"+id).css("color","black");
	}
	
	function change1_musicList4_index1(id) {
		
		$("#musicList4_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList4_index1(id) {
		$("#musicList4_index1_"+id).css("color","black");
	}
	
	function change1_musicList5_index1(id) {
		
		$("#musicList5_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList5_index1(id) {
		$("#musicList5_index1_"+id).css("color","black");
	}
	
	function change1_musicList6_index1(id) {
		
		$("#musicList6_index1_"+id).css({"color":"red","cursor":"pointer"});
	}
	
	function change2_musicList6_index1(id) {
		$("#musicList6_index1_"+id).css("color","black");
	}
	
	
	function addPlayList11(id) {
		var musicList = new Array();
		
		if(id == 3){
			musicList = "${musicList3}".split("[");
		}else if(id == 4){
			musicList = "${musicList4}".split("[");
		}else if(id == 5){
			musicList = "${musicList5}".split("[");
		}
		
		musicList = musicList[1];
		musicList = musicList.split("]");
		musicList = musicList[0].split(",");
		
		for(var i=0;i<musicList.length;i++){
			var k = parseInt(musicList[i]);
			if(!isNaN(k)) {
				addPlayList(k);
			}
		}
		
	}
	
	
	function playList11(id) {
		//alert(id);
		id = id + 2;
		
		var musicList = new Array();
		if(id == 3){
			addPlayList11(id);
			musicList = "${musicList3}".split("[");
		}else if(id == 4){
			addPlayList11(id);
			musicList = "${musicList4}".split("[");
		}else if(id == 5){
			addPlayList11(3);
			musicList = "${musicList3}".split("[");
		}
		//musicList = "${musicList}".split("[");
		musicList = musicList[1];
		musicList = musicList.split("]");
		musicList = musicList[0].split(",");
		playSongById(parseInt(musicList[0]));
	}
	
	//id="img_1_1" onmouseover="change()" title="播放"
	
	function change1(){
		$("#img_1_1").css("cursor","pointer");
	}
	
	function change2(){
		$("#img_1_2").css("cursor","pointer");
	}
	
	function change3(){
		$("#img_1_3").css("cursor","pointer");
	}
	
	function addColl(id) {
		addCollection(id);
	}
	
	function addListColl(list) {
		addListCollection(list);
	}
	
	function addExperience() {
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
		        url : $('#path23').val() + "/home/addLevel",  
		        dataType:"json",
		        cache : false,  
		        data : {  
		            userid : userid,
		        },  
		        async : false,  
		        error : function() {  
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html("网络异常");    
		        },  
		        success : function(data) { 
		        	if(data[0] == "success") {
		        		$("#myModal_tip").modal('show');
						$("#my_tip_info").html("+ 10点经验");  
		        	}else {
		        		$("#myModal_tip").modal('show');
						$("#my_tip_info").html("一日只能签到一次");  
		        	}
		        	
		        }  
		    }); 
		}
	};
</script>
