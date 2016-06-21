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
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>张家界二手车后台管理</title>
    <link rel="stylesheet" type="text/css" href="admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="admin/css/main.css"/>
    <script type="text/javascript" src="admin/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="admin/js/jquery-1.7.1.min.js"></script>
    <script language="JavaScript">
    $(document).ready(function(){
    	//点击禁用/解禁按钮的操作
    	$(".caozuo").click(function(){
    		var id = $(this).attr("id");
    		var status = $(this).attr("name");
    		var keyword = $(".common-text").val();
    		var currpage = $("#currpage").val();
    		location.href="admin/adminAction!carcaozuo?car.id="+id+"&car.status="+status+"&search.keyword="+keyword+"&page.newpage="+currpage;
    	});
    	//点击通过审核的操作
    	$(".admin").click(function(){
    		var id = $(this).attr("name");
    		var but = $(this);
    		$.ajax({
				type : "POST",
				url : "admin/adminAction!checkPass?car.id="+id,
				dataType : "json",
				async : false,
				success : function show(data) {
					but.attr("disabled","true");
				}
			});
    	});
    });
    </script>
</head>
<body>
<input id="currpage" type="hidden" value="${page.currpage}">
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a href="user/userAction!index" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="admin/adminAction!userList?page.newpage=1"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="admin/adminAction!carlist?page.newpage=1"><i class="icon-font">&#xe005;</i>信息管理</a></li>
                      <!--   <li><a href="design.html"><i class="icon-font">&#xe006;</i>分类管理</a></li>
                        <li><a href="design.html"><i class="icon-font">&#xe004;</i>留言管理</a></li>
                        <li><a href="design.html"><i class="icon-font">&#xe012;</i>评论管理</a></li>
                        <li><a href="design.html"><i class="icon-font">&#xe052;</i>友情链接</a></li>
                        <li><a href="design.html"><i class="icon-font">&#xe033;</i>广告管理</a></li> -->
                    </ul>
                </li>
               <!--  <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="system.html"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe046;</i>数据备份</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe045;</i>数据还原</a></li>
                    </ul>
                </li> -->
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="admin/index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">信息管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="admin/adminAction!carlist?page.newpage=1" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="search.keyword" value="${search.keyword}" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
                            <th>信息标题</th>
                            <th>价格</th>
                            <th>发布ID</th>
                            <th>联系人</th>
                            <th>发布日期</th>
                            <th>信息状态</th>
                            <th>审核状态</th>
                            <th>操作</th>
                            <th>审核</th>
                        </tr>
                        <s:iterator value="carlist" var="c" status="st">
                        <tr>
                            <td class="tc"><input name="id[]" value="59" type="checkbox">
                            <input name="id" value="${us.id}" type="hidden">
                            </td>
                            <td>
                                ${c.title}
                            </td>
                            <td>${c.jiage} 万</td>
                            <td>${c.username}</td>
                            <td>${c.lianxiren}</td>
                            <td>${c.fabudate}</td>
                            <td><s:if test="#c.status==0"><font color="green">正常</font></s:if>
                             <s:if test="#c.status==1"><font color="red">禁用中</font></s:if>
                             <s:if test="#c.status==2"><font color="yellow">已出售</font></s:if>
                             <s:if test="#c.status==3"><font color="blue">已取消</font></s:if></td>
                            <td><s:if test="#c.type==0">未审核</s:if> <s:if test="#c.type==1">已审核</s:if></td>
                            
                            <td>
                            <s:if test="#c.status==0"><input id="${c.id}" class="caozuo" style="color:red;" type="button" name="1" value="禁用"></s:if>
                            <s:if  test="#c.status==1"><input  id="${c.id}" class="caozuo" style="color:green;" type="button" name="0" value="解禁"></s:if>
                             <s:if  test="#c.status!=2 and #c.status!=3  "><input  id="${c.id}" class="caozuo" style="color:blue;" type="button" name="2" value="下架"></s:if></td>
                            <td>
                            <s:if test="#c.type==0">
                                <input class="admin" type="button" name="${c.id}" value="审核通过">
                                </s:if>
                                <s:else>
                                <input class="admin" disabled="disabled" type="button" name="${c.id}" value="审核通过">
                                </s:else>
                            </td>
                        </tr>
                        </s:iterator>
                    </table>
                    
                    <div class="list-page"> 共 ${page.listnum} 条结果 
                    <s:if test="page.currpage != 1"><a href="admin/adminAction!carlist?search.keyword=${search.keyword}&page.newpage=1">首页</a></s:if> 
                    <s:if test="page.currpage == 1"><a ><font color="#aaaaaa">首页</font></a></s:if>
                    <s:if test="page.currpage != 1"><a href="admin/adminAction!carlist?search.keyword=${search.keyword}&page.newpage=${page.currpage-1}">上一页</a></s:if> 
                    <s:if test="page.currpage == 1"><a ><font color="#aaaaaa">上一页</font></a></s:if> 
                    <s:if test="page.currpage != page.pagenum"><a href="admin/adminAction!carlist?search.keyword=${search.keyword}&page.newpage=${page.currpage+1}">下一页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">下一页</font></a></s:if>
                    <s:if test="page.currpage != page.pagenum"><a href="admin/adminAction!carlist?search.keyword=${search.keyword}&page.newpage=${page.pagenum}">末页</a></s:if>
                    <s:if test="page.currpage == page.pagenum"><a><font color="#aaaaaa">末页</font></a></s:if>
                   第 ${page.currpage} 页/共 ${page.pagenum } 页
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>