<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<link href="<%=request.getContextPath()%>/css/front/findMusic/musicList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/findMusic/album.css" rel="stylesheet">

<div id="musicList">
	<div id="musicList_choose">


		<span style="font-size: 25px;">${typeName}</span>
		<button id="musicList_chooseBtn"  type="button" class="btn btn-default" title="<button type='button' class='btn btn-default' onclick='toAll()'>全部分类</</button>"
			data-container="body" data-toggle="popover" data-placement="bottom" 
			data-content='
			
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-flag"></span><span style="margin-left:10px;">语言</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=1">华语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=2">英语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=3">粤语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=4">韩语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=5">日语</a>
							<div>
						</div>
					</div>
					</div>
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-headphones"></span><span style="margin-left:10px;">风格</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=6">流行</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=7">摇滚</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=8">民谣</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=9">说唱</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=10">电子</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=11">古风</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=12">轻音乐</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=13">金属</a>
							<div>
						</div>
					</div>
					</div>
					
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-road"></span><span style="margin-left:10px;">场景</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=14">清晨</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=15">夜晚</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=16">学习</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=17">工作</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=18">午休</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=19">地铁</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=20">驾车</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=21">运动</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=22">旅行</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=23">散步</a>
							<div>
						</div>
					</div>
					</div>
					
			'>
			选择分类<span class="glyphicon glyphicon-chevron-down" style="vertical-align:middle;margin-left:8px;"></span>
		</button>
	</div>
	<div id="songpicture" style="width:1000px;min-height: 400px;" >
			
			
	</div>
	<div id="paging" style="margin: 20px 20px;float: right;">
		<ul class="pagination">
			
		</ul>
	</div>
	
	<div>
        <input type="hidden" value="${pageSize }" id="pageSize"/>
        <input type="hidden" value="${counts }" id="counts"/>
        <input type="hidden" value="${cat}" id="cat"/>
        <input type="hidden" value="<%=request.getContextPath()%>" id="contextPath"/>
    </div>
</div>



<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/jqPaginator.js"></script>
<script>
	var flag = 1;
	$(function () { 
		$("[data-toggle='popover']").popover({html : true,placement :' auto bottom' });
		$(document).on("click",function(e) { 
			if($(e.target).attr("id") == "musicList_chooseBtn" ){
				flag = 0;
			}
			//console.info("hello");
			if($(e.target).attr("id") != "musicList_chooseBtn" && flag == 0 ) {
				$("#musicList_chooseBtn").popover('hide'); 
				flag = 1;
			}
			
		});
	});
	
	function toAll() {
		window.location.href = "http://localhost:8080/hwm/home/discover/musicList";
	}
	
	function change1_musicList(id) {
		
		$("#musicList_"+id).css({"color":"white","cursor":"pointer"});
	}
	
	function change2_musicList(id) {
		$("#musicList_"+id).css("color","#ccc");
	}
	
	//记录总页面和每页数
	var ps = Number(document.getElementById("pageSize").value);
	var tc = Number(document.getElementById("counts").value);
	
	if(tc == 0) {
		$('#songpicture').html("<span style='color:gray;font-size:20px;margin: 50px 400px;'>没有歌单信息</span>");
	}
	
	//分页
	$('.pagination').jqPaginator({
		totalCounts: tc,
		pageSize: ps,
		visiblePages: 5,
		currentPage: 1,
		first: '<li class="first"><a href="javascript:;">首页</a></li>',
		last: '<li class="last"><a href="javascript:;">尾页</a></li>',
		prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
		next: '<li class="next"><a href="javascript:;">下一页</a></li>',
		page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
		onPageChange: function (num, type) {
				getPage(num);
			
			//$('#p3').html('当前第' + num + '页');
		}
	});
	//alert(document.getElementById("musicname").value);
	//alert("${musicname}");
	//获取每页的数据
	function getPage(page,k){
		var ps = Number(document.getElementById("pageSize").value);
		var tc = Number(document.getElementById("counts").value);
		var cat = Number(document.getElementById("cat").value);
		//alert(tc);
		//alert(sn);
		$.ajax({  
	        type : "POST",  
	        url : $('#contextPath').val() + "/home/ajax_musicList_operation/" ,  
	        dataType:"json",
	        cache : false,  
	        data : {  
	            pageIndex: page,
	            pageSize: ps,
	            totalPage:tc,
	            cat:cat
	        },  
	        async : false,  
	        error : function() {  
	        	$("#myModal_tip").modal('show');
				$("#my_tip_info").html("网络异常");
	        },  
	        success : function(data) { 
	        	var html = "";
	        	var path = $('#contextPath').val() +  "/img/front/home/bottomBg.png";
	        	var size1 = Math.ceil(data.length/5);
	        	for(var i=0;i<size1;i++) {
	        		html+='<ul id="second">';
	        		for(var j=i*5;j<=i*5+4&&j<data.length;j++) {
	        			html+='<li><div><a href="<%=request.getContextPath()%>/home/music?id=' + data[j].id + '"><img src="<%=request.getContextPath()%>/static/music/img/' + data[j].img + '" alt="通用的占位符缩略图"></a></br>';
						html+="<div style='width:150px;height:25px;background-image:url(";
						html+= path + ");opacity:0.8;position:relative;top:-20px;color:'#ccc';left:0px;'>";
						html+='<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;color:white"></i> '; 
						html+='<span id="play_counts_index_' + data[j].id + '" style="margin-top:5px;color:white;width:60px;">' + data[j].playcounts + '</span>';
						html+='<span  onclick="playSongById(' + data[j].id + ')"><i id="musicList_' + data[j].id + '" onmouseover="change1_musicList(' + data[j].id + ')" onmouseout="change2_musicList(' + data[j].id + ')" class="glyphicon glyphicon-play-circle" style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>';
						html+='</div><a href="<%=request.getContextPath()%>/home/music?id=' + data[j].id + '">' + data[j].musicname + '</a>';
						html+='</div></li>';
		        	}
	        		html+='</ul>';
	        	}
	        	
	    		$('#songpicture').html(html);
	        }  
	    });  
	};
</script>