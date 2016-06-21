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
		<title>买车-${car.title}</title>
		<link href="user/css/car.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="<{$weburl}>/templates/default/<{$setting.templates}>/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="<{$weburl}>/templates/default/<{$setting.templates}>/js/jcarousellite_1.0.1.min.js"></script>
		<script type="text/javascript" src="<{$weburl}>/templates/default/<{$setting.templates}>/js/jquery.easing.1.3.js"></script>
		<style>#allmap {width:220px;height:220px;overflow: hidden;margin:0;}</style>
		<script language="JavaScript">
			/* $(function() {
				//品牌选择
				$("#brand").change(function(){
					$.get("<{$weburl}>/index.php?mod=ajax&ajax=1", { 
						pid :  $("#brand").val() 
					}, function (data, textStatus){
						   $("#subbrand").html(data); // 把返回的数据添加到页面上
						}
					);
				});

				$("div.car_tab ul li a").mouseover(function() {
					$(this).addClass("here").parent().siblings().children().removeClass("here");
					var index = $div_li.index(this);
					$("div.cartab_box > div").eq(index).show().siblings().hide();
				});
			}) */
		</script>
		</head>
	<body>
<!--内容--> 
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
					客服热线：<span class="orange01 fb">15074485809</span>
				</div>
			</div>
		</div>
		<div class="headw">
			<div class="head">
				<div class="logo">
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
					<a href="user/userAction!index" title="首页">首页</a>
				</li>
				<li>
					<a href="car/carAction!searchCar?page.newpage=1" title="买车"  class="here">买车</a>
				</li>
				<li>
					<a href="car/carAction!sellCarSelect" title="卖车" >卖车</a>
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
		<div class="nav">您当前的位置：<a href="user/userAction!index">首页 </a><span>></span> <a href="car/carAction!searchCar?page.newpage=1"> 买车 </a> <span>></span> ${car.title}</div>
<div class="main clearfix mt10">
	<div class="main_left">
		<div class="cartitle">
			<p><span class="fr f12 gray fn">发布日期：${car.fabudate}</span>${car.title}</p>
			<p class="gray f12 fn mt5">${car.note}</p>
		</div>
		<div class="carbox clearfix">
			<div class="carbox_left">
				<div class="carpicbox">
					
					
					<img src="carimg/${car.carimgurl}"/>
					
					<p class="mt10 tc"><a href="#bigpic" class="blue unl">查看其他大图</a></p>
				</div>
			</div>
			<div class="carbox_right">
				<p class="price01">预售价格：<span class="fb f20 orange01">${car.jiage}</span> 万元</p>
				<div class="detail01 mt10">
					<ul class="clearfix">
						<li><span class="fb">车型：</span>${car.cartype}</li>	
						<li><span class="fb">行驶里程：</span>${car.licheng}万公里</li>
						<li><span class="fb">颜色：</span>${car.carcolor}</li>
						<li><span class="fb" style="word-spacing:10px;">变速箱：</span>${car.biansuxiang}</li>
						<li><span class="fb">排量：</span>${car.pailiang}L</li>
						<li><span class="fb">上牌日期：</span>${car.shangpaidate}</li>
					</ul>
				</div>
				<div class="detail02 mt10">
					<p><span>联系人：</span></p>
					<p class="orange01 f20 fb">${car.lianxiren}</p>
					<p><span>联系电话：</span></p>
					<p class="orange01 f20 fb">${car.lianxidianhua}</p>
				</div>
			</div>
		</div>
		<div class="commonbox01 mt10" id="bigpic">
			<h3>大图展示</h3>
			<div class="box">
				<table class="cktable">
                    <tr><th>车型：</th><td>${car.cartype}</td><th>行驶里程：</th><td>${car.licheng}万公里</td></tr>
                    <tr><th>颜色：</th><td>${car.carcolor}</td><th>表显里程：</th><td>${car.biaolicheng}万公里</td></tr>
                    <tr><th>车龄：</th><td>${car.cheling}</td><th>变速箱：</th><td>${car.biansuxiang}</td></tr>
                    <tr><th>排量：</th><td>${car.pailiang}L</td><th>上牌日期：</th><td>${car.shangpaidate}</td></tr>
                    <tr><th>车辆出厂日期：</th><td>${car.chuchangri}</td><th>交强险截止日期：</th><td>${car.jiaoqiangxian}</td></tr>
                    <tr><th>车况介绍：</th><td colspan="3">${car.qitagongneng}</td></tr> 
				</table>
				<ul class="mt20">
				<s:iterator value="carimgList" var="img" status="st">
					<li class="mt10 tc"><img  style="width:728px" src="carimg/<s:property value='#img.carimgurl' />"/></li>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
	<div class="main_right">
		<div class="commonbox02">
					<%-- <h3>商家信息</h3>
					<div class="box">
						<p><a href="<{$weburl}>/index.php?m=shop&id=<{$shop.id}>" target="_blank" class="f14 fb"></a></p>
                        <p class="mt10">联系人：{$shop.nicname}></p>
						<p class="mt10">手机：{$shop.mobilephone}></p>
						<p class="mt10 lh200">地址：{$shop.address}></p>
						<p class="mt10"><a href="<{$weburl}>/index.php?m=shop&id=<{$shop.id}>" class="entershop">进入商家店铺</a></p>
					</div> --%>
					<h3>联系人信息</h3>
					<div class="box">
						<p class="mt10">联系人：${car.lianxiren}</p>
						<p class="mt10">手机：${car.lianxidianhua}</p>
					</div> 
				</div>
				<div class="commonbox02 mt10">
					<h3>同车系其他车源</h3>
					<div class="box">
						<ul class="newslist">
						<s:iterator value="chexiCarList" var="car" status="st">
							<li><span class="orange01 fb fr"><s:property value="#car.jiage" />万</span><a href="car/carAction!buyCar?car.id=<s:property value='#car.id' />" target="_blank"><s:property value="#car.title" /></a></li>
						</s:iterator>
						</ul>
					</div>
				</div>
				<div class="commonbox02 mt10">
					<h3>同价位其他车源</h3>
					<div class="box">
						<ul class="newslist">
						<s:iterator value="jiaweiCarList" var="car" status="st">
							<li><span class="orange01 fb fr"><s:property value="#car.jiage" />万</span><a href="car/carAction!buyCar?car.id=<s:property value='#car.id' />" target="_blank"><s:property value="#car.title" /></a></li>
						</s:iterator>
						</ul>
					</div>
				</div>
				<%-- <div class="commonbox02 mt10">
					<h3>商家所在位置</h3>
					<div class="box">
						<div id="allmap" class="mt10"></div>
					</div>
				</div>
				<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script> 
				<script type="text/javascript">
				// 百度地图API功能
				var map = new BMap.Map("allmap");
				var point = new BMap.Point(116.331398,39.897445);
				map.centerAndZoom(point,12);
				// 创建地址解析器实例
				var myGeo = new BMap.Geocoder();
				// 将地址解析结果显示在地图上,并调整地图视野
				myGeo.getPoint("<{$shop.address}>", function(point){
				  if (point) {
					map.centerAndZoom(point, 16);
					map.addOverlay(new BMap.Marker(point));
				  }
				}, "");
				</script>  --%>
	</div>
</div>
<div class="footer" id="foot">
			<p class="tc">
				<a href="user/userAction!index" title="首页">首页</a> |
				<a href="car/carAction!searchCar?page.newpage=1" title="买车" >买车</a> |
				<a href="car/carAction!sellCarSelect" title="卖车" >卖车</a> |
				<a href="car/carAction!wantcarlist?page.newpage=1" title="求购" >求购</a>
			</p>
			<p class="mt10"> Copyright 2016  张家界二手车 版权所有. 用来装X的备案XXXX号</p>
		</div>
</body>
</html>

