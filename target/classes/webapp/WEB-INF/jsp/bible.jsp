<!DOCTYPE html>
<html lang="en">

 
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
		<title>圣经的解经视频</title>
		<meta name="description" content="圣经: Responsive Full Width Tabs" />
		<meta name="keywords" content="responsive tabs, full width tabs, template, blueprint" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"/>
		  <link href="../static/css/demo.css"
          th:href="@{css/demo.css}"
          rel="stylesheet"
        />
         <link rel="shortcut icon" href="../favicon.ico"/>
	  <link href="../static/css/component.css"
         th:href="@{css/component.css}"
         rel="stylesheet"
         />
		<!-- <link rel="stylesheet" type="text/css" href="resources/css/demo.css" /> -->
<!-- 		<link rel="stylesheet" type="text/css" href="resources/css/component.css" /> -->
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css"/>
		 <script src="http://code.jquery.com/jquery-latest.js"></script> 
			<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
		<script src="../static/js/cbpFWTabs.js" th:src="@{js/cbpFWTabs.js}"></script>
		<!--  <script src="../static/js/bootstrap-table.min.js" th:src="@{js/bootstrap-table.min.js}"></script>
		<script src="../static/js/jquery-latest.js" th:src="@{js/jquery-latest.js}"></script>
		<script src="../static/js/bootstrap-table-zh-CN.min.js" th:src="@{js/bootstrap-table-zh-CN.min.js}"></script>
		
		 --><!-- <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
		 -->
		
	</head>
	<body>
		<div class="container">
			<header class="clearfix">
				<span>【约1:1】太初有道，道与神同在，道就是神。<span class="bp-icon bp-icon-about" data-content="箴言九章十节说：「敬畏耶和华，是智慧的开端。」"></span></span>
				<h1></h1>
				<nav>
					<a href="https://www.fuyin.tv" target="_blank" class="bp-icon bp-icon-prev" data-info="previous Blueprint"><span>Previous Blueprint</span></a>
					<a href="https://www.fuyin.tv" target="_blank" class="bp-icon bp-icon-next" data-info="next Blueprint"><span>Next Blueprint</span></a>
					<a href="https://www.fuyin.tv" target="_blank" class="bp-icon bp-icon-drop" data-info="back to the Codrops article"><span>back to the Codrops article</span></a>
					<a href="https://www.fuyin.tv" target="_blank" class="bp-icon bp-icon-archive" data-info="Blueprints archive"><span>Go to the archive</span></a>
				</nav>
			</header>	
			
			</div>
			<!-- <div> <video autoplay="autoplay" controls="controls" src="http://xyjs.mov.cnfuyin.com/cdn/08福音影视/福音电影/埃及王（中文字幕）/埃及王.mp4?sign=d42d94f22e756dbb010fdd4b9642104a&timestamp=1525266451&device=masterWeb"></video></div>
			 --><table id="96"></table>
		
		<script>
		
			/* 加载唐崇荣视频表格  */
			
						
			$('#96').bootstrapTable({
			striped:true,	//行间隔色
			pagination:true,	//分页
			sortable:false,	//排序
			cache:false,   //清除缓存
			sortOrder:"asc",	//排序方式
			//sidePagination:"server",
			paginationCheckSave:true,  //分页保存勾选项
			pageSize:10,
			//height:bootstrapTableHeight,
			pageNumber:1,
			pageList:[10,30,45,100],
			url:"http://localhost:8090/findVideoUrlByMethodId",
		    columns: [{
		        field: 'id',
		    }, {
		        title: '证道题目',
		        field: 'name'
		    }, {
		        title: '链接视频',
		        field: 'href',
		        events:function (){
		        },
		        formatter:function(value,row,index){
		        	//console.info("value:_"+value+"_row_"+row+"_index_"+index);
		        	//alert("value"+value+"row"+row+"index"+index);
		        	//return "<a href='"+row.url+"'>点击进入</a>";
		        	//alert(row.url);
		        	var url_=row.url;
		        //return 	"<video  preload=\"auto\"  src=\"http://xyjs1.mov.cnfuyin.com/cdn/06%E7%A6%8F%E9%9F%B3%E8%AF%81%E9%81%93/%E7%89%A7%E5%B8%88%E8%AE%B2%E9%81%93/t%E5%94%90%E5%B4%87%E8%8D%A3/mp4/04%E5%AE%A3%E6%95%99%E5%B8%83%E9%81%93%E7%B3%BB%E5%88%97/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84/%E5%85%A8%E8%83%BD%E7%9A%84%E7%A5%9E%E5%9C%A8%E4%BA%BA%E9%97%B42015%E5%9C%A3%E8%AF%9E%E5%B8%83%E9%81%93%E4%BC%9A%E9%AB%98%E9%9B%84%E5%9C%BA.mp4?sign=fee175bb1171deb0c3a7ae06d9d2271c&amp;timestamp=1526480777&amp;device=masterWeb\"></video>";
		        	return "<a href=http://localhost:8090/forWardToVideo?url="+url_+">点击进入</a>";
		             
		        }
		    },{
		        title: '证道人',
		        field: 'method',
		        
		    }],
		    onLoadSuccess:function(data){
		    	return data;
				//$('#bussElementLinkTable').bootstrapTable('load',gridPageFMT(data));
			},
		    error:function(){
		    	alert("error");
		    }
		    /* data: [{
		        name: '何必灭亡',
		        href: ''
		        }, {
		        name: '悔改',
		        href: '$2'
		    },
		    {
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    }
		    ] */
		});
			/* 加载刘志雄视频表格  */
			$('#99').bootstrapTable({
		    columns: [{
		        field: 'id',
		    }, {
		        title: '证道题目',
		        field: 'name'
		    }, {
		        title: '链接视频',
		        field: 'href'
		    }],
		    data: [{
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    },
		    {
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    }
		    ] 
		});
			/* 加载林慈信 视频表格  */
			$('#98').bootstrapTable({
		    columns: [{
		        field: 'id',
		    }, {
		        title: '证道题目',
		        field: 'name'
		    }, {
		        title: '链接视频',
		        field: 'href'
		    }],
		    data: [{
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    },
		    {
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    }
		    ]
		});
			/* 加载寇绍涵视频表格  */
		$('#304').bootstrapTable({
		    columns: [{
		        field: 'id',
		    }, {
		        title: '证道题目',
		        field: 'name'
		    }, {
		        title: '链接视频',
		        field: 'href'
		    }],
		    data: [{
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    },
		    {
		        name: '何必灭亡',
		        href: '$1'
		    }, {
		        name: '悔改',
		        href: '$2'
		    }
		    ]
		});	
			
		</script>
<!--以下代码不作为插件效果内容 -->
	</body>
    <!--  -->
</html>
