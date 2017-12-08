	//格式化显示时间
    function format(time) {
		//获取分钟和秒
		var min = Math.floor(time/60);
		var sec = Math.floor(time%60);
		//将分钟和秒转换成两位
		if(min.toString().length == 1) {
			min = '0' + min;
		}
		if(sec.toString().length == 1) {
			sec = '0' + sec;
		}
		
		return min + ':' + sec;
	}
	
	var music = document.getElementById('audio');
	//定义歌词数组
	var lyric = [];
	//alert(lrc);
	//绑定timeupdate事件
	var k = 30
	music.addEventListener('timeupdate',function(){
		if (!isNaN(music.duration)) {
			var progressValue = music.currentTime/music.duration; //用时间比来获取进度条的值
			if(progressValue == 1){					progressValue=0;//当播放完成，进度条跳到开始
				$("#btn-play").removeClass("glyphicon glyphicon-play ");
				$("#btn-play").addClass("glyphicon glyphicon-pause");
			}
			//显示歌词
			//console.info(music.currentTime);
			//console.info(lyric[lyric.length-1][0]);
			for (var i = 0;i < lyric.length; i++) {
				if (music.currentTime > lyric[i][0] - 1 ) {
					//var k = 30;
					//console.info($('.lyric-content').css('top'));
					//console.info(lyric[i][0] + "  " + music.currentTime);
					if(parseInt($('.lyric-content').css('top')) < 80) {
						//console.info("aaa");
						k = 25;
					}
					$('p[name=lyric]').css('color', '#fff'); 
					$('p#'+i).css('color', 'red');

					$('.lyric-content').css('top',210 - k * (i+1));
				}
			};
			//console.info("hello");
			//拖动滑块事件	
			$(function() {
				$( "#slider-range-max" ).slider({
					range: "min",
					max: music.duration,
					value: music.currentTime,
					//step:1,
					animate : true,
					slide:function(event,ui){
						music.currentTime = ui.value;
					}
				});
					
		    });
			//更新音乐时间	
			$("#playTime").text(format(music.currentTime));
			$("#surplusTime").text('/' + format(music.duration));
		}
	},false);
	//调节音量
	$( "#volume" ).slider({
		orientation: "vertical",
		range: "min",
		max: 100,
		value: 50,
		step:1,
		slide: function(event, ui) {
			music.volume = ui.value/100;
			//console.info(music.currentTime);
		}
	});

	//加载歌词
	function loadLyric(lyric) {
		var lyricContent = $('#show-lrc-content');
		lyricContent.html("");
		_.each(lyric, function(content, index, $){
			lyricContent.append('<p style="font-size:12px;" name="lyric" id=' + index + '>' + content[1] + '</p>');
		});
	}
	//获取歌词
	function parseLyric(lyric) {
	    var lines = lyric.split('\n'),
	        pattern = /\[\d{2}:\d{2}.\d{2}\]/g,
	        result = [];
	    while (!pattern.test(lines[0])) {
	        lines = lines.slice(1);
	    };
	    lines[lines.length - 1].length === 0 && lines.pop();
	    _.each(lines, function(data, step){
	        var index = data.indexOf(']');
	        var time = data.substring(0, index+1),
	        	value = data.substring(index+1);
        	var timeString = time.substring(1, time.length-2);
        	var timeArr = timeString.split(':');
        	result.push([parseInt(timeArr[0], 10) * 60 + parseFloat(timeArr[1]), value]);

	    });
	    result.sort(function(a, b) {
	        return a[0] - b[0];
	    });
    	return result;
	}
	var path1 = document.getElementById("path").value;
	
	//console.info(path1);
	//播放器事件
	var Player = {  
            // 歌曲路径  
            path : path1 + '/static/music/song/',  
            path2 : path1 + '/static/music/lrc/',
            // 歌曲数据  
            data : null,  
			
			//歌曲歌词
			lyricSrc : null,
      
            // 当前播放歌曲的 索引  
            currentIndex : -1, 
            
            //当前播放的歌曲id
            currentId : -1,
      
            //播放器元素jquery对象  
            $audio : $('audio'),  
      
            // 歌曲列表  
            $mList : $('#m-list'),  
      
            //正在播放的歌曲  
            $rmusic : $('#rmusic'),  
      
            // 初始化 数据  
            init : function() {  
      
                // 数据一般来自服务器端,通过ajax 加载数据,这里是模拟  
                Player.data = [];//['追梦赤子心.mp3', '逃跑计划-夜空中最亮的星.mp3'];  
				Player.lyricSrc = [];//['追梦赤子心.lrc','逃跑计划-夜空中最亮的星.lrc'];
      
                // 一般用模板引擎,把数据 与 模板 转换为 视图,来显示,这里是模拟  
                var mhtml = '';  
                var len = Player.data.length;  
                for (var i = 0; i < len; i++) {  
                    mhtml += '<li><a index="' + i + '">' + Player.data[i].split(".")[0] + '</a></li>';  
                }  
                Player.$mList.html(mhtml);  
            },  
      
            // 就绪  
            ready : function() {  
                // 控制  
                Player.audio = Player.$audio.get(0);  
      
                $('#ctrl-area').on('click', 'button', function() {  
                    //Player.$rmusic.html(Player.data[Player.currentIndex]);  
                });  
				
				//绑定播放暂停控制 
				  
				var media = $('#audio')[0];   
				
				$('#div-play').bind('click', function() {  
					playAudio();  
				}); 
				
				//播放暂停切换  
				function playAudio() { 
					//alert(media.paused);
					//console.info(media.paused);
					if(media.paused) {  
						play();  
					} else {  
						pause();  
					}  
				}  
				   
      
                // 播放  
                function play() { 
                    Player.audio.play();  
					//$('#btn-play').text("播放"); 
                };  
      
                // 暂停  
                function pause() { 
                    Player.audio.pause();  
					//var time = media.currentTime/media.duration;;
					//alert(time);
					//$('#music_prog').css("width",360*time);
					//$('#btn-play').text('暂停');
                };  
      
                // 下一曲  
                $('#div-next').click(function() {  
                	console.info(Player.data.length);
                    if (Player.currentIndex == -1) {  
                        Player.currentIndex = 0;  
                    } else if (Player.currentIndex == (Player.data.length-1)) {  
                        Player.currentIndex = 0;  
                    } else {  
                        Player.currentIndex++;  
                    }  
                    console.info("next");
                    console.info(Player.currentIndex);
                    
					Player.play(Player.data[Player.currentIndex].id);
                    
                });  
      
                // 上一曲  
                $('#div-pre').click(function() {  
                    if (Player.currentIndex == -1) {  
                        Player.currentIndex = 0;  
                    } else if (Player.currentIndex == 0) {  
                        Player.currentIndex = (Player.data.length - 1);  
                    } else {  
                        Player.currentIndex--;  
                    }  
					
                  //显示歌词
					
					Player.play(Player.data[Player.currentIndex].id);  
                });  
				
				 
                Player.audio.onended = function() {	
					 // 单曲循环 
					if(flag2 == 0){
						console.log("Player.currentIndex :", Player.currentIndex); 
                        Player.audio.load();  
                        Player.audio.play();  
						//alert("hah");
					}else if(flag2 == 1){// 顺序播放 
						console.log("Player.currentIndex :", Player.currentIndex); 
						$('#btn-next').click(); 
						//alert("hah1");						
					}else if(flag2 == 2){// 随机播放
						//alert(Player.data.length);
						var k = parseInt((Player.data.length - 1) * Math.random());
						//alert(k);
			            $.each(Player.data[k],function(j){
			            	if(j == "id")
			            		i = Player.data[k][j];	
			            });
			            //alert(i);
                        Player.play(i);
						//alert("hah2");						
					}
                }; 
				  
      
                // 播放指定歌曲  
                Player.play = function playByMe(i) { 
                	Player.currentId = i;
                	//变换播放和未播放
                	var list = $("#m-list li");
                	for(var j=0;j<list.length;j++) {
                		//alert(list.eq(j).attr("id"));
                		if(list.eq(j).attr("id") == i) {
                			list.eq(j).attr("class","1");
                			$("#"+i).css("background-color","#3c3c3c");
                			$($("#"+i).children("i").get(0)).css("display","inline");
                			$($("#"+list.eq(j).attr("id")).children("i").get(0)).css("color","red");
                		}else {
                			$("#"+list.eq(j).attr("id")).css("background-color","black");
                			list.eq(j).attr("class","0");
                			$($("#"+list.eq(j).attr("id")).children("i").get(0)).css("color","black");
                		}
                		
                	}
                	
                    //console.log("index:", i); 
                    for(var k=0;k<Player.data.length;k++) {
                    	$.each(Player.data[k],function(j){ 
                    		if(i == Player.data[k][j]) {
                    			Player.currentIndex = k;
                    			Player.audio.src = Player.path + Player.data[k].name + ".mp3";  
                                Player.audio.play(); 
                                $("#music_img").attr("src",path1+"/static/music/img/"+Player.data[k].name+".jpg");
                                $("#music_path").attr("href",path1+"/home/music?id="+Player.data[k].id);
                                //Player.currentIndex = i;  
                                //Player.$rmusic.html(Player.data[Player.currentIndex].name); 
            					$("#panel-song-title").text(Player.data[k].name);
            					//console.info(k);
            					//显示歌词
            					$.get(Player.path2 + Player.data[k].name + ".lrc", function(lrc) {
            						//alert(lrc);
            						lyric = parseLyric(lrc);
            						//console.info(lyric);
            						//debugger
            						loadLyric(lyric);
            						//palyMusic(0);
            					});
            					//alert(Player.data[k]['name']);
            					$("#rmusic").html(Player.data[k]['name']);
                    		}
                    	}); 
                    }
                    
                    var music_play = $("#aa").contents().find(".music_play");
                    //alert(music_play.length);
                    for(var k=0;k<music_play.length;k++){
        				music_play.eq(k).css("color","black"); 
        				music_play.eq(k).removeClass("play_music");
        			}
                	for(var k=0;k<music_play.length;k++) {
                		//alert(music_play.eq(k).attr("id"));
                		if(music_play.eq(k).attr("id") == "music_"+Player.data[Player.currentIndex].id) {
                			music_play.eq(k).css("color","red"); 
            				music_play.eq(k).addClass("play_music");
                		}
                	}
                    
                    $("#btn-play").removeClass("glyphicon glyphicon-play ");
        			$("#btn-play").addClass("glyphicon glyphicon-pause");
        			flag = 0;
                    
        			$.ajax({  
        	   	        type : "POST",  
        	   	        url : "http://localhost:8080/hwm/music/ajax_operation_addPlayCounts" ,  
        	   	        dataType:"json",
        	   	        cache : false,  
        	   	        data : {  
        	   	            musicid: i
        	   	        },  
        	   	        async : false,  
        	   	        error : function() {  
        	   	            alert("网络异常！");  
        	   	        },  
        	   	        success : function(data) {
        	   	        	console.info(data);
        	   	        }  
        	   	    });  
                    
					//$('#btn-play').text("播放");
        			$("#showTip").css("display","inline");
		   	        $("#showTip").html("已开始播放");
		   	         
		   	        setTimeout("$('#showTip').css('display','none');",3000);
                };  
                
            }  
        };  
		
		/**
		 * 添加歌曲到列表
		 * @param id
		 */
		function addListAndPlay(id){
    	   $.ajax({  
	   	        type : "POST",  
	   	        url : "http://localhost:8080/hwm/music/ajax_operation_getMusic" ,  
	   	        dataType:"json",
	   	        cache : false,  
	   	        data : {  
	   	            musicid: id
	   	        },  
	   	        async : false,  
	   	        error : function() {  
	   	            alert("网络异常！");  
	   	        },  
	   	        success : function(data) {
	   	        	var id1 = data[0].id;
	   	        	var newData = { id : data[0].id, name : data[0].musicname, sid : data[1].id, sname : data[1].singername, mtime : data[0].musictime};
	   	        	//var jsonarray = eval('('+Player.data+')');
	   	        	//alert(newData.id);
	   	        	//var jsonstr="[{'name':'a','value':1},{'name':'b','value':2}]";
	   	        	
	   	        	//alert(data[0].id);
	   	        	//var key;
	   	        	//var value;
	   	        	//$.each(Player.data[0],function(i){  
	   	        	   // key = i;  
	   	        	    //value = newData[i];  
	   	        	    //alert(key+":"+value);  
	   	        	//});
	   	        	//判断是否重复
		   	         var flag = true;
		   	         for(var k=0;k<Player.data.length;k++) {
		   	        	$.each(Player.data[k],function(j){ 
	                		if(id1 == Player.data[k][j]) {
	                			
	                			flag = false;
	                		}
		   	        	});
		   	         }
		   	         //不重复
		   	         if(flag) {
		   	        	Player.data.push(newData);
		   	        	var mhtml = Player.$mList.html();
		                mhtml += '<li class="0" id="' + data[0].id + '" onmouseover="change_bg1(' + data[0].id +')" onmouseout="change_bg2(' + data[0].id + ')" style="padding-top:5px;padding-bottom:5px;font-size:14px;"><i class="glyphicon glyphicon-play"  style="color:black;float:left;margin-top:4px;margin-left:10px;"></i><span style="width:266px;float:left;margin-left:40px;" onclick="click_play(' + data[0].id + ')"><a index="' + data[0].id + '">' + data[0].musicname  + '</a></span><span style="margin-left:10px;float:left;width:100px;"><a href="#" onclick="addCollection(' + data[0].id + ')"  style="margin-left:10px;" title="收藏"><i class="glyphicon glyphicon-heart"></i></a><a href="#" onclick="download12(' + data[0].id + ')" style="margin-left:10px;" title="下载"><i class="glyphicon glyphicon-save"></i></a><a onclick="deleteSongById(' + data[0].id   + ')" href="#" style="margin-left:10px;" title="删除"><i class="glyphicon glyphicon-trash"></i></a></span>';
		                mhtml += '<span style="width:100px;float:left;"><a href=' + path1 + '/home/singer?id=' + data[1].id + '>' + data[1].singername + '</a></span><span style="color:#ccc;">' + data[0].musictime + '</span>';
		                mhtml += '</li>'
		                Player.$mList.html(mhtml); 
		                //Player.ready();
		   	         }
		   	         
		   	         
		   	         $("#play_counts").html(Player.data.length);
		   	         $("#showTip").css("display","inline");
		   	         $("#showTip").html("已添加到播放列表");
		   	         
		   	         setTimeout("$('#showTip').css('display','none');",3000);
	   	        }  
	   	    });  
    	   
    	   
	   	};
	   	
	   	/**
	   	 * 删除播放列表中的歌曲
	   	 * @param id
	   	 */
	   	function deleteSongById(id) {
	   		//alert(id);
	   		var m;
	   		var n;
	   		//alert(Player.data.length);
	   		for(var k=0;k<Player.data.length;k++) {
            	$.each(Player.data[k],function(j){
            		if(id == Player.data[k][j]) {
            			//alert(Player.data[k]["id"]);
            			m = k;
            		    //return true;
            		    //alert(Player.data[k][id]);
            		}
            	});
            }
	   		//删除歌曲
	   		Player.data.splice(m,1);
	   		
	   		for(var k=0;k<Player.data.length;k++) {
            	$.each(Player.data[k],function(j){
            		if(k == 0 && j == "id") {
            			n = Player.data[k][j];
            		}
            	});
            }
	   		//alert(n);
	   		if(Player.currentIndex == m) {
	   			playSongById(n);
	   			Player.audio.pause(); 
	   			$("#btn-play").removeClass("glyphicon glyphicon-pause ");
    			$("#btn-play").addClass("glyphicon glyphicon-play");
    			flag = 0;
	   		}
	   		
	   		
	   		//alert(Player.data.length);
	   		//Player.data.push(newData);
	   		
            
	   		Player.$mList.html("");
	   		var mhtml = Player.$mList.html();
	   		for(var k=0;k<Player.data.length;k++) {
	   			var idd;
	   			var name;
	   			var sidd;
	   			var sname;
	   			var mtime;
	   			
            	$.each(Player.data[k],function(j){
            		
            		idd = Player.data[k]["id"];
    	   			name = Player.data[k]["name"];
    	   			sidd = Player.data[k]["sidd"];
    	   			sname = Player.data[k]["sname"];
    	   			mtime = Player.data[k]["mtime"];
    	   			
            		//alert(Player.data[k]["name"]);
            		//alert(j);
            		
            		//alert(Player.data[k][j]);
            	});
            	
            	
            	//alert(idd + " " + name + " " + sidd + " " + sname + " " + mtime);
            	mhtml += '<li class="0" id="' + idd + '" onmouseover="change_bg1(' + idd +')" onmouseout="change_bg2(' + idd + ')" style="padding-top:5px;padding-bottom:5px;font-size:14px;"><i class="glyphicon glyphicon-play"  style="color:black;float:left;margin-top:4px;margin-left:10px;"></i><span style="width:266px;float:left;margin-left:40px;" onclick="click_play(' + idd + ')"><a index="' + idd + '">' + name  + '</a></span><span style="margin-left:10px;float:left;width:100px;"><a href="#" style="margin-left:10px;" title="收藏"><i class="glyphicon glyphicon-heart"></i></a><a href="#" style="margin-left:10px;" title="下载"><i class="glyphicon glyphicon-save"></i></a><a onclick="deleteSongById(' + idd   + ')" href="#" style="margin-left:10px;" title="删除"><i class="glyphicon glyphicon-trash"></i></a></span>';
                mhtml += '<span style="width:100px;float:left;"><a href=' + path1 + '/home/singer?id=' + sidd + '>' + sname + '</a></span><span style="color:#ccc;">' + mtime + '</span>';
                mhtml += '</li>'
            	
            }
	   		
	   		Player.$mList.html(mhtml);
	   		//变换播放和未播放
        	var list = $("#m-list li");
        	for(var j=0;j<list.length;j++) {
        		//alert(id);
        		//alert(list.eq(j).attr("id"));
        		if(list.eq(j).attr("id") == Player.currentId) {
        			list.eq(j).attr("class","1");
        			$("#"+Player.currentId).css("background-color","#3c3c3c");
        			$($("#"+Player.currentId).children("i").get(0)).css("display","inline");
        			$($("#"+list.eq(j).attr("id")).children("i").get(0)).css("color","red");
        		}else {
        			$("#"+list.eq(j).attr("id")).css("background-color","black");
        			list.eq(j).attr("class","0");
        			$($("#"+list.eq(j).attr("id")).children("i").get(0)).css("color","black");
        		}
        		
        	}
        	
        	$("#play_counts").html(Player.data.length);
	   	};
	   	
	   	function playSongById(id){
	   		addListAndPlay(id);
	   		Player.play(id);
	   		
	   		$("#btn-play").removeClass("glyphicon glyphicon-play ");
			$("#btn-play").addClass("glyphicon glyphicon-pause");
			flag = 0;
	   	}
	   	
	   	/**
	   	 * 播放歌曲
	   	 * @param id
	   	 */
        Player.init(); 
        Player.ready();
        //Player.ready();
        //window.test = function test() {alert(Player.path);}
        //alert(Player.path);
        //alert(a()..path);
	
	