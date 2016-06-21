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
<title>卖车</title>
<link href="user/css/page.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="user/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="<%=path%>/user/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
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
					<a href="user/userAction!index" title="首页">首页</a>
				</li>
				<li>
					<a href="car/carAction!searchCar?page.newpage=1" title="买车" >买车</a>
				</li>
				<li>
					<a href="car/carAction!sellCarSelect" title="卖车"  class="here">卖车</a>
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
<div class="nav">您当前的位置：<a href="user/userAction!index">首页</a> <span>></span> 卖车 </div>
<div class="main mt10 clearfix">
	<div class="sellbox">
		<h3>填写爱车信息：</h3>
		<div class="box clearfix">
			<form enctype="multipart/form-data"  class="carform" method="post" action="car/carAction!sellCar">
				<table cellspacing="0" cellpadding="0" width="100%"  class="sell_table">
					<tr>
						<th><span class="red">*</span>品牌型号：</th>
						<td colspan="3">
							<select name="car.carpinpai" id="brand" >
							<option value="">请选择品牌</option>
							<s:iterator value="carSelectList" var="scl" status="st">
							    <option value="${scl.pinpai}">${scl.pinpaiword}</option>
							</s:iterator>
							</select>
							<select class="subbrand" id="subbrand" name="car.chexi">
								<option id="chexi" value="">请选择车系</option>
							</select>&nbsp;<input type="text" name="car.note" size="20" value="">
						</td>
					</tr>
					<tr>
						<th>车型选择：</th>
						<td><select name="car.cartype">
									<option value="微型车" selected>微型车</option>
									<option value="小型车" selected>小型车</option>
									<option value="中型车" selected>中型车</option>
									<option value="大型车" selected>大型车</option>
									<option value="紧凑型车" selected>紧凑型车</option>
									<option value="SUV" selected>SUV</option>
									<option value="MPV" selected>MPV</option>
									<option value="豪华车" selected>豪华车</option>
							</select></td>
						<th><span class="red">*</span>预售价格：</th>
						<td><input type="text" name="car.jiage"  size="5" value="">
							<span class="gray">(万元)</span></td>
					</tr>
					<tr>
						<th>车体颜色：</th>
						<td width="180"><select name="car.carcolor">
								<option value="红色" selected>红色</option>
								<option value="白色" selected>白色</option>
								<option value="橙色" selected>橙色</option>
								<option value="银色" selected>银色</option>
								<option value="灰色" selected>灰色</option>
								<option value="蓝色" selected>蓝色</option>
								<option value="黑色" selected>黑色</option>
								<option value="其他" selected>其他</option>
							</select></td>
						<th width="50">排量：</th>
						<td><input name="car.pailiang" type="text" size="5"  value=""/><span class="gray">(L)</span>
					</tr>
					<tr>
						<th>变速箱：</th>
						<td><select name="car.biansuxiang">
								<option value="手动" selected>手动</option>
								<option value="自动" selected>自动</option>
								<option value="手自一体" selected>手自一体</option>
							</select></td>
						<th>车龄：</th>
						<td><input name="car.cheling" type="text" size="5" class="cal" value=""/><span class="gray">(年)</span></td>
					</tr>
					<tr>
						<th>行驶里程：</th>
						<td ><input name="car.licheng" type="text"  size="5" value=""/>
							<span class="gray">(万公里)</span></td>
						<th>表显里程：</th>
						<td ><input name="car.biaolicheng" type="text"  size="5" value=""/>
							<span class="gray">(万公里)</span></td>
					</tr>
					<tr>
						<th>图片：</th>
						<td colspan="3">
						 <input  type="file"  name="file"  accept="image/*" multiple/>
							<!-- <ul id="piclist" class="clearfix">
							</ul>
							<input type="button" id="J_selectImage" value="批量上传图片" class="uploadbut"/>
							<div id="mainpic">
								
							</div> -->
						</td>
					</tr>
					<tr>
						<th>上牌时间：</th>
						<td>
						<input onclick="WdatePicker()" name="car.shangpaidate" type="text" size="15" class="cal" value=""/>
						</td>
					</tr>
					<tr>
						<th>交强险截止日期：</th>
						<td>
							<input onclick="WdatePicker()" name="car.jiaoqiangxian" type="text" size="15" class="cal" value=""/>
						</td>
					</tr>
					<tr>
						<th>车船使用税有效期：</th>
						<td>
							<input onclick="WdatePicker()"  name="car.chepaihao" type="text" size="15" class="cal" value=""/>
						</td>
					</tr>
					<tr>
						<th>车辆出厂日期：</th>
						<td>
							<input onclick="WdatePicker()"  name="car.chuchangri" type="text" size="15" class="cal" value=""/>
						</td>
					</tr>
					<tr>
						<th>车辆补充描述：</th>
						<td colspan="5"><textarea  name="car.qitagongneng" rows="2" cols="90" class="textarea01" ></textarea></td>
					</tr>
					<tr>
						<th><span class="red">*</span>车主姓名：</th>
						<td colspan="5"><input name="car.lianxiren" type="text" size="30" class="inp01" value="" /></td>
					</tr>
					<tr>
						<th><span class="red">*</span>手机号：</th>
						<td colspan="5"><input name="car.lianxidianhua" type="text" size="30" class="inp01" value=""/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="立刻发布" class="sell_but02">
					</tr>
				</table>
			</form>
		</div>
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
