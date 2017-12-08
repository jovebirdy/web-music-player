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
	  <div class="container aside-xxl"> <a class="navbar-brand block" href="#">验证成功，请修改密码</a>
	    <section class="panel panel-default bg-white m-t-lg">
	      <header class="panel-heading text-center"> <strong>修改密码</strong> </header>
	      <% String action = request.getContextPath() + "/home/doAlterPwd/";%>
	     <sf:form class = "panel-body wrapper-lg" data-validate="parsley" method="post" modelAttribute="user" action="<%=action %>">
       		 <div class="form-group">
	          <label class="control-label">新密码</label>
	          <sf:input type="password" id = "pwd" class="form-control input-lg" path ="password" data-required="true"></sf:input>
	         </div>
	        <div class="form-group">
	          <label class="control-label">确认密码</label>
	          <input type="password" class="form-control input-lg" data-equalto="#pwd" data-required="true"></input>
	         </div>
	        <button type="submit" class="btn btn-primary">确认修改</button>
	        <div class="line line-dashed"></div>
	       
	      </sf:form>
	      <div>
	      	<c:out value="${message }"></c:out>
	      </div>
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
	<script src="<%=request.getContextPath()%>/js/back/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
<script src="<%=request.getContextPath()%>/js/charts/easypiechart/jquery.easy-pie-chart.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/charts/sparkline/jquery.sparkline.min.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/charts/flot/jquery.flot.min.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/charts/flot/jquery.flot.tooltip.min.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/charts/flot/jquery.flot.resize.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/charts/flot/jquery.flot.grow.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/charts/flot/demo.js" cache="false"></script> 
<script src="<%=request.getContextPath()%>/js/common/bootstrap_calendar.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/common/demo.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/common/jquery.sortable.js" cache="false"></script>  
<script src="<%=request.getContextPath()%>/js/file-input/bootstrap-filestyle.min.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/select2/select2.min.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/parsley/parsley.min.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/js/parsley/parsley.extend.js" cache="false"></script>
</body>
</html>