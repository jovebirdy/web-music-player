<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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
</style>
<div id="user_whole">
	<div id="user_whole_padding">
		<div id="user_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
				<h4>"<i class="glyphicon glyphicon-search" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">${search}"的搜索结果(共${totalSize}条搜索记录)</span></h4>
		</div>
		<div id="user_musicList">
						<div id="user_musicList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="gequ"></a>
							<h4><i class="glyphicon glyphicon-music" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">歌曲(${fn:length(musicList) })</span></h4>
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
											<c:forEach items="${singerResultList1}" var="singer" varStatus="i">
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
									</li>
									</c:forEach>
								</ul>
							</c:forEach>
							
						</div>
					</div>
					<div id="user_singerList">
						<div id="user_singerList_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
							<a id="geshou"></a>
							<h4><i class="glyphicon glyphicon-user" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">歌手(${fn:length(singerResultList) })</span></h4>
						</div>
						<div id="user_singerList_info">
							<c:forEach begin="0" end="${size2}" var="i">
								<ul  style="list-style:none;padding-left:0px;overflow:hidden;margin-left:10px;">
									<c:forEach items="${singerResultList}" var="singer" begin="${i*3}" end="${i*3 + 2}" varStatus="j">
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
									</li>
									</c:forEach>
								</ul>
							</c:forEach>
							
						</div>
					</div>
		
	</div>
</div>
<script type="text/javascript">
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
</script>
