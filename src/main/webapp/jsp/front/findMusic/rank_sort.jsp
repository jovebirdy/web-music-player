<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath()%>/css/front/findMusic/rankList.css" rel="stylesheet">
<div id="rank_sort">
		<div id="conmmend">
			<strong>心动特色榜</strong>
			<ul class="nav nav-pills nav-stacked" style="max-width: 260px;">
				<li>
						
					<a class="rank_sort" href="<%=request.getContextPath()%>/home/discover/rankList"><img src="<%=request.getContextPath()%>/img/front/home/soar.png"  style="width:40px;height:40px;"></img>&nbsp;&nbsp;心动飙升榜</a>
			
				</li>
				<li>
					<a class="rank_sort" href="<%=request.getContextPath()%>/home/discover/rankList?cat=2"><img src="<%=request.getContextPath()%>/img/front/home/newMusic.png"  style="width:40px;height:40px;"></img>&nbsp;&nbsp;心动新歌榜</a>
				</li>
				<li>
					<a class="rank_sort" href="<%=request.getContextPath()%>/home/discover/rankList?cat=3"><img src="<%=request.getContextPath()%>/img/front/home/hot.png"  style="width:40px;height:40px;"></img>&nbsp;&nbsp;心动热歌榜</a>
				</li>
			</ul>
		</div>
		
</div>
