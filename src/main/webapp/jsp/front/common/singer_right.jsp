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
		<h3>${typeName }</h3>
	</div>
	<!--<div id="Letter">
		  <ul>
			<li><a href="#" style="margin-left:-30px;">热门</a></li>
			<li><a href="#">A</a></li>
			<li><a href="#">B</a></li>
			<li><a href="#">C</a></li>
			<li><a href="#">D</a></li>
			<li><a href="#">E</a></li>
			<li><a href="#">F</a></li>
			<li><a href="#">G</a></li>
			<li><a href="#">H</a></li>
			<li><a href="#">I</a></li>
			<li><a href="#">J</a></li>
			<li><a href="#">K</a></li>
			<li><a href="#">L</a></li>
			<li><a href="#">M</a></li>
			<li><a href="#">N</a></li>
			<li><a href="#">O</a></li>
			<li><a href="#">P</a></li>
			<li><a href="#">Q</a></li>
			<li><a href="#">R</a></li>
			<li><a href="#">S</a></li>
			<li><a href="#">T</a></li>
			<li><a href="#">U</a></li>
			<li><a href="#">V</a></li>
			<li><a href="#">W</a></li>
			<li><a href="#">X</a></li>
			<li><a href="#">Y</a></li>
			<li><a href="#">Z</a></li>
			<li><a href="#">其他	</a></li>
		</ul>
	</div>-->
	<div id="singerpicture" >
			<c:forEach begin="1" end="2" var="i">
				<ul>
					<c:forEach items="${singerList}" begin="${(i-1)*5 }" end="${(i-1)*5 + 4 }" var="singer">
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
	<div id="singername">
		<c:forEach begin ="1" end="14" var = "i">
			<ul>
				<c:forEach items="${singerList }" begin = "${(i-1)*5 }" end="${(i-1)*5 + 4 }" var="singer">
					<li style="margin-left:-10px;"><a href="<%=request.getContextPath()%>/home/singer?id=${singer.id}">${singer.singername}</a></li>
				</c:forEach>
			</ul>
		</c:forEach>
		
	</div>
</div>
