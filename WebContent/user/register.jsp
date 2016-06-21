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
<title>注册-张家界二手车</title>
<link href="user/css/user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var check = false;
		//进入页面就给协议勾选上
		$("#check").attr("checked","checked");
		//勾选阅读协议触发注册按钮
		$("#check").click(function(){
			if($("#check").is(":checked")){
				$(".login_but").css("background","#ee7700").removeAttr("disabled");
			}
			else{
				$(".login_but").css("background","#cccccc").attr("disabled","disabled");
			}
		});
		//用户名失去焦点函数
		$("#name").blur(function (){
			if($("#name").val()==""||$("#name").val()==null){
				$("#nameError").html("用户名不能为空").css("color","red");
			}
			else if($("#name").val().length<6){
				$("#nameError").html("用户名长度应在6-20位之间").css("color","red");
			}
			else{
				var username = $("#name").val();
				$.ajax({
					type : "POST",
					url : "user/userAction!yanzhenUser",
					data : "user.username=" + username,
					dataType : "json",
					async : false,
					success : function(data) {
						if(data=="y"){
						$("#nameError").html("恭喜，此用户名可以使用").css("color","green");
						check = true;
						}
						if(data=="n"){
						$("#nameError").html("抱歉，此用户名已经被注册了").css("color","red");	
						check = false;
						}
					}
				});
			}
		});
		//密码文本框失去焦点函数
		$("#pass").blur(function(){
			if($("#pass").val()==""||$("#pass").val()==null){
				$("#passError").html("密码不能为空").css("color","red");
			}
			else if($("#pass").val().length<6){
				$("#passError").html("密码长度应在6-20位之间").css("color","red");
			}
			else{
				$("#passError").html("");
			} 
			if($("#pass_d").val()!=$("#pass").val()){
					$("#passError2").html("两次密码不一致").css("color","red");
				}
			else{
				$("#passError2").html("");
			}
		});
		//验证两次密码是否相同的方法
		$("#pass_d").blur(function(){
			if($("#pass_d").val()==""||$("#pass_d").val()==null){
				$("#passError2").html("密码不能为空").css("color","red");
			}
			else if($("#pass_d").val().length<6){
				$("#passError2").html("密码长度应在6-20位之间").css("color","red");
			}
			else if($("#pass_d").val()!=$("#pass").val()){
				$("#passError2").html("两次密码不一致").css("color","red");
			}
			else{
				$("#passError2").html("");
			}
		});
		//验证邮箱的方法
		$("#email").blur(function(){
			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
			if($("#email").val()==""||$("#email").val()==null){
				$("#emailError").html("邮箱不能为空").css("color","red");
			}
			else if(!reg.test($("#email").val())){
				$("#emailError").html("邮箱格式不正确").css("color","red");
		    }
			else{
				$("#emailError").html("");
			}
		});
		//验证真实姓名的方法
		$("#realname").blur(function(){
			var reg = /^([\u4e00-\u9fa5]){2,7}$/;
			if($("#realname").val()==""||$("#realname").val()==null){
				$("#realNameError").html("姓名不能为空").css("color","red");
			}
			else if(!reg.test($("#realname").val())){
				$("#realNameError").html("请输入正确的姓名").css("color","red");
		    }
			else{
				$("#realNameError").html("");
			}
		});
		//验证手机
		$("#phone").blur(function(){
			var reg = /^[1][0-9]{10}$/;
			if($("#phone").val()==""||$("#phone").val()==null){
				$("#phoneError").html("手机号码不能为空").css("color","red");
			}
			else if(!reg.test($("#phone").val())){
				$("#phoneError").html("请输入正确的手机号码").css("color","red");
		    }
			else{
				$("#phoneError").html("");
			}
		});
		//注册表单验证
		$("#register").click(function(){
			var register = true;
			var reg = /^[1][0-9]{10}$/;
			if($("#phone").val()==""||$("#phone").val()==null){
				$("#phoneError").html("手机号码不能为空").css("color","red");
				$("#phone").focus();
				register = false;
			}
			else if(!reg.test($("#phone").val())){
				$("#phoneError").html("请输入正确的手机号码").css("color","red");
				$("#phone").focus();
				register = false;
		    }
			reg = /^([\u4e00-\u9fa5]){2,7}$/;
			if($("#realname").val()==""||$("#realname").val()==null){
				$("#realNameError").html("姓名不能为空").css("color","red");
				$("#realname").focus();
				register = false;
			}
			else if(!reg.test($("#realname").val())){
				$("#realNameError").html("请输入正确的姓名").css("color","red");
				$("#realname").focus();
				register = false;
		    }
			reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
			if($("#email").val()==""||$("#email").val()==null){
				$("#emailError").html("邮箱不能为空").css("color","red");
				$("#email").focus();
				register = false;
			}
			else if(!reg.test($("#email").val())){
				$("#emailError").html("邮箱格式不正确").css("color","red");
				$("#email").focus();
				register = false;
		    }
			if($("#pass_d").val()==""||$("#pass_d").val()==null){
				$("#passError2").html("密码不能为空").css("color","red");
				$("#pass_d").focus();
				register = false;
			}
			else if($("#pass_d").val().length<6){
				$("#passError2").html("密码长度应在6-20位之间").css("color","red");
				$("#pass_d").focus();
				register = false;
			}
			else if($("#pass_d").val()!=$("#pass").val()){
				$("#passError2").html("两次密码不一致").css("color","red");
				$("#pass_d").focus();
				register = false;
			}
			if($("#pass").val()==""||$("#pass").val()==null){
				$("#passError").html("密码不能为空").css("color","red");
				$("#pass").focus();
				register = false;
			}
			else if($("#pass").val().length<6){
				$("#passError").html("密码长度应在6-20位之间").css("color","red");
				$("#pass").focus();
				register = false;
			}
			if(!check){
				$("#nameError").html("该用户名已被注册").css("color","red");
				$("#name").focus();
				register = false;
			}
			if($("#name").val()==""||$("#name").val()==null){
				$("#nameError").html("用户名不能为空").css("color","red");
				$("#name").focus();
				register = false;
			}
			else if($("#name").val().length<6){
				$("#nameError").html("用户名长度应在6-20位之间").css("color","red");
				$("#name").focus();
				register = false;
			}
			return register;
		});
	});
</script>
</head>
<body>
	<!--内容-->
	<div class="top">
		<div class="top_main clearfix">
			<div class="top_left">
				欢迎来到张家界二手车！</span>
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
	<div class="login_main mt10 clearfix">
		<div class="login_left">
			<div class="title">注册</div>
			<form name="loginform" class="resform" id="loginform" method="post"
				action="user/userAction!register">
				<table class="logintable mt20">
					<tr>
						<th>用户名：</th>
						<td><input id="name" type="text" name="user.username"
							class="inp01"/></td>
							<td id="nameError"></td>
					</tr>
					<tr>
						<th>密码：</th>
						<td><input id="pass" type="password" name="user.password"
							class="inp01" /></td>
							<td id="passError"></td>
					</tr>
					<tr>
						<th>确认密码：</th>
						<td><input id="pass_d" type="password" name="password2"
							class="inp01" /></td>
							<td id="passError2"></td>
					</tr>
					<tr>
						<th>邮箱：</th>
						<td><input id="email" type="text" name="user.email" class="inp01"/></td>
						<td id="emailError"></td>
					</tr>
					<tr>
						<th>真实姓名：</th>
						<td><input id="realname" type="text" name="user.realname" class="inp01"/></td>
						<td id="realNameError"></td>
					</tr>
					<tr>
						<th>手机号：</th>
						<td><input id="phone" type="text" name="user.phone" class="inp01"/></td>
						<td id="phoneError"></td>
					</tr>
					<%-- <tr>
						<th>验证码：</th>
						<td><input name="authcode" id="cftcode" type="text"
							class="inp02" /> <img
							src="#" width="70" height="30"
							onclick="this.src='#"
							title="点击刷新验证码" style="cursor: pointer" id="checkcode"> <span
							class="f12"
							style="cursor: pointer">看不清？换一个</span></td>
					</tr> --%>
					<tr>
						<th></th>
						<td class="f12"><input id="check" type="checkbox" checked="checked"/> 我已经看过并同意《<a
							href="#">网络服务协议</a>》</td>
					</tr>
					<tr>
						<th></th>
						<td><input id="register" type="submit" class="login_but" value="注册">
							<input type="hidden" name="action" value="register"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="login_right">
			<p class="f14 mt20">已是张家界二手车会员？</p>
			<p class="mt20">
				<a href="user/login.jsp" class="register_but">我要登录</a>
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