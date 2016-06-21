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
		<title>1</title>
		<meta content="<{$setting.keywords}>"  name="keywords"/>
		<meta content="<{$setting.description}>" name="description"/>
		<script type="text/javascript" src="<{$weburl}>/static/js/jquery-1.7.1.min.js"></script>
		<link href="user/css/page.css" rel="stylesheet" type="text/css"/>
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
					<a href="user/index.jsp" style="width: 300px;">
						张家界二手车
					</a>
				</div>
				<div class="topsearch">
					<form method="get" action="car/carAction!searchCar">
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
					<a href="user/userAction!index" title="首页" >首页</a>
				</li>
				<li>
					<a href="car/carAction!searchCar" title="买车" >买车</a>
				</li>
				<li>
					<a href="car/carAction!sellCarSelect" title="卖车"  class="here">卖车</a>
				</li>
				<li>
					<a href="car/carAction!sellCarSelect?mark=qiugou" title="求购" >求购</a>
				</li>
				<li>
					<a href="#" title="#" >论坛</a>
				</li>
				<li>
					<a href="#" title="#" >联系我们</a>
				</li>
				<li style="float:right;"><a href="user/login.jsp" class="here" style="padding:0 30px;"><span class="f16">用户登录</span></a></li>
			</ul>
		</div>
		<div class="nav">您当前的位置：<a href="<{$weburl}>/">首页</a> <span>></span> 卖车</div>
		<div class="main mt10 clearfix">
			<div class="sellbox">
				<h3>填写前您需要准备：</h3>
				<div class="box">
					<p class="f14 fb">行驶证，车辆保险单</p>
					<p class="f14 gray01 mt5">用于填写首次上牌日期</p>
					<p class="f14 fb mt30">汽车多角度照片</p>
					<ul class="showcar_pic_list mt5 clearfix">
						<li><img src="<{$weburl}>/static/img/showcar_pic1.jpg"/><p>左前方</p></li>
						<li><img src="<{$weburl}>/static/img/showcar_pic2.jpg"/><p>左后方</p></li>
						<li><img src="<{$weburl}>/static/img/showcar_pic3.jpg"/><p>侧面</p></li>
						<li><img src="<{$weburl}>/static/img/showcar_pic4.jpg"/><p>发动机舱</p></li>
						<li><img src="<{$weburl}>/static/img/showcar_pic5.jpg"/><p>内饰</p></li>
					</ul>
					<p class="mt30"><a href="<{$weburl}>/index.php?m=sellcar" class="sell_but01">填写爱车信息</a></p>
				</div>
				
			</div>
		</div>
		<!--版权-->
		<div class="footer" id="foot">
			<p class="tc">
				<a href="user/userAction!index" title="首页">首页</a> |
				<a href="car/carAction!searchCar" title="买车" >买车</a> |
				<a href="car/carAction!sellCarSelect" title="卖车" >卖车</a> |
				<a href="car/carAction!sellCarSelect?mark=qiugou" title="求购" >求购</a> |
				<a href="#" title="#" >论坛</a> |
				<a href="#" title="#" >联系我们</a>
			</p>
			<p class="mt10"> Copyright 2016  张家界二手车 版权所有. 用来装X的备案XXXX号</p>
		</div>
	</body>
</html>