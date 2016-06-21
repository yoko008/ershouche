<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	//获得当前协议+服务器名称+端口名
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>欢迎来到张家界二手车</title>
		<link href="user/css/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="user/js/jcarousellite_1.0.1.min.js"></script>
		<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
        <link href="user/css/bootstrap-tour-standalone.css" rel="stylesheet">
		<script src="user/js/bootstrap-tour-standalone.js"></script>
		<script language="JavaScript">
		
		$(document).ready(function(){
			$("#caozuo").click(function(){
		    	var tour = new Tour({
		  		  steps: [
		  		  {
		  		    element: ".topsearch",
		  		    title: "搜索框",
		  		    content: "可以通过关键字，查找你想要的车辆",
		  		    placement: "bottom",
		  		  },
		  		  {
		  		    element: ".nav_list",
		  		    title: "快速定位到你想进行的操作",
		  		    content: "首页，买车，卖车，求购。登陆后可以进入个人中心，进行个人账户的操作",
		  		    placement: "bottom",
		  		  },
		  		  {
		  		    element: ".search_list",
		  		    title: "条件搜索",
		  		    content: "根据不同的条件搜索不同的车辆",
		  		    placement: "bottom",
		  		  },
		  		  {
			  		    element: ".tuijian",
			  		    title: "推荐的车辆",
			  		    content: "这里是向你推荐的车辆",
			  		    placement: "right",
			  	  },
		  		  {
			  		    element: ".sandang",
			  		    title: "这里有三种档次的车辆",
			  		    content: "不同价格，不同需求",
			  		    placement: "right",
			  	  }
		  		
		  		]});
		  		
		  		// Initialize the tour
		  		tour.init(true);
		  		
		  		// Start the tour
		  		tour.start(true);
		  		return false;    	
			});
			
				
			$("#brand").change(function(){
				var pinpai =$("#brand  option:selected").val();
				var params = null;
				$.ajax({
					type : "POST",
					url : "car/carAction!carLiandong?carselect.pinpai=" + pinpai,
					data :params,
					dataType : "json",
					async : false,
					success : function show(data) {
						var json = eval("("+data+")");
						var str="";
						$.each(json,function(index,item){
							str+="<option value='"+item.chexi+"'>"+item.chexi+"</option>";
						});
						$("#subbrand").html("");
						$("#subbrand").append(str); 
					}
				});
				
			});
			
		});
			$(function() {
				//品牌选择
				$div_li = $("div.car_tab ul li a");
				$div_li.mouseover(function() {
					$(this).addClass("here").parent().siblings().children().removeClass("here");
					var index = $div_li.index(this);
					$("div.cartab_box > div").eq(index).show().siblings().hide();
				});
			});
		
		</script>
	</head>

	<body>
		<!--头部-->
		<div class="top">
			<div class="top_main clearfix">
				<div class="top_left">
				<span>
				    <s:if test="#session.user !=null">${session.user.username},</s:if>
					欢迎来到张家界二手车！
					<s:else><a href="user/login.jsp">[登录]</a><a href="user/register.jsp">[注册]</a></s:else>
					</span>
				</div>
				<div class="top_right">
				    <a href="" id="caozuo">操作指引</a>
					客服热线：<span class="orange01 fb">15074485809</span>
				</div>
			</div>
		</div>
		<div class="headw">
			<div class="head">
				<div class="logo" id="logo">
					<a href="user/userAction!index" style="width: 300px;">
						张家界二手车
					</a>
				</div>
				<div class="topsearch">
					<form method="post" action="car/carAction!searchCar?page.newpage=1">
						<input type="text" name="search.keyword" class="keywords" value="">
						<input type="submit" value="" class="button" />
					</form>
				</div>
				<div class="carnum" id="carcount">
				</div>
			</div>
		</div>
		<div class="nav_list">
			<ul class="clearfix">
				<li>
					<a href="user/userAction!index" title="首页" class="here">首页</a>
				</li>
				<li>
					<a href="car/carAction!searchCar?page.newpage=1" title="买车" >买车</a>
				</li>
				<li>
				<s:if test="#session.user==null"><a href="user/login.jsp" title="卖车" >卖车</a></s:if>
					<s:if test="#session.user!=null"><a href="car/carAction!sellCarSelect" title="卖车" >卖车</a></s:if>
				</li>
				<li>
					<a href="car/carAction!wantcarlist?page.newpage=1" title="求购" >求购</a>
				</li>
				<li style="float:right;">
				 <s:if test="#session.user ==null"> <a href="user/login.jsp" class="here" style="padding:0 30px;"><span class="f16">用户登录</span></a></s:if>
				 <s:else> <a href="user/user.jsp" class="here" style="padding:0 30px;"><span class="f16">个人中心</span></a></s:else>
				</li>
			</ul>
		</div>
		<!--头部end -->
		<!--内容-->
		<div class="main clearfix mt15">
			<div class="main_left">
				<div class="index_search">
					<div class="index_search_box">
						<form method="post" action="car/carAction!searchCar?page.newpage=1">
							<p class="brand">
								品 牌：
								
								<select id="brand" name="search.carpinpai">
									<option value="">请选择品牌</option>
								<s:iterator value="carSelectList" var="car" status="st">
								   <option value="<s:property value='#car.pinpai'/>"><s:property value="#car.pinpaiword"/> </option>
								</s:iterator>
								
								</select>
								<select id="subbrand" name="search.chexi">
									<option id="chexi" value="">请选择车系</option>
								</select>
								<input type="submit" value="搜 索" class="cbutton">
							</p>
						</form>
						<ul class="search_list">
							<li class="bg01">车 型：
								<a href="car/carAction!searchCar?search.cartype=微型车&page.newpage=1">
										微型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=小型车&page.newpage=1">
										小型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=中型车&page.newpage=1">
										中型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=大型车&page.newpage=1">
										大型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=紧凑型车&page.newpage=1">
										紧凑型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=SUV&page.newpage=1">
										SUV
									</a>
								<a href="car/carAction!searchCar?search.cartype=MPV&page.newpage=1">
										MPV
									</a>
								<a href="car/carAction!searchCar?search.cartype=豪华车&page.newpage=1">
										豪华车
									</a>
							</li>
							<li>价 格：
								<a href="car/carAction!searchCar?search.jiage=1万以内&page.newpage=1">
										1万以内
									</a>
								<a href="car/carAction!searchCar?search.jiage=1万-2万&page.newpage=1">
										1万-2万
									</a>
								<a href="car/carAction!searchCar?search.jiage=2万-3万&page.newpage=1">
										2万-3万
									</a>
								<a href="car/carAction!searchCar?search.jiage=3万-5万&page.newpage=1">
										3万-5万
									</a>
								<a href="car/carAction!searchCar?search.jiage=5万-10万&page.newpage=1">
										5万-10万
									</a>

								<a href="car/carAction!searchCar?search.jiage=10万-30万&page.newpage=1">
										10万-30万
									</a>
								<a href="car/carAction!searchCar?search.jiage=30万以上&page.newpage=1">
										30万以上
									</a>
							</li>
							<li class="bg01">车 龄：
								<a href="car/carAction!searchCar?search.cheling=1年以内&page.newpage=1">
									1年以内
								</a>
								<a href="car/carAction!searchCar?search.cheling=1-2年&page.newpage=1">
									1-2年
								</a>
								<a href="car/carAction!searchCar?search.cheling=2-3年&page.newpage=1">
									2-3年
								</a>
								<a href="car/carAction!searchCar?search.cheling=3-5年&page.newpage=1">
									3-5年
								</a>
								<a href="car/carAction!searchCar?search.cheling=5-10年&page.newpage=1">
									5-10年
								</a>
								<a href="car/carAction!searchCar?search.cheling=10年以上&page.newpage=1">
									10年以上
								</a>
							</li>
							<li>排 量：
								<a href="car/carAction!searchCar?search.pailiang=1.0L以内&page.newpage=1">
									1.0L以内
								</a>
								<a href="car/carAction!searchCar?search.pailiang=1.0L-1.5L&page.newpage=1">
									1.0L-1.5L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=1.5L-2.0L&page.newpage=1">
									1.5L-2.0L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=2.0L-2.5L&page.newpage=1">
									2.0L-2.5L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=2.5L-3.0L&page.newpage=1">
									2.5L-3.0L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=3.0L以上&page.newpage=1">
									3.0L以上
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="main_right">
				<div class="tool_box">
					<ul class="clearfix">
						<li class="bg01"><a href="car/carAction!sellCarSelect">卖车</a></li>
						<li><a href="car/carAction!searchCar?page.newpage=1">买车</a></li>
					</ul>
				</div>
				<div class="tool_box02">
					<ul class="clearfix">
						<li><a href="#" >广告位</a></li>
						<li class="ml10"><a href="#" >广告位</a></li>
						<li><a href="#" >广告位</a></li>
						<li class="ml10"><a href="#" >广告位</a></li>
						<li><a href="#" >广告位</a></li>
						<li class="ml10"><a href="#" >广告位</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main clearfix mt15">
			<div class="main_left">
				<div class="commonbox01 tuijian">
					<h3>推荐二手车</h3>
					<div class="box">
						<ul class="scar_list clearfix">
						<s:iterator value="carlist" var="car" status="st">
						<li><a href="car/carAction!buyCar?car.id=<s:property value='#car.id' />" target="_blank"><img src="carimg/<s:property value='#car.carimg.carimgurl' />" class="vt"></a>
								<p><span class="carname"><a href="#"  target="_blank" class="f12"><s:property value='#car.title' /></a></span></p>
								<p><span class="orange01 f14 fb fr"><s:property value='#car.jiage' />万</span><span class="gray01"><s:property value='#car.cheling' />年</span></p>
							</li>
						</s:iterator>
						</ul>
					</div>
				</div>
			</div>
			<div class="main_right">
				<div class="commonbox02">
					<h3>广告位</h3>
					<div class="box" style="height:342px;">
					广告位<br>
					虚位以待。。。
					</div>
				</div>
			</div>
		</div>
		<div class="main mt15 clearfix">
			<div class="main_left">
				<script language="javascript" src="/index.php?m=ad&id=61"></script>
			</div>
			<div class="main_right">
				<script language="javascript" src="/index.php?m=ad&id=62"></script>
			</div>
		</div>
		<div class="main mt15 clearfix">
			<div class="main_left">
				<div class="commonbox01 sandang">
					<div class="car_tab">
						<ul class="fl">
							<li><a class="here">高档二手车</a></li>
							<li><a>中档二手车</a></li>
							<li><a>经济二手车</a></li>
						</ul>
					</div>
					<div class="box cartab_box">
						<div>
							<ul class="scar_list clearfix">
							<s:iterator value="carlistL" var="car" status="st">
								<li><a href="car/carAction!buyCar?car.id=${car.id }" target="_blank"><img src="carimg/<s:property value='#car.carimg.carimgurl' />" class="vt"></a>
								<p><span class="carname"><a href="#"  target="_blank" class="f12"><s:property value='#car.title' /></a></span></p>
								<p><span class="orange01 f14 fb fr"><s:property value='#car.jiage' />万</span><span class="gray01"><s:property value='#car.cheling' />年</span></p>
							</li>
								</s:iterator>
							</ul>
						</div>
						<div class="hide">
							<ul class="scar_list clearfix">
							<s:iterator value="carlistM" var="car" status="st">
								<li><a href="car/carAction!buyCar?car.id=${car.id }" target="_blank"><img src="carimg/<s:property value='#car.carimg.carimgurl' />" class="vt"></a>
								<p><span class="carname"><a href="#"  target="_blank" class="f12"><s:property value='#car.title' /></a></span></p>
								<p><span class="orange01 f14 fb fr"><s:property value='#car.jiage' />万</span><span class="gray01"><s:property value='#car.cheling' />年</span></p>
							</li>
								</s:iterator>
							</ul>
						</div>
						<div class="hide">
							<ul class="scar_list clearfix">
							<s:iterator value="carlistS" var="car" status="st">
								<li><a href="car/carAction!buyCar?car.id=${car.id }" target="_blank"><img src="carimg/<s:property value='#car.carimg.carimgurl' />" class="vt"></a>
								<p><span class="carname"><a href="#"  target="_blank" class="f12"><s:property value='#car.title' /></a></span></p>
								<p><span class="orange01 f14 fb fr"><s:property value='#car.jiage' />万</span><span class="gray01"><s:property value='#car.cheling' />年</span></p>
							</li>
								</s:iterator>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="main_right">
				<div class="commonbox02">
					<h3>热门车源排行</h3>
					<div class="box">
						<div class="hotcarlist">
						<s:iterator value="remenList" var="car" status="st">
						    <p class="clearfix"><span class="orange01 fb fr">￥${car.jiage}万</span><span class="num01">${st.index+1}</span><a href="car/carAction!buyCar?car.id=${car.id }" target="_blank" class="fl pl10">${car.title}</a></p>
						</s:iterator>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main mt15 clearfix">
			<div class="main_left">
				<script language="javascript" src="index.php?m=ad&id=63"></script>
			</div>
			<div class="main_right">
				<script language="javascript" src="index.php?m=ad&id=64"></script>
			</div>
		</div>
		<div class="main mt15">
			<div class="indexbox clearfix">
				<div class="left">
					<h3>最新信息</h3>
					<div class="box">
						<ul class="dealerlist">
						<s:iterator value="zuixinList" var="car" status="st">
							<p><span class="dealermark">￥${car.jiage }万</span><a href="car/carAction!buyCar?car.id=${car.id }">${car.title }</a> </p>
						</s:iterator>
						</ul>
						<div class="indexbut01 mt10"><a href="car/carAction!searchCar">查看更多发布信息</a></div>
					</div>
				</div>
				<div class="center">
					<h3>最新求购信息</h3>
					<div class="box">
						<ul class="newslist">
						<s:iterator value="qiugouList" var="car" status="st">
							<li>
								${car.lianxiren} 求购 ${car.carpinpai} ${car.chexi}
							</li>
							</s:iterator>
						</ul>
						<div class="indexbut02 mt10"><a href="car/carAction!sellCarSelect?mark=qiugou">提交求购信息</a></div>
					</div>
				</div>
				<div class="right">
					<h3>二手车行情</h3>
					<div class="box">
						<ul class="newslist">
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
							<li><a href="" target="_blank">新科鲁兹动力总成详解 左右互搏闯</a></li>
						</ul>
						<div class="indexbut01 mt10"><a href="">查看更多二手车行情</a></div>
					</div>
				</div>
			</div>
		</div>
		<div class="main mt15">
			<div class="commonbox02">
				<h3>友情链接</h3>
				<div class="box">
					<ul class="link_list clearfix">
						<li>
							<a href="http://toxiaxia.applinzi.com" target="_blank">
								霞霞
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--底部导航-->
		<div class="footer" id="foot">
			<p class="tc">
				<a href="user/userAction!index" title="首页">首页</a> |
				<a href="car/carAction!searchCar?page.newpage=1" title="买车" >买车</a> |
				<a href="car/carAction!sellCarSelect" title="卖车" >卖车</a> |
				<a href="car/carAction!wantcarlist?page.newpage=1" title="求购" >求购</a>
			</p>
			<p class="mt10"> Copyright 2016  张家界二手车 版权所有. 用来装X的备案XXXX号</p>
		</div>
		
		<!-- 版权 结束 -->
	</body>

</html>