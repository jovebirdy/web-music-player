<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %>
<link href="<%=request.getContextPath()%>/css/front/findMusic/singer.css" rel="stylesheet">

<div id="singer_list">
	<div style="padding-top:30px;border-bottom: 2px solid #C10D0C;">
		<h3>入驻歌手</h3>
	</div>
	
	<div id="singerpicture" style="border-bottom:none;height:400px;padding-top: 30px;" >
			<c:forEach begin="1" end="${size }" var="i">
				<ul>
					<c:forEach items="${singerList1}" begin="${(i-1)*5 }" end="${(i-1)*5 + 4 }" var="singer">
						<li >
							<div> 	
								<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}"><img src="<%=request.getContextPath()%>/static/singer/${singer.img}" alt="通用的占位符缩略图"
									style="height:150px;width:130px"></a></br>
									<a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername }</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:forEach>
			
	</div>
</div>
