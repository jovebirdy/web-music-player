<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<script type="text/javascript">
function change(){
	
	$("#coll").attr("src","http://localhost:8080/hwm/img/front/home/collect2.png");
	
}
function change1(){
	
	$("#coll").attr("src","http://localhost:8080/hwm/img/front/home/collect1.png");
	
}

function addSingerColl(id) {
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
		        url : $('#contextPath').val() + "/singer/addUserSinger",  
		        dataType:"json",
		        cache : false,  
		        data : {  
		            userid : userid,
		            singerid : id
		        },  
		        async : false,  
		        error : function() {  
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html("网络异常");  
		        },  
		        success : function(data) { 
		        	$("#myModal_tip").modal('show');
					$("#my_tip_info").html(data[0]);  
		        }  
		    }); 
		}
	};

    
</script>
	<div id = "singerMesstop"style = "width:710px;">
		<div id = "head" style = "height:40px;margin-top:30px;">
			<p id = "singerName" style = "float:left;margin-left:50px;font-weight: normal;font-size: 24px;color: #333;">${singer.singername}</p>
		</div>
		<div id = "singerPic" style = "width:640px;margin:0 auto;">
			<img style = "width:642px;height:400px; border:1px solid #d3d3d3;z-index:0;"src = "<%=request.getContextPath()%>/static/singer/${singer.img}">
			<div style = "margin-left:550px; margin-top: -50px;z-index:666666666;">	
			<a style = "cursor:pointer;"> <img id="coll" onclick="addSingerColl(${singer.id})" onmouseover="change()" onmouseout="change1()" src="<%=request.getContextPath()%>/img/front/home/collect1.png"> </a>
			</div>
		</div>	
	
	</div>	
	
<script>
	
</script>