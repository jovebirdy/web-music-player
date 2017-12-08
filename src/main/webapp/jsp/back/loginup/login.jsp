<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="bg-dark js no-touch no-android no-chrome firefox no-iemobile no-ie no-ie10 no-ie11 no-ios">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心随乐动</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.v2.css" type="text/css" />
</head>
<body>
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
	  <div class="container aside-xxl"> <a class="navbar-brand block" href="<%=request.getContextPath()%>/admin/login/">心随乐动后台管理</a>
	    <section class="panel panel-default bg-white m-t-lg">
	      <header class="panel-heading text-center"> <strong>管理员登录</strong> </header>
	      <% String action = request.getContextPath() + "/admin/doLogin/";%>
	     <sf:form data-validate="parsley" class = "panel-body wrapper-lg" method="post" modelAttribute="admin" action="<%=action %>">
        <div class="form-group">
	          <label class="control-label">用户名</label>
	          <sf:input data-required="true" type="text" class="form-control input-lg" path ="adminname"></sf:input>
	        </div>
	        <div class="form-group">
	          <label class="control-label">密码</label>
	          <sf:input data-required="true" type="password" path="password" class="form-control input-lg"></sf:input>
	        </div>
	        <!--  <div class="checkbox">
	          <label>
	            <input type="checkbox">
	            记住密码 </label>
	        </div>
	        <a href="#" class="pull-right m-t-xs"><small>忘记密码?</small></a>-->
	        <button type="submit" class="btn-primary btn btn-block">登录</button>
	        <div class="line line-dashed"></div>
		  	<div style="color:red;font-size:15px;" class="text-center">
		      	<c:out value="${message }"></c:out>
		     </div>
	      </sf:form>
	      
	    </section>
	  </div>
	</section>
	<!-- footer -->
	<footer id="footer">
	  <div class="text-center padder">
	    <p> <small>Heart With Music<br>
	      &copy; 2017</small> </p>
	  </div>
	</footer>
	<!-- / footer --> <script src="<%=request.getContextPath()%>/js/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
</body>
<script src="<%=request.getContextPath()%>/js/back/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
<script src="<%=request.getContextPath()%>/js/parsley/parsley.min.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/parsley/parsley.extend.js" cache="false"></script>

</html>