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
<title>登录-张家界二手车</title>
<link href="user/css/user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//用户名失去焦点函数
		$("#name").blur(function() {
			if ($("#name").val() == "" || $("#name").val() == null) {
				$("#nameError").html("用户名不能为空").css("color", "red");
			} else if ($("#name").val().length < 6) {
				$("#nameError").html("用户名长度应在6-20位之间").css("color", "red");
			} else {
				$("#nameError").html("");
			}
		});
		//密码文本框失去焦点函数
		$("#pass").blur(function() {
			if ($("#pass").val() == "" || $("#pass").val() == null) {
				$("#passError").html("密码不能为空").css("color", "red");
			} else if ($("#pass").val().length < 6) {
				$("#passError").html("密码长度应在6-20位之间").css("color", "red");
			} else {
				$("#passError").html("");
			}
		});
		//点击登录函数
		$("#login").click(function() {
			if ($("#name").val() == "" || $("#name").val() == null) {
				$("#nameError").html("用户名不能为空").css("color", "red");
				$("#name").focus();
				return false;
			}
			if ($("#name").val().length < 6) {
				$("#nameError").html("用户名长度应在6-20位之间").css("color", "red");
				$("#name").focus();
				return false;
			}
			if ($("#pass").val() == "" || $("#pass").val() == null) {
				$("#passError").html("密码不能为空").css("color", "red");
				$("#pass").focus();
				return false;
			}
			if ($("#pass").val().length < 6) {
				$("#passError").html("密码长度应在6-20位之间").css("color", "red");
				$("#pass").focus();
				return false;
			}
		});
	})
</script>
</head>
<body>
	<!--内容-->
	<div class="top">
		<div class="top_main clearfix">
			<div class="top_left">
				欢迎来到张家界二手车！
			</div>
			<div class="top_right">
				客服热线：<span class="orange01 fb">15074485809</span>
			</div>
		</div>
	</div>
	<div class="login_head">
		<div class="logo">
			<a href="user/userAction!index" style="width: 300px;">张家界二手车</a>
		</div>
	</div>
	<div class="login_main mt10 clearfix" style="margin-bottom: 120px;">
		<div class="login_left">
			<div class="title">登录</div>
			<form name="loginform" class="loginform" method="post"
				action="user/userAction!login">
				<table class="logintable mt20">
					<tr>
						<th>会员名：</th>
						<td><input type="text" id="name" name="user.username"
							class="inp01" /></td>
						<td id="nameError"></td>
					</tr>
					<tr>
						<th>密&nbsp;&nbsp;&nbsp;码：</th>
						<td><input type="password" id="pass" name="user.password"
							class="inp01" /></td>
						<td id="passError"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" id="login" class="login_but"
							value="登录"><a href="register.jsp"></a> <input
							type="hidden" name="action" value="login"></td>
					</tr>
					<tr>
						<td></td>
						<td style="color: red;">${mark}</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="login_right">
			<p class="f14 mt20">还不是张家界二手车会员？</p>
			<p class="mt20">
				<a href="user/register.jsp" class="register_but">我要注册</a>
			</p>
		</div>
	</div>
	<!--版权-->
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