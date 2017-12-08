<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<div style = "width:268px;float:right;">
	<div id= "ad"  style = "margin-top: 25px; margin-left: 30px;">
		<img src="<%=request.getContextPath()%>/img/front/home/ad.jpg">
	</div>
	<div id= "recmdHead" style = "width:250px; margin-left:10px; margin-top: 100px;font-weight: bold;border-bottom: 1px solid gray;">
		<p>相似歌手</p>
	</div>
	<div id= "recmdSinger">
		<ul  class="list-inline" style="font-size:12px;margin-top:10px;margin-left:10px;">
			<c:forEach items="${singerList}" var="singer">
				<li>
					<div>
						<a href = "<%=request.getContextPath()%>/home/singer?id=${singer.id}"> <img width="45px" height="50px" src="<%=request.getContextPath()%>/static/singer/${singer.img}"></a>					
					</div>
					<a href = "<%=request.getContextPath()%>/home/singer?id=${singer.id}" style ="clear:both;">${singer.singername }</a>
				</li>
			</c:forEach>
			
		</ul>
	</div>
	
</div>