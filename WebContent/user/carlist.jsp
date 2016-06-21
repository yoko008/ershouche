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
		<div class="nav">您当前的位置：<a href="user/userAction!index">首页 </a><span>></span>  买车  </div>
		<div class="main clearfix mt10">
			<div class="main_left">
				<div class="search_box">
					<div class="condition">
						<span class="fr pr10"><a href="car/carAction!searchCar?page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="unl blue">清空条件</a></span>
						<span class="fl">您已选择：</span>
						<ul class="condition_list fl">
						<%if(request.getAttribute("search.keyword")!=null&&!"".equals(request.getAttribute("search.keyword"))){ %>
							<li><a href="car/carAction!searchCar?search.carpinpai=${search.carpinpai}&search.cartype=${search.cartype}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.keyword}</a></li>
						<%}if(request.getAttribute("search.carpinpai")!=null&&!"".equals(request.getAttribute("search.carpinpai"))){ %>
							<li><a href="car/carAction!searchCar?search.keyword=${search.keyword}&search.cartype=${search.cartype}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.carpinpai}</a></li>
						<%}if(request.getAttribute("search.chexi")!=null&&!"".equals(request.getAttribute("search.chexi"))){ %>
							<li><a href="car/carAction!searchCar?search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.chexi}</a></li>
						<%}if(request.getAttribute("search.cartype")!=null&&!"".equals(request.getAttribute("search.cartype"))){ %>	
							<li><a href="car/carAction!searchCar?search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.cartype}</a></li>
						<%}if(request.getAttribute("search.jiage")!=null&&!"".equals(request.getAttribute("search.jiage"))){ %>
							<li><a href="car/carAction!searchCar?search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.jiage}</a></li>
						<%}if(request.getAttribute("search.cheling")!=null&&!"".equals(request.getAttribute("search.cheling"))){ %>	
							<li><a href="car/carAction!searchCar?search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.cheling}</a></li>
						<%}if(request.getAttribute("search.pailiang")!=null&&!"".equals(request.getAttribute("search.pailiang"))){ %>	
							<li><a href="car/carAction!searchCar?search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" class="condition">${search.pailiang}</a></li>
						<% } %>
						</ul>
					</div>
					<ul class="search_list">
						<form method="post" action="car/carAction!searchCar?&page.newpage=1&page.pagelistnum=${page.pagelistnum}">
							<li>
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
								<input type="hidden" name="search.keyword" value="${search.keyword}">
								<input type="hidden" name="search.cartype" value="${search.cartype}">
								<input type="hidden" name="search.jiage" value="${search.jiage}">
								<input type="hidden" name="search.cheling" value="${search.cheling}">
								<input type="hidden" name="search.pailiang" value="${search.pailiang}">
								<input type="submit" value="搜索" class="cbutton">
							</li>
						</form>
						<li>车 型： <a href="car/carAction!searchCar?search.cartype=&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" <%if("".equals(request.getAttribute("search.cartype"))||request.getAttribute("search.cartype")==null){ %> class="here"<%} %>>全部</a>
							<a href="car/carAction!searchCar?search.cartype=微型车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("微型车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										微型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=小型车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("小型车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										小型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=中型车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("中型车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										中型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=大型车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("大型车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										大型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=紧凑型车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("紧凑型车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										紧凑型车
									</a>
								<a href="car/carAction!searchCar?search.cartype=SUV&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("SUV".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										SUV
									</a>
								<a href="car/carAction!searchCar?search.cartype=MPV&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("MPV".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										MPV
									</a>
								<a href="car/carAction!searchCar?search.cartype=豪华车&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"<%if("豪华车".equals(request.getAttribute("search.cartype"))){ %> class="here"<%} %>>
										豪华车
									</a>
						</li>
						
						<li>价 格： <a href="car/carAction!searchCar?search.jiage=&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" <%if("".equals(request.getAttribute("search.jiage"))||request.getAttribute("search.jiage")==null){ %> class="here"<%} %>>全部</a>
							<a href="car/carAction!searchCar?search.jiage=1万以内&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1万以内".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										1万以内
									</a>
								<a href="car/carAction!searchCar?search.jiage=1万-2万&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1万-2万".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										1万-2万
									</a>
									<a href="car/carAction!searchCar?search.jiage=2万-3万&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("2万-3万".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										2万-3万
									</a>
									<a href="car/carAction!searchCar?search.jiage=3万-5万&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("3万-5万".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										3万-5万
									</a>
									<a href="car/carAction!searchCar?search.jiage=5万-10万&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("5万-10万".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										5万-10万
									</a>

									<a href="car/carAction!searchCar?search.jiage=10万-30万&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("10万-30万".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										10万-30万
									</a>
									<a href="car/carAction!searchCar?search.jiage=30万以上&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("30万以上".equals(request.getAttribute("search.jiage"))){ %> class="here"<%} %>>
										30万以上
									</a>
						</li>
						<li>车 龄：<a href="car/carAction!searchCar?search.cheling=&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" <%if("".equals(request.getAttribute("search.cheling"))||request.getAttribute("search.cheling")==null){ %> class="here"<%} %>>全部</a>
						<a href="car/carAction!searchCar?search.cheling=1年以内&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1年以内".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									1年以内
								</a>
								<a href="car/carAction!searchCar?search.cheling=1-2年&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1-2年".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									1-2年
								</a>
								<a href="car/carAction!searchCar?search.cheling=2-3年&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("2-3年".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									2-3年
								</a>
								<a href="car/carAction!searchCar?search.cheling=3-5年&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("3-5年".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									3-5年
								</a>
								<a href="car/carAction!searchCar?search.cheling=5-10年&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("5-10年".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									5-10年
								</a>
								<a href="car/carAction!searchCar?search.cheling=10年以上&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("10年以上".equals(request.getAttribute("search.cheling"))){ %> class="here"<%} %>>
									10年以上
								</a>
						</li>
						<li>排 量： <a href="car/carAction!searchCar?search.pailiang=&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}" <%if("".equals(request.getAttribute("search.pailiang"))||request.getAttribute("search.pailiang")==null){ %> class="here"<%} %>>全部</a>
							<a href="car/carAction!searchCar?search.pailiang=1.0L以内&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1.0L以内".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									1.0L以内
								</a>
								<a href="car/carAction!searchCar?search.pailiang=1.0L-1.5L&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1.0L-1.5L".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									1.0L-1.5L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=1.5L-2.0L&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("1.5L-2.0L".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									1.5L-2.0L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=2.0L-2.5L&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("2.0L-2.5L".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									2.0L-2.5L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=2.5L-3.0L&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("2.5L-3.0L".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									2.5L-3.0L
								</a>
								<a href="car/carAction!searchCar?search.pailiang=3.0L以上&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.cartype=${search.cartype}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&page.newpage=1&page.pagelistnum=${page.pagelistnum}"  <%if("3.0L以上".equals(request.getAttribute("search.pailiang"))){ %> class="here"<%} %>>
									3.0L以上
								</a>
						</li>
					</ul>
				</div>
				<div class="search_big_box mt10">
					<div class="orderlist">
						<ul class="fl">
						<%-- 	<li><a href="<{$weburl}>/index.php?m=search&order=<{if $smarty.cookies.order==1}>2<{elseif $smarty.cookies.order==2}>1<{else}>2<{/if}>">时间</a></li>
							<li><a href="<{$weburl}>/index.php?m=search&order=<{if $smarty.cookies.order==3}>4<{elseif $smarty.cookies.order==4}>3<{else}>3<{/if}>">价格</a></li>
							<li><a href="<{$weburl}>/index.php?m=search&order=<{if $smarty.cookies.order==5}>6<{elseif $smarty.cookies.order==6}>5<{else}>5<{/if}>">里程</a></li>
							<li><a href="<{$weburl}>/index.php?m=search&order=<{if $smarty.cookies.order==7}>8<{elseif $smarty.cookies.order==8}>7<{else}>7<{/if}>">车龄</a></li> --%>
						</ul>
						<div class="page_num">
							<span>每页显示：</span>
							<span class="num"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=15" >15</a></span>
							<span class="num"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=30" >30</a></span>
							<span class="num"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=45" >45</a></span>
						</div>
					</div>
					<div class="box">
						<ul class="bigcarlist clearfix">
						<s:iterator value="carlist" var="car" status="st">
							<li>
								<a href="car/carAction!buyCar?car.id=<s:property value='#car.id' />" target="_blank"><img src="carimg/<s:property value='#car.carimg.carimgurl' />"/></a>
								<p class="carname"><s:property value='#car.title' /><span class="orange01 fb fr"><s:property value='#car.jiage' />万</span>
									<a href="car/carAction!buyCar?car.id=<s:property value='#car.id' />" target="_blank"></a>
								</p>
								<p><s:property value='#car.pailiang' />L &nbsp;&nbsp;</p>
								<p><s:property value='#car.shangpaidate' />上牌&nbsp;&nbsp;</p>
								<p>
									<div class="fr"><span class="check03" title="审核通过"></span></div><span class="gray01">${car.fabudate}</span>
							</li>
						</s:iterator>
						</ul>
						<div class="page_list">
						共 ${page.listnum} 条结果 
                    <s:if test="page.currpage != 1 and page.currpage != 0"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=1&page.pagelistnum=${page.pagelistnum}">首页</a></s:if> 
                    <s:if test="page.currpage == 1 or page.currpage == 0"><a ><font color="#aaaaaa">首页</font></a></s:if>
                    <s:if test="page.currpage != 1 and page.currpage != 0"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=${page.currpage-1}&page.pagelistnum=${page.pagelistnum}">上一页</a></s:if> 
                    <s:if test="page.currpage == 1 or page.currpage == 0"><a ><font color="#aaaaaa">上一页</font></a></s:if> 
                    <s:if test="page.currpage != page.pagenum"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=${page.currpage+1}&page.pagelistnum=${page.pagelistnum}">下一页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">下一页</font></a></s:if>
                    <s:if test="page.currpage != page.pagenum"><a href="car/carAction!searchCar?search.cartype=${search.cartype}&search.keyword=${search.keyword}&search.carpinpai=${search.carpinpai}&search.chexi=${search.chexi}&search.jiage=${search.jiage}&search.cheling=${search.cheling}&search.pailiang=${search.pailiang}&page.newpage=${page.pagenum}&page.pagelistnum=${page.pagelistnum}">末页</a></s:if>
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