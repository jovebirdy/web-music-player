<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %>
<link href="<%=request.getContextPath()%>/css/front/findMusic/album.css" rel="stylesheet">
<div id="album">
	<div id="Navigation" >
		<h3>热门新歌</h3>
	</div>
	<div id="songpicture1" >
			<c:forEach begin="1" end="2" var="i">
				<ul style="float:left;font-size:13px;">
					<c:forEach items="${musicList}" begin="${(i-1)*5 }" end="${(i-1)*5 + 4 }" var="music">
						<li>
									<div> 	

										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}"><img src="<%=request.getContextPath()%>/static/music/img/${music.img}" alt="通用的占位符缩略图"></a></br>
										<div style="width:150px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-20px;color:#ccc;left:0px;">
											<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;color:white"></i>  
											<span id="play_counts_index_${music.id }" style="margin-top:5px;color:white;width:60px;">${music.playcounts}</span>
											<span  onclick="playSongById(${music.id})"><i id="musicList_${music.id}" onmouseover="change1_musicList(${music.id})" onmouseout="change2_musicList(${music.id})" class="glyphicon glyphicon-play-circle" style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>
										</div>
										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
										

									</div>
						</li>
					</c:forEach>
				</ul>
			</c:forEach>
	</div>
	<div id="Navigation" style="overflow:hidden;padding-top:10px" >
		<ol class="breadcrumb" style="background:none;height:auto;margin-bottom:10px;padding:0px;" >
			<li style="padding-bottom:-20px;""><a  style="text-decoration:none;font-size:24px; color:black;">全部新歌</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album" style="color:gray;">全部</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album?cat=1" style="color:gray;">华语</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album?cat=2" style="color:gray;">欧美</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album?cat=3" style="color:gray;">粤语</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album?cat=4" style="color:gray;">韩语</a></li>
			<li><a href="<%=request.getContextPath()%>/home/discover/album?cat=5" style="color:gray;">日语</a></li>
		</ol>
	</div>
	<div id="songpicture" style="width:1000px;min-height:400px;">
		
	</div>
	<div id="paging" style="float:right;" >
		<ul class="pagination" >
			
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
function change1_musicList(id) {
	
	$("#musicList_"+id).css({"color":"white","cursor":"pointer"});
}

function change2_musicList(id) {
	$("#musicList_"+id).css("color","#ccc");
}

function change1_musicList1(id) {
	
	$("#musicList_1_"+id).css({"color":"white","cursor":"pointer"});
}

function change2_musicList1(id) {
	$("#musicList_1_"+id).css("color","#ccc");
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
        url : $('#contextPath').val() + "/home/ajax_album_operation/" ,  
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
					html+='<span  onclick="playSongById(' + data[j].id + ')"><i id="musicList_1_' + data[j].id + '" onmouseover="change1_musicList1(' + data[j].id + ')" onmouseout="change2_musicList1(' + data[j].id + ')" class="glyphicon glyphicon-play-circle" style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>';
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