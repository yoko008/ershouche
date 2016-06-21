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
<title>求购</title>
<link href="user/css/page.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="user/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
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
</script>
</head>
<body>
<!--内容--> 
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
					<a href="user/userAction!index" title="首页" >首页</a>
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
				</li></ul>
		</div>
		<!--头部end -->
<div class="nav">您当前的位置：<a href="user/userAction!index">首页 </a><span>></span> <a href="car/carAction!wantcarlist?page.newpage=1"> 求购 </a> <span>></span> 免费发布求购信息</div>
<div class="main mt10 clearfix">
	<div class="sellbox">
		<h3>请填写求购信息：</h3>
		<div class="box clearfix">
			<form  method="post" action="car/carAction!qiugou">
				<table cellspacing="0" cellpadding="0" width="100%"  class="sell_table">
					<tr>
						<th>期望品牌：</th>
						<td colspan="3"><select name="car.carpinpai" id="brand" >
						<option value="" selected>请选择品牌</option>
							<s:iterator value="carSelectList" var="scl" status="st">
							    <option value="${scl.pinpai}">${scl.pinpaiword}</option>
							</s:iterator>
							</select>
							<select class="subbrand" id="subbrand" name="car.chexi">
								<option id="chexi" value="">请选择车系</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>期望车型：</th>
						<td><select name="car.cartype">
						<option value="不限" selected>不限</option>
									<option value="微型车" selected>微型车</option>
									<option value="小型车" selected>小型车</option>
									<option value="中型车" selected>中型车</option>
									<option value="大型车" selected>大型车</option>
									<option value="紧凑型车" selected>紧凑型车</option>
									<option value="SUV" selected>SUV</option>
									<option value="MPV" selected>MPV</option>
									<option value="豪华车" selected>豪华车</option>
							</select></td>
					</tr>
					<tr>
						<th>期望求购价格：</th>
						<td><select name="car.jiage">
						<option value="不限" selected>不限</option>
									<option value="1万以内" selected>1万以内</option>
									<option value="1万-2万" selected>1万-2万</option>
									<option value="2万-3万" selected>2万-3万</option>
									<option value="3万-5万" selected>3万-5万</option>
									<option value="5万-10万" selected>5万-10万</option>
									<option value="10万-30万" selected>10万-30万</option>
									<option value="30万以上" selected>30万以上</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>期望车龄：</th>
						<td><select name="car.cheling">
						            <option value="不限" selected>不限</option>
									<option value="1年以内" selected>1年以内</option>
									<option value="1-2年" selected>1-2年</option>
									<option value="2-3年" selected>2-3年</option>
									<option value="3-5年" selected>3-5年</option>
									<option value="5-10年" selected>5-10年</option>
									<option value="10年以上" selected>10年以上</option>
							</select></td>
					</tr>
					<tr>
						<th>其他要求：</th>
						<td colspan="5"><textarea  name="car.note" rows="2" cols="90" class="textarea01"></textarea></td>
					</tr>
					<tr>
						<th><span class="red">*</span>姓名：</th>
						<td colspan="5"><input name="car.lianxiren" type="text" size="30" class="inp01" value="" /></td>
					</tr>
					<tr>
						<th><span class="red">*</span>手机：</th>
						<td colspan="5"><input name="car.lianxidianhua" type="text" size="30" class="inp01" value=""/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="立刻发布" class="sell_but02">
							<input type="hidden" name="action" value="sellcar"></td>
					</tr>
				</table>
			</form>
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
</body>
</html>