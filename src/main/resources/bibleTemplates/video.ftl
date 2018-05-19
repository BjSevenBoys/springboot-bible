<!DOCTYPE html>
<html>
<head>  
<meta charset="utf-8"> <!-- for HTML5 -->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"><!--gb2312  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
<title></title>
<link href="../static/css/component.css"
     th:href="@{css/component.css}"
     rel="stylesheet"
     />
<script src="../static/js/jquery.min.js"  th:src="@{js/jquery.min.js}"   type="application/x-javascript"></script>
<script src="../static/biblejs/video.min.js"  th:src="@{biblejs/video.min.js}"   type="application/x-javascript"></script>
<script src="../static/biblejs/videojs-flash.min.js"  th:src="@{biblejs/videojs-flash.min.js}"   type="application/x-javascript"></script>
<script src="../static/biblejs/videojs-ie8.min.js"  th:src="@{biblejs/videojs-ie8.min.js}"   type="application/x-javascript"></script>
<script src="../static/js/bootstrap.min.js" th:src="@{js/bootstrap.min.js}"></script>
</head>
<body>
	<video  id="my-player" class="vjs-tech" preload="auto" data-setup="{}" tabindex="-1" autoplay="" src="">
	</video>   
<script>
	var url="${VideoUrl}";//获取url
	var videoPlayer = videojs('my-player',{//获取video标签
			autoplay:true,//打开自动播放
			techOrder:["flash","html5"],//采用h5技术
		});
	url = url.replace("xyjs","xyjs1");//转换url
	url = encodeURI(url);//格式化uri
	videoPlayer.src(url);//给video赋值src
</script>
</body>
</html>
