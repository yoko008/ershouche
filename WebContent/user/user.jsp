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
		<title>
			
		</title>
		<meta content="<{$setting.keywords}>" name="keywords" />
		<meta content="<{$setting.description}>" name="description" />
		<link href="user/css/car.css" rel="stylesheet" type="text/css" />
		<link href="user/css/user.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="user/js/jcarousellite_1.0.1.min.js"></script>
		<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
		<script language="JavaScript">
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
					<a href="car/carAction!searchCar?page.newpage=1" title="买车" >买车</a>
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
		<div class="nav">您当前的位置：<a href="user/userAction!index">首页</a> <span>></span>  个人中心 </div>
		<div class="main clearfix mt10">
			<div class="main_left">
				<div class="search_box">
				
				<form name="loginform" class="resform" id="loginform" method="post"
				action="user/userAction!register">
				<table class="logintable mt20" style="margin-left: 200px;">
					<tr>
						<th>用户名：</th>
						<td>${session.user.username}</td>
							<td id="nameError"></td>
					</tr>
					<tr>
						<th>真实姓名：</th>
						<td>${session.user.realname}</td>
						<td id="realNameError"></td>
					</tr>
					<tr>
						<th>邮箱：</th>
						<td>${session.user.email}</td>
						<td id="emailError"></td>
					</tr>
					
					<tr>
						<th>手机号：</th>
						<td>${session.user.phone}</td>
						<td id="phoneError"></td>
					</tr>
					<tr>
						<th>状态：</th>
						<td>
						<s:if test="#session.user.status ==0">正常</s:if>
						<s:if test="#session.user.status ==1">禁用</s:if></td>
						<td id="phoneError"></td>
					</tr>
					<tr>
						<th>用户类型：</th>
						<td><s:if test="#session.user.type ==0">注册会员</s:if>
						<s:if test="#session.user.type ==1">管理员</s:if></td>
						<td id="phoneError"></td>
					</tr>
					<tr>
						<th>注册时间：</th>
						<td>${session.user.reqdate}</td>
						<td id="phoneError"></td>
					</tr>
				</table>
			</form>
				</div>
			</div>
			<div class="main_right">
			<div class="search_box">
			<a href="user/user.jsp" class="here" style="padding:0 30px;"><span class="f16">个人资料</span></a><br><br>
			<a href="user/userEdit.jsp" class="here" style="padding:0 30px;"><span class="f16">编辑资料</span></a><br><br>
			<a href="user/userPass.jsp" class="here" style="padding:0 30px;"><span class="f16">修改密码</span></a><br><br>
			<a href="car/carAction!userFabu?user.username=${session.user.username}" class="here" style="padding:0 30px;"><span class="f16">我发布的信息</span></a><br>
			</div>
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