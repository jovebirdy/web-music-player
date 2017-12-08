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
	<div id="base" style="padding-bottom:50px;" >
		<div id="top">
			<tiles:insertAttribute name="top"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
		<div id="bottom">
			<tiles:insertAttribute name="bottom"/>
		</div>
	</div>
	<script type="text/javascript">
		var url = window.location.href;
		window.parent.ifurl(url);
		
		//console.info("${title}");
		if("${title}" == null) {
			$("#top_first").addClass("active");
			$("#top_second").removeClass("active");
			$("#top_third").removeClass("active");
		}else if("${title}" == "我的音乐") {
			$("#top_first").removeClass("active");
			$("#top_second").addClass("active");
			$("#top_third").removeClass("active");
		}else if("${title}" === "关于"){
			$("#top_first").removerClass("active");
			$("#top_second").removeClass("active");
			$("#top_third").addClass("active");
		}
		
		function addCollection(id) {
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
			        url : $('#contextPath').val() + "/music/addCollection",  
			        dataType:"json",
			        cache : false,  
			        data : {  
			            userid : userid,
			            musicid : id
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
		
		function addListCollection(list) {
			//alert(id);
			//alert("${sessionScope.user == null}");
			
			//alert(list.length);
			//alert(list[1]);
			//alert(typeof(list));
			var list1 = new Array();
			//alert(typeof(list1));
			var i=0;
			for(;i<list.length;i++) {
				list1[i] = "" + list[i];
			}
			//alert(list1.length);
	
			
			
			var user = "${sessionScope.user}";
			var userid = "${sessionScope.user.id}";
			
			list1[i] =  userid;
			var params = {};  
			params = JSON.stringify(list1); 
			//alert(params);
			if(user == "") {
				$("#myModal").modal('show');
			}else {
				//alert(id);
				$.ajax({  
			        type : "post",  
			        url : $('#contextPath').val() + "/music/addListCollection",  
			        dataType:"json",
			        cache : false,  
			        data : {list :params},
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
		
		// 文件下载
		function download1(url, method,filename){
		    jQuery('<form action="'+url+'" method="'+(method||'post')+'">' +  // action请求路径及推送方法
		                '<input type="text" name="filename" value="'+filename+'"/>' + // 文件名称
		            '</form>')
		    .appendTo('body').submit().remove();
		};
		function download(id) {
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
			        url : $('#contextPath').val() + "/music/download",  
			        dataType:"json",
			        cache : false,  
			        data : {  
			            userid : userid,
			            musicid : id
			        },  
			        async : false,  
			        error : function() {  
			        	$("#myModal_tip").modal('show');
						$("#my_tip_info").html("网络异常");  
			        },  
			        success : function(data) { 
		                 download1($('#contextPath').val() + "/music/download1", 'post', data[0]); // 下载文件
			        }  
			    }); 
			}
		};
		
		
	</script>
</body>
</html>