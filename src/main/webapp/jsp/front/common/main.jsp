<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
<script src="<%=request.getContextPath()%>/js/common/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body id="body">
	<iframe scrolling="auto" name="aa" id="aa" frameborder="0" src="${url == null ? 'http://localhost:8080/hwm/home/discover/1' : url}" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;border: 0;"></iframe>
	<jsp:include page="player.jsp"></jsp:include>
	
</body>
<script type="text/javascript">
		//var url = window.location.href;
		//alert(url);
		function ifurl(url){
			var stateObject = {};
			var title = "Wow Title";
			var newUrl = url + "/rf";
			//alert(newUrl);
			change_state(newUrl);
			change_state2(newUrl);
			change_state3(newUrl);
			history.pushState(stateObject,title,newUrl);
		};
		//alert("${url}");
		$("#body").bind("keydown", function(event) {
            if (event.keyCode == 116) {
                 if($("#aa") != null) {
                	//alert(116);
                    $("#aa").window.location.reload();      
                    return false;
                } 
            }
        }); 
		
		function change_state(url) {
			var tj = document.getElementById('aa').contentWindow.document.getElementById('tuijian');
			var rk = document.getElementById('aa').contentWindow.document.getElementById('rank');
			var sg = document.getElementById('aa').contentWindow.document.getElementById('song1');
			//var rd = document.getElementById('aa').contentWindow.document.getElementById('radio');
			var sig = document.getElementById('aa').contentWindow.document.getElementById('singer1');
			var ab = document.getElementById('aa').contentWindow.document.getElementById('album1');
			//alert(isContains(url,"http://localhost:8080/hwm/home/discover/singer"));
			
			if(url == "http://localhost:8080/hwm/home/discover/1/rf") {
				setCss(tj);
			}else if(url.indexOf("http://localhost:8080/hwm/home/discover/rankList") != -1) {
				setCss(rk);
			}else if(url.indexOf("http://localhost:8080/hwm/home/discover/musicList") != -1) {
				setCss(sg);
			}else if(url == "http://localhost:8080/hwm/home/discover/radio/rf") {
				setCss(rd);
			}else if(isContains(url,"http://localhost:8080/hwm/home/discover/singer") ) {
				setCss(sig);
			}else if(url == "http://localhost:8080/hwm/home/discover/album/rf") {
				setCss(ab);
			}
			
			
		}
		
		function setCss(ob) {
			ob.style.border = "1px solid #AA2222";
			ob.style.borderRadius = "15px";
			ob.style.boxShadow = "inset 0px 0px 1px 1px #BE3030";
			ob.style.backgroundColor = "#990000";
		}
		
		
		
		function change_state2(url) {
			var a = document.getElementById('aa').contentWindow.document.getElementsByClassName("singer");
			//alert(a.length);
			for(var i=0;i<a.length;i++){ 
				//alert(url);
				if(a[i].href+"/rf" == url) {
					setCss2(a[i]);
				}
				
			}
		}
		
		function change_state3(url) {
			var a = document.getElementById('aa').contentWindow.document.getElementsByClassName("rank_sort");
			//alert(a.length);
			for(var i=0;i<a.length;i++){ 
				//alert(url);
				if(a[i].href+"/rf" == url) {
					setCss2(a[i]);
				}
				
			}
		}
		
		function setCss2(ob) {
			ob.style.color="red";
		}
		
		function isContains(str, substr) {
		    return str.indexOf(substr) >= 0;
		}
		
		//长数字转换算法主函数：
		function NumberToChinese(num){
		  var unitPos = 0;
		  var strIns = '', chnStr = '';
		  var needZero = false;
		  //alert(num.toString().length);
		  var length = num.toString().length;
		  if(length <= 5){
		    return num;
		  }else if(length <= 8) {
			return parseInt(num/10000) + "万";
		  }else {
			return parseInt(num/100000000) + "亿";
		  }
		}
		
		
	</script>
</html>