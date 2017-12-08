<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/body.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/top.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/player.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript">  
    function goTopEx() {  
        var obj = document.getElementById("goTopBtn");  
        function getScrollTop() {  
            return document.documentElement.scrollTop + document.body.scrollTop;  
        }  
        function setScrollTop(value) {  
            if (document.documentElement.scrollTop) {  
                document.documentElement.scrollTop = value;  
            } else {  
                document.body.scrollTop = value;  
            }  
        }  
        window.onscroll = function() {  
            getScrollTop() > 0 ? obj.style.display = "": obj.style.display = "none";  
        }  
        obj.onclick = function() {  
            var goTop = setInterval(scrollMove, 10);  
            function scrollMove() {  
                setScrollTop(getScrollTop() / 1.1);  
                if (getScrollTop() < 1) clearInterval(goTop);  
            }  
        }  
    } 
    
    function addPlayList(id) {
    	//alert(id);
    	window.parent.addListAndPlay(id);
    }
    
    function playSongById(id) {
    	//alert(id);
    	window.parent.addListAndPlay(id);
    	window.parent.playSongById(id);
    }
    
</script>  
	<!--第一栏 导航栏 + 搜索框 + 登陆按钮 -->
	<div id="tab-header" >  										
		<nav class="navbar  navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-left navbar-toggle collapsed " data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span><!-- 三个带有.icon-bar 的 <span> 创建所谓的汉堡按钮 -->
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
				    </button>
						  <a class="navbar-brand" href="/hwm/home/discover/">
			  				<img style="margin-top:-15px;width:130px;height:50px;margin-left:-18px;" src="<%=request.getContextPath()%>/img/front/home/logo.png"/>
						  </a><!-- navbar-brand让文本看起来更大一号 -->
			    </div>
					
				<div id="navbar" class="collapse navbar-collapse"><!-- 给导航栏添加响应式，包裹在带有.collapse、.navbar-collapse  -->
					<ul class="nav navbar-nav" id="myTab"><!--nav navbar-nav 导航栏添加链接-->
						<li id="top_first" class="active"><a href="/hwm/home/discover/1"><span class="glyphicon glyphicon-search"></span> 发现音乐</a></li>
						<li id="top_second"><a href="/hwm/home/myMusic"><span class="glyphicon glyphicon-user"></span> 我的音乐</a></li>
						<li id="top_third"><a href="#contact">关于</a></li>
					</ul>
				</div>
				
				<!-- 登陆 -->
				<div class="dropdown pull-right" >
					  <c:choose>
						<c:when test="${sessionScope.user == null }">
					 		 <button class="btn btn-default" type="button" id="dropdownMenu1" data-toggle="modal" data-target="#myModal">
					  	    	<span style="margin:0 auto;color:white;">登陆</span>
					  			  <span class="caret"></span>
					  		 </button>
					     </c:when>
					     <c:when test="${sessionScope.user != null}">
					  		<button class="btn btn-default" type="button" id="dropdownMenu1" onclick ="toLogOut()">
					  	    	<span style="margin:0 auto;color:white;">注销</span>
					  			  <span class="caret"></span>
					  		 </button>
					  		 </c:when>
					  </c:choose>
				</div> 
				
				<!-- 搜索 -->
				<div class="btn-group  pull-right">
					<% String action1 = request.getContextPath() + "/home/search";%>
					<form  class="navbar-form navbar-left" role="search" action="<%=action1%>"> 
						<div class="form-group"> 
							<input name="searchCondition" style="width:200px;border-radius:20px;" type="text" class="form-control" placeholder="单曲/歌手/专辑/歌单/mv/用户"> 
						</div> 
						
					</form>
				</div>
			  </div>
		</nav>
	</div>
	
	<div class="tab-content" style="margin-top:70px;">
		<!--我的音乐对应转换第二导航栏 -->
		<div class="tab-pane active" id="home" style="background-image:url('<%=request.getContextPath()%>/img/front/home/redBg.png');background-repeat:repeat-x;">
			<ul class="nav nav-pills" style="margin-left:290px;margin-top:-20px;">
				<li><a id="tuijian" href="/hwm/home/discover/1"  style="height:34px;color:white;">推荐</a></li>
				<li><a id="rank" href="/hwm/home/discover/rankList"  style="height:34px;color:white;">排行榜</a></li>
				<li><a id="song1" href="/hwm/home/discover/musicList"  style="height:34px;color:white;">歌单</a></li>
				<li><a id="singer1" href="/hwm/home/discover/singer"  style="height:34px;color:white;">歌手</a></li>
				<li><a id="album1" href="/hwm/home/discover/album" style="height:34px;color:white;">新碟上架</a></li>
			</ul>
		</div>
		<div class="tab-pane" id="profile">
				<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
		<div class="tab-pane" id="messages">
		<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
		<div class="tab-pane" id="settings">
		<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
	</div>
	<!--回到顶部按钮-->
	<div style="display: none;margin-right:150px;" id="goTopBtn" >
		<button type="button" class="btn btn-default btn-sm" style="width:45px;height:45px;">
	          <span class="glyphicon glyphicon-chevron-up"></span><br/> TOP
	    </button>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" id = "dialog" style = "width:330px;"role="document"> <!--修改窗口位置-->
		<div class="modal-content" style = "width:330px;height:350px;">
			<div class="modal-header" id ="aaa" style = "padding:0px !important; background-color:#2D2D2D;border-radius:5px 5px 0px 0px;height:40px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style = "color:white;padding-right:20px;padding-top:10px;">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel" style = "color:white;font-size:150%;padding-left:15px;padding-top:5px;">
					登录
				</h4>
			</div>
			<div class="modal-body" style = "height:300px;width:330px;"> 
				
					<div style = "width:300px;height:230px;">
					<% String action = request.getContextPath() + "/home/doLogin";%>
						<sf:form method="post" modelAttribute="user" action="<%=action %>">
						<div style = "padding-top:20px;margin-left:45px;height:140px;width:200px">
						
							<div>
								<sf:input type="text" class="form-control" id="name" path = "username" placeholder="请输入账号"></sf:input>
							</div>
							<div style = "margin-top:20px;">
								<sf:input type="password" class="form-control" id="password" path = "password" placeholder="请输入密码"></sf:input>
							</div>
							<div style = "height:15px;width:200px;margin-top:10px;">
								<label style = "height:15px;width:200px;">
									<!-- <input type="checkbox" style = "float:left;"> -->
									 <!--<p style = "height:12px;color:gray;font-size:90%;font-weight:lighter;float:left; padding-top:2px;padding-left:10px;">自动登录</p>-->
									 <a href = "<%=request.getContextPath()%>/home/getPassword/" style = "margin-left: 70px;color:gray;font-size:90%;font-weight:lighter;float:left;padding-top:2px;padding-left:60px;">
										忘记密码？
									 </a>
								</label>
							</div>
							
						</div>
						<div style = "padding-top:30px;margin-left:45px;width:200px">
							<button type="submit" class="btn btn-primary" style = "width:200px;">登陆</button>
						</div>
						</sf:form>
						
						
						<div style = "padding-top:10px;margin-left:45px;width:200px">
							<button type="button" class="btn btn-default" data-dismiss="modal" style = "width:200px;" onclick = "toLogup()">注册</button>
						</div>
						<div style = "padding-top:10px;margin-left:45px;width:200px;color:red;">
						<c:out value="${message}"></c:out></div>
					</div>
						<input type="hidden" value="<%=request.getContextPath()%>" id="contextPath"/>
						<input type="hidden" value="${sessionoScope.user }" id="sessionuser"/>
						<input type="hidden" value="${sessionScope.user.id }" id="sessionuserid"/>
					
	
			
				
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal_tip" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
					
				</div>
				<div style = "padding-top:30px;margin-left:45px;width:200px">
							<button  class="btn btn-primary" style = "width:200px;margin-top: -30px;margin-left: 90px;" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!--<button class="btn btn-primary" style = "width:200px;" onclick="showModal1()" >登陆</button>-->
	<script>
		goTopEx();		
		function toLogup() {
			window.location.href="http://localhost:8080/hwm/home/logup";
		}
		function toLogOut(){
			window.location.href="http://localhost:8080/hwm/home/logOut";
		}

		if("${message}" != "") {
			$('#myModal').modal('show');
			clearSession();
		}
		function clearSession() {
			$.ajax({  
		        type : "get",  
		        url : $('#contextPath').val() + "/home/clearSession/",  
		        dataType:"json",
		        cache : false,  
		        data : {  
		            
		        },  
		        async : false,  
		        error : function() {  
		        },  
		        success : function(data) { 
		        	
		        }  
		    }); 
		}
		
		function showModal() {
			$('#myModal').modal('show');
		}
		
		function showModal_my(data){
			$("#myModal_tip").modal('show');
			$("#my_tip_info").html(data);
		}
		
	</script>
	  
	