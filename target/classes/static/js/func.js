//Lp.Add.2015.04.21
var UA = navigator.userAgent.toLowerCase();

if(isWeinXin()){
	pc2mobile();
}

function pc2mobile(){
		var pathname = window.location.pathname; 
		var murl = 'http://m.fuyin.tv/';
		var exp ='';
		var _id ='';
		if(pathname == '/' || pathname == '/index.html'){
			Go(murl);
		}
		exp = /\/content\/category\/id\/(\d+)\/?/i;
		if(_id = exp.exec(pathname)){
			//Go(murl+"movie/category/id/"+_id[1]+".html");
			Go(murl+"#/bookshelf/"+_id[1]);
		}
		exp = /\/content\/view\/movid\/(\d+)\/?/i;
		if(_id = exp.exec(pathname)){
			//Go(murl+"movie/detail/movid/"+_id[1]+".html");
			Go(murl+"#/movie/"+_id[1]);
		}
		exp = /\/html\/(\d+)\/(\d+).html/i;
		if(_id = exp.exec(pathname)){
			//Go(murl+"movie/player/movid/"+_id[1]+"/urlid/"+_id[2]+".html");
			Go(murl+"#/movie/"+_id[1]+"?urlid="+_id[2]);
		}
		exp = /\/mp3\/(\d+)\/(\d+).html/i;
		if(_id = exp.exec(pathname)){
			//Go(murl+"movie/mp3/movid/"+_id[1]+"/urlid/"+_id[2]+".html");
			Go(murl+"#/movie/"+_id[1]+"?urlid="+_id[2]+"&audio=1");
		}
		exp = /\/content\/vote\/id\/(\d+).html/i;
		if(_id = exp.exec(pathname)){
			Go(murl+"#/news/"+_id[1]);
		}
}

function isWeinXin(){
	if(UA.match(/MicroMessenger/i)=="micromessenger"){
		return true;
	}
	if(UA.match(/iPhone/i)=="iphone"){
		//return true;
	}
	if(UA.match(/android/i)=="android"){
		//return true;
	}
	return false;
}

function GoMobile(url) {
	if((UA.indexOf('phone') != -1 || UA.indexOf('mobile') != -1 || UA.indexOf('android') != -1 || UA.indexOf('ipod') != -1) && UA.indexOf('ipad') == -1) {
		Go(url);
	}
}
function Go(u) {window.location = u;}
//Lp.End

function iframeAutoFit(){
  var p = parent.document.getElementsByTagName("IFRAME");
  for(i=0;i<p.length;i++){
    p[i].style.height = document.documentElement.scrollHeight+ 'px';
  }
}
function play(urlid, width, height){	//点播地址生成
 	var url = window.location.href;
 	var re = /frameurl(.*)/ig
 	var jumpurl = url.replace(re, 'play/urlid/'+urlid+'/');
	var server = $("input[@name=server][@checked]").val();
	var player = $("input[@name=player][@checked]").val();
	if (typeof(server) != 'undefined'){
		jumpurl = jumpurl+'server/'+server+'/'
	}
	if (typeof(player) != 'undefined'){
		jumpurl = jumpurl +'player/'+player+'/';
	}
 	var paramet = 'toolbar=no,width='+width+',height='+height+',location=no,status=no,scrollbars=no,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"vodcms",paramet);
	newWindow.focus();
}
function down(urlid){	//点播地址生成
 	var url = window.location.href;
 	var re = /content\/(.*)/ig
 	var jumpurl = url.replace(re, '/index.php/content/down/urlid/'+urlid+'/');
 	var paramet = 'toolbar=no,width=500,height=500,location=no,status=no,scrollbars=no,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"vodcms",paramet);
	newWindow.focus();
}
function feedback(movid){
	var url = window.location.href;
	var re = /content(.*)/ig
	var jumpurl = url.replace(re, 'index.php/feedback/report/movid/'+movid+'/');
	var paramet = 'toolbar=no,width=410,height=326,location=no,status=no,scrollbars=no,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"feedback",paramet);
	newWindow.focus();
}
function register(basedir){
	var jumpurl = basedir+'member/register/';
	var paramet = 'toolbar=no,width=530,height=500,location=no,status=no,scrollbars=no,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"register",paramet);
	newWindow.focus();
}
function comment(movid){
	var url = window.location.href;
	var re = /content(.*)/ig
	var jumpurl = url.replace(re, '/index.php/content/comment/movid/'+movid+'/');
	var paramet = 'toolbar=no,width=530,height=500,location=no,status=no,scrollbars=yes,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"comments",paramet);
	newWindow.focus();
}
function vote(base, id){
	var jumpurl = base + '/index.php/content/vote/id/'+id;
	var paramet = 'toolbar=no,width=400,height=460,location=no,status=no,scrollbars=no,menubar=no,resizable=yes';
	newWindow =parent.window.open(jumpurl,"vote",paramet);
	newWindow.focus();
}
function orderby(by){
	var url = window.location.href;
	var re = /orderby\/(.*)/ig;
	var jumpurl = url.replace(re, '');

	if (by == 'click')
	{
		jumpurl += 'orderby/'+by+'/';
	} else {
		//默认(按最新排序)是静态，不可再支持listby
		var re2 = /listby\/(.*)/ig;
		jumpurl = jumpurl.replace(re2, '');
	}

	//top.window.location.href = jumpurl;
	//alert(jumpurl);
	var jumpurl_finish = jumpurl.replace('/index.php/content/', '/content/');
	if (by == 'click' || jumpurl_finish.indexOf("/content/search/")!=-1 )
	{
		jumpurl_finish = jumpurl_finish.replace('/content/', '/index.php/content/');
	}
	//alert(jumpurl_finish);
	top.window.location.href = jumpurl_finish;
}
function listby(by){
	var url = window.location.href;
	var re = /listby\/(.*)/ig;
	var jumpurl = url.replace(re, '');

	if (by == 'text')
	{
		jumpurl += 'listby/'+by+'/';
	} else {
		//默认(按图文显示)是静态，不可再支持orderby
		var re2 = /orderby\/(.*)/ig;
		jumpurl = jumpurl.replace(re2, '');
	}
	//top.window.location.href = jumpurl;
	//alert(jumpurl);
	var jumpurl_finish = jumpurl.replace('/index.php/content/', '/content/');
	if (by == 'text' || jumpurl_finish.indexOf("/content/search/")!=-1 )
	{
		jumpurl_finish = jumpurl_finish.replace('/content/', '/index.php/content/');
	}
	//alert(jumpurl_finish);
	top.window.location.href = jumpurl_finish;
}

function flashChecker() {
    var hasFlash = 0; //是否安装了flash
    var flashVersion = 0; //flash版本
    var isIE =
    /*@cc_on!@*/
    0; //是否IE浏览器
    if (isIE) {
		try{
			var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
			if (swf) {
				hasFlash = 1;
				VSwf = swf.GetVariable("$version");
				flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0]);
			}
		}catch (e){
			
		}
    } else {
        if (navigator.plugins && navigator.plugins.length > 0) {
            var swf = navigator.plugins["Shockwave Flash"];
            if (swf) {
                hasFlash = 1;
                var words = swf.description.split(" ");
                for (var i = 0; i < words.length; ++i) {
                    if (isNaN(parseInt(words[i]))) continue;
                    flashVersion = parseInt(words[i]);
                }
            }
        }
    }
    return {
        f: hasFlash,
        v: flashVersion
    };
}

function setCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
    var Days = 1; //此 cookie 将被保存 1 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name)//取cookies函数        
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null) return unescape(arr[2]); return null;
}

//Lp.Add.2014.09.22
$(function(){
	//友情链接计数
	$('a[id^=link]').click(function(){
		var oid = $(this).attr('id');
		var id = oid.split("_")[1];
		var url ='index.php/content/link/';
		if(id){
			$.get(url,{id:id});	
		}
	});
	//公告,动态
	$("span.left").mouseover(function(){
		var c = $(this).attr('data');
		if(!c)return false;
		$("span.left").removeClass('tcolor');
		$(this).addClass('tcolor');
		if($('.notice .tit').length){
			$('.notice .tit').hide();
		}else if($('.notice_sub .tit_sub').length){
			$('.notice_sub .tit_sub').hide();
		}
		$('.'+c).show();
	});
	//手机版提示
	if((UA.indexOf('phone') != -1 || UA.indexOf('mobile') != -1 || UA.indexOf('android') != -1 || UA.indexOf('ipod') != -1) && UA.indexOf('ipad') == -1) {
		if(getCookie('no_tip') !=1 && true){
			var mobile_tip = '';
			mobile_tip += '<div class="dgmsx">';
			mobile_tip += '<a href="javascript:void(0)" class="xclose" onclick="$(\'.dgmsx\').hide();"></a>';
			mobile_tip += '<div id="download_content" class="xpicsh">';
			mobile_tip += '<a href="javascript:void(0)">';
			mobile_tip += '<p>福音影视网手机版<span>体验最好 更省流量</span></p>';
			mobile_tip += '</a>';
			mobile_tip += '</div>';
			mobile_tip += '<a href="javascript:void(0)" class="fgreen" onclick="setCookie(\'no_tip\',\'1\');$(\'.dgmsx\').hide();">暂不提醒</a>';
			mobile_tip += '<a href="http://m.fuyin.tv/?ref=www.fuyin.tv" class="freed">马上体验</a>';
			mobile_tip += '</div>';
			$('body').append(mobile_tip);
		}
	}
	//详情页播放列表提示
	$('#Play_Tabs').css('float','none').append('<li style="border:none;background:none;line-height:30px;float:right;width:470px;text-align:right;">下载说明：下载mp4或mp3 请把鼠标放在当前集数图标上 右键链接另存为</li>');
	
	//id为right 会被Adblock plus屏蔽
	try{
		$("#right").attr('id','rights');
	}catch(e){
		
	}
	
})

$(function(){
	//微信二维码
	var o_top = $('#top');
	var t_width = $('#top').width()+300;
	o_top.after('<div class="wx"><img src="/images/wxcode.gif" width="150px" /></div>').css({'position':'relative'});
	var owx = $('.wx');
	var l = o_top.offset().left+o_top.width()+5;
	owx.css({'position':'fixed','left':l+"px" ,'bottom':'0px','display':'none'});
	if($(window).width() >= t_width){
		owx.show("slow");
	}
	$(window).resize(function(){
	 	if($(window).width() >= t_width){
			l = o_top.offset().left+o_top.width()+5;
			owx.css({'left':l}).show("slow");
		}else{
			owx.hide("slow");
		}
	});
	
});

var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?3eb375079b6816b78c224aaf1bf4dd27";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();