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
		 <!-- <script src="../static/js/func.js"  th:src="@{js/func.js}"   type="application/x-javascript"></script>
		 -->
         
		 <script src="../static/biblejs/video.min.js"  th:src="@{biblejs/video.min.js}"   type="application/x-javascript"></script>
		 <script src="../static/biblejs/videojs-flash.min.js"  th:src="@{biblejs/videojs-flash.min.js}"   type="application/x-javascript"></script>
		 <script src="../static/biblejs/videojs-ie8.min.js"  th:src="@{biblejs/videojs-ie8.min.js}"   type="application/x-javascript"></script>
		 <script>
			videojs.options.flash.swf = "/player/video-js-5.20.4/fyPlayer.swf";
		</script>
</head>
<body>
<!-- 直接copy原网站的video标签过来，能运行的 -->
<!-- <video id="my-player_html5_api" class="vjs-tech" preload="auto" data-setup="{}" tabindex="-1" autoplay="" src="http://xyjs1.mov.cnfuyin.com/cdn/06%E7%A6%8F%E9%9F%B3%E8%AF%81%E9%81%93/%E7%89%A7%E5%B8%88%E8%AE%B2%E9%81%93/t%E5%94%90%E5%B4%87%E8%8D%A3/mp4/04%E5%AE%A3%E6%95%99%E5%B8%83%E9%81%93%E7%B3%BB%E5%88%97/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84%E5%9C%BA.mp4?sign=78700c584738b33d127ddf6be76a44c2&amp;timestamp=1526626095&amp;device=masterWeb">
		</video> -->
   <!-- 可以运行的 具体案例-->
 		<!--   <video id="my-player_html5_api" class="vjs-tech" preload="auto" data-setup="{}" tabindex="-1" autoplay="" src="http://xyjs1.mov.cnfuyin.com/cdn/06%E7%A6%8F%E9%9F%B3%E8%AF%81%E9%81%93/%E7%89%A7%E5%B8%88%E8%AE%B2%E9%81%93/t%E5%94%90%E5%B4%87%E8%8D%A3/mp4/04%E5%AE%A3%E6%95%99%E5%B8%83%E9%81%93%E7%B3%BB%E5%88%97/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84%E5%9C%BA.mp4?sign=2b1b4b28f2af9a2f9237aee58103f7e1&amp;timestamp=1526568259&amp;device=masterWeb">
		</video>   -->
		<!--实际可以播放的格式 -->
		  <video  id="my-player" class="vjs-tech" preload="auto" data-setup="{}" tabindex="-1" autoplay="" src="">
		</video>   
<script>
/* 从原网址复制的url：
http://xyjs.mov.cnfuyin.com/cdn/06福音证道/牧师讲道/t唐崇荣/mp4/04宣教布道系列/全能的神在人间2015圣诞布道会高雄/全能的神在人间2015圣诞布道会高雄场.mp4?sign=46ae4ec43e64823df0edcdf52236fd73&timestamp=1526628578&device=masterWeb";
埃及王：
"http://xyjs.mov.cnfuyin.com/cdn/08福音影视/福音电影/埃及王（中文字幕）/埃及王.mp4?sign=78cb4463b749588e6e3c53387dd0774b&timestamp=1526628848&device=masterWeb";


*/
 //var url="http://xyjs.mov.cnfuyin.com/cdn/06福音证道/牧师讲道/t唐崇荣/mp4/04宣教布道系列/全能的神在人间2015圣诞布道会高雄/全能的神在人间2015圣诞布道会高雄场.mp4?sign=46ae4ec43e64823df0edcdf52236fd73&timestamp=1526628578&device=masterWeb";
var url="${VideoUrl}";
var videoPlayer = videojs('my-player',{
	autoplay:true,
	techOrder:["flash","html5"],
});
url = url.replace("xyjs","xyjs1");
url = encodeURI(url);
videoPlayer.src(url);
//return;
/* var url ="http://xyjs.mov.cnfuyin.com/cdn/06福音证道/牧师讲道/t唐崇荣/mp4/04宣教布道系列/全能的神在人间2015圣诞布道会高雄/全能的神在人间2015圣诞布道会高雄场.mp4?sign=3960628d8239b54aa10f9476b54bdb78&timestamp=1526609793&device=masterWeb";
				///"http://xyjs.mov.cnfuyin.com/cdn/08福音影视/福音电影/埃及王（中文字幕）/埃及王.mp4?sign=d42d94f22e756dbb010fdd4b9642104a&timestamp=1525266451&device=masterWeb";//"${VideoUrl}" //"http://xyjs.mov.cnfuyin.com/cdn/06福音证道/牧师讲道/t唐崇荣/mp4/04宣教布道系列/全能的神在人间2015圣诞布道会高雄/全能的神在人间2015圣诞布道会高雄场.mp4?sign=3960628d8239b54aa10f9476b54bdb78&timestamp=1526609793&device=masterWeb";
			//return;
			//alert(url);
			var videoPlayer = videojs('my-player',{
				autoplay:true,
				techOrder:["flash","html5"],
			});
			//alert();
			if(videoPlayer.techName_ =='Html5'){
				url = url.replace("xyjs","xyjs1");
			}
			url = encodeURI(url);
			videoPlayer.src(url);
			videoPlayer.on('ended',function(){
				setTimeout(nextPlay,2000);
			});
			function videojs_stat(str){
				//console.log(str)
			} */
		</script>
</body>
</html>
