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
		<link href="user/css/car.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="user/js/jcarousellite_1.0.1.min.js"></script>
		<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
		<script language="JavaScript">
		$(document).ready(function(){
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
				$("div.car_tab ul li a").mouseover(function() {
					$(this).addClass("here").parent().siblings().children().removeClass("here");
					var index = $div_li.index(this);
					$("div.cartab_box > div").eq(index).show().siblings().hide();
				});
			});
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
					<form method="get" action="car/carAction!searchCar?page.newpage=1&page.pagelistnum=${page.pagelistnum}">
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
					<a href="car/carAction!searchCar?page.newpage=1" title="买车"  >买车</a>
				</li>
				<li>
					<a href="car/carAction!sellCarSelect" title="卖车" >卖车</a>
				</li>
				<li>
					<a href="car/carAction!wantcarlist?page.newpage=1" title="求购" class="here">求购</a>
				</li>
				<li style="float:right;">
				 <s:if test="#session.user ==null"> <a href="user/login.jsp" class="here" style="padding:0 30px;"><span class="f16">用户登录</span></a></s:if>
				 <s:else> <a href="user/user.jsp" class="here" style="padding:0 30px;"><span class="f16">个人中心</span></a></s:else>
				</li>
			</ul>
		</div>
		<div class="nav">您当前的位置：<a href="user/userAction!index">首页</a><span>></span> 求购</div>
		<div class="main clearfix mt10">
			<div class="main_left">
				<div class="search_big_box mt10">
					<div class="orderlist">
						<ul class="fl">
						<span><s:if test="#session.user!=null"><a href="car/carAction!sellCarSelect?mark=qiugou"><font color="blue">发布求购信息</font></a></s:if>
						<s:if test="#session.user==null"><a href="user/login.jsp"><font color="blue">发布求购信息</font></a></s:if></span>
						</ul>
						<div class="page_num">
							<span>每页显示：</span>
							<span class="num"><a href="car/carAction!wantcarlist?page.newpage=1&page.pagelistnum=15" >15</a></span>
							<span class="num"><a href="car/carAction!wantcarlist?page.newpage=1&page.pagelistnum=30" >30</a></span>
							<span class="num"><a href="car/carAction!wantcarlist?page.newpage=1&page.pagelistnum=45" >45</a></span>
						</div>
					</div>
					<div class="box">
						<ul class="bigcarlist clearfix">
						<s:iterator value="carlist" var="car" status="st">
							<li>
								<p class="carname"><s:property value='#car.carpinpai' />,<s:property value='#car.chexi' /><span class="orange01 fb fr"><s:property value='#car.jiage' /></span>
								</p>
								<p>车型：<s:property value='#car.cartype' /> <span class="fr">车龄：<s:property value='#car.cheling' /></span></p>
								<p>联系人：<s:property value='#car.lianxiren' /><span class="fr">电话：<s:property value='#car.lianxidianhua' /></span></p>
							</li>
						</s:iterator>
						</ul>
						<div class="page_list">
						共 ${page.listnum} 条结果 
                    <s:if test="page.currpage != 1 and page.currpage != 0"><a href="car/carAction!wantcarlist?page.newpage=1&page.pagelistnum=${page.pagelistnum}">首页</a></s:if> 
                    <s:if test="page.currpage == 1 or page.currpage == 0"><a ><font color="#aaaaaa">首页</font></a></s:if>
                    <s:if test="page.currpage != 1 and page.currpage != 0"><a href="car/carAction!wantcarlist?page.newpage=${page.currpage-1}&page.pagelistnum=${page.pagelistnum}">上一页</a></s:if> 
                    <s:if test="page.currpage == 1 or page.currpage == 0"><a ><font color="#aaaaaa">上一页</font></a></s:if> 
                    <s:if test="page.currpage != page.pagenum"><a href="car/carAction!wantcarlist?page.newpage=${page.currpage+1}&page.pagelistnum=${page.pagelistnum}">下一页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">下一页</font></a></s:if>
                    <s:if test="page.currpage != page.pagenum"><a href="car/carAction!wantcarlist?page.newpage=${page.pagenum }&page.pagelistnum=${page.pagelistnum}">末页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">末页</font></a></s:if>
                   第 ${page.currpage} 页/共 ${page.pagenum } 页
						</div>
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
				<div class="commonbox02 mt15">
					<h3>热门车源排行</h3>
					<div class="box">
						<div class="hotcarlist">
						<s:iterator value="remenList" var="car" status="st">
						    <p class="clearfix"><span class="orange01 fb fr">￥${car.jiage}万</span><span class="num01">${st.index+1}</span><a href="car/carAction!buyCar?car.id=${car.id }" target="_blank" class="fl pl10">${car.title}</a></p>
						</s:iterator>
						</div>
					</div>
				</div>
				<div class="commonbox02 mt15">
					<h3>二手车行情</h3>
					<div class="box">
						<ul class="newslist">
								<li>
									<a href="<{$newslist.n_url}>" target="_blank">
										扯淡的资料
									</a>
								</li>
								<li>
									<a href="<{$newslist.n_url}>" target="_blank">
										扯淡的资料
									</a>
								</li>
								<li>
									<a href="<{$newslist.n_url}>" target="_blank">
										扯淡的资料
									</a>
								</li>
								<li>
									<a href="<{$newslist.n_url}>" target="_blank">
										扯淡的资料
									</a>
								</li>
						</ul>
					</div>
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