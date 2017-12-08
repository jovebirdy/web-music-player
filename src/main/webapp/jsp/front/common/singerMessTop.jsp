<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1">
	<title>${title }</title>
	<script src="<%=request.getContextPath()%>/js/common/jquery-3.1.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="base" style="padding-bottom:50px;">
		<div id="top">
			<tiles:insertAttribute name="top"/>
		</div>
		<div style = "width:980px;overflow: hidden;margin:0 auto; background-color: white;border-left:1px solid #d3d3d3;border-right:1px solid #d3d3d3;"><!-- 歌手信息-->
			<div id="singerMess_Left" style="width:710px;overflow:hidden;float:left;border-right:1px solid #d3d3d3;">
				<tiles:insertAttribute name="singerMessTop"/>
				<tiles:insertAttribute name="content"/>
			</div>
			<div id="singerMess_Right" style="width:268px;float:right;">
				<tiles:insertAttribute name="singerMessRight"/>
			</div>	
			
		</div>
		<div id="bottom">
			<tiles:insertAttribute name="bottom"/>
		</div>
	</div>
</body>
<script type="text/javascript">
	var url = window.location.href;
	window.parent.ifurl(url);
</script>
</html>