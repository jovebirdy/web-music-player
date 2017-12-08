<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/singer.css" rel="stylesheet">

	<div id="singer_sort">
		<div id="conmmend">
		<h3>推荐</h3>
		<ul>
			<li>
				<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer">推荐歌手</a>
			</li>
			<li>
				<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=0">入驻歌手</a>
			</li>
		</ul>
		</div>
		<div id="Chinese_singer" >
			<h3>华语</h3>
			<ul>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=1">华语男歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=2">华语女歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=3">华语组合/乐队</a>
				</li>
			</ul>
		</div>
		<div id="Europe_singer">
			<h3>欧美</h3>
			<ul>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=4">欧美男歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=5">欧美女歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=6">欧美组合/乐队</a>
				</li>
			</ul>
		</div>
		<div id="Japanese_singer">
			<h3>日本</h3>
			<ul>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=7">日本男歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=8">日本女歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=9">日本组合/乐队</a>
				</li>
			</ul>
		</div>
		<div id="Korea_singer">
			<h3>韩国</h3>
			<ul>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=10">韩国男歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=11">韩国女歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=12">韩国组合/乐队</a>
				</li>
			</ul>
		</div>
		<div id="other_singer">
			<h3>其他</h3>
			<ul>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=13">其他男歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=14">其他女歌手</a>
				</li>
				<li>
					<a class="singer" href="<%=request.getContextPath()%>/home/discover/singer?cat=15">其他组合/乐队</a>
				</li>
			</ul>
		</div>
	</div>
	