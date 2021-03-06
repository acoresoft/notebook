<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/res/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Notebook</title>
<meta name="description" content="Admin Home page" />
<link href="${my}/img/favicon.ico" type="image/x-icon" rel="shortcut icon">
<!-- bootstrap & fontawesome -->
<link href="${res_libs}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${res_libs}/font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css"/>
<link href="${my}/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="${my}/css/common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
var $$ctx = "${ctx}";
</script>
</head>
<body class="app-fluid">
	<section class="vbox">
		<header class="bg-dark dk header navbar navbar-fixed-top">
			<div class="navbar-header aside-md" >
				<a class="btn btn-link visible-xs"
					data-toggle="class:nav-off-screen,open" data-target="#nav,html">
					<i class="fa fa-bars"></i>
				</a> 
				<a href="javascript:void(0);" class="navbar-brand" data-toggle="fullscreen">
					<span><img src="${my}/img/logo1.png" class="m-r-sm"/>Notebook</span>
				</a>
				<a class="btn btn-link visible-xs" data-toggle="dropdown"
					data-target=".nav-user"> <i class="fa fa-cog"></i>
				</a>
			</div>
			<ul class="nav navbar-nav hidden-xs">
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle dker" data-toggle="dropdown"> <i
						class="fa fa-building-o"></i> <span class="font-bold">Activity</span>
				</a>
					<section
						class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
						<div class="wrapper lter m-t-n-xs">
							<a href="javascript:void(0);" class="thumb pull-left m-r"> <img
								src="${my}/img/avatar.jpg"
								class="img-circle">
							</a>
							<div class="clear">
								<a href="javascript:void(0);"><span class="text-white font-bold">@Mike
										Mcalidek</span></a> <small class="block">Art Director</small> <a
									href="javascript:void(0);" class="btn btn-xs btn-success m-t-xs">Upgrade</a>
							</div>
						</div>
						<div class="row m-l-none m-r-none m-b-n-xs text-center">
							<div class="col-xs-4">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">245</span> <small
										class="text-muted">Followers</small>
								</div>
							</div>
							<div class="col-xs-4 dk">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">55</span> <small
										class="text-muted">Likes</small>
								</div>
							</div>
							<div class="col-xs-4">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">2,035</span> <small
										class="text-muted">Photos</small>
								</div>
							</div>
						</div>
					</section></li>
				<li>
					<div class="m-t m-l">
						<a href="price"
							class="dropdown-toggle btn btn-xs btn-primary" title="Upgrade"><i
							class="fa fa-long-arrow-up"></i></a>
					</div>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
				<li class="hidden-xs"><a href="javascript:void(0);"
					class="dropdown-toggle dk" data-toggle="dropdown"> <i
						class="fa fa-bell"></i> <span
						class="badge badge-sm up bg-danger m-l-n-sm count"
						style="display: inline-block;">3</span>
				</a>
					<section class="dropdown-menu aside-xl">
						<section class="panel bg-white">
							<header class="panel-heading b-light bg-light">
								<strong>You have <span class="count"
									style="display: inline;">3</span> notifications
								</strong>
							</header>
							<div class="list-group list-group-alt animated fadeInRight">
								<a href="javascript:void(0);" class="media list-group-item"
									style="display: block;"><span
									class="pull-left thumb-sm text-center"><i
										class="fa fa-envelope-o fa-2x text-success"></i></span><span
									class="media-body block m-b-none">Sophi sent you a email<br>
										<small class="text-muted">1 minutes ago</small></span></a> <a
									href="javascript:void(0);" class="media list-group-item"> <span
									class="pull-left thumb-sm"> <img
										src="${my}/img/avatar.jpg"
										alt="John said" class="img-circle">
								</span> <span class="media-body block m-b-none"> Use awesome
										animate.css<br> <small class="text-muted">10
											minutes ago</small>
								</span>
								</a> <a href="javascript:void(0);" class="media list-group-item"> <span
									class="media-body block m-b-none"> 1.0 initial released<br>
										<small class="text-muted">1 hour ago</small>
								</span>
								</a>
							</div>
							<footer class="panel-footer text-sm">
								<a href="javascript:void(0);" class="pull-right"><i
									class="fa fa-cog"></i></a> <a href="index#notes"
									data-toggle="class:show animated fadeInRight">See all the
									notifications</a>
							</footer>
						</section>
					</section></li>
				<li class="dropdown hidden-xs"><a href="javascript:void(0);"
					class="dropdown-toggle dker" data-toggle="dropdown"><i
						class="fa fa-fw fa-search"></i></a>
					<section class="dropdown-menu aside-xl animated fadeInUp">
						<section class="panel bg-white">
							<form role="search">
								<div class="form-group wrapper m-b-none">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-info btn-icon">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</form>
						</section>
					</section></li>
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="thumb-sm avatar pull-left"> <img
							src="${my}/img/avatar.jpg">
					</span> ${userFormMap.accountName} <b class="caret"></b>
				</a>
					<ul class="dropdown-menu animated fadeInRight">
						<span class="arrow top"></span>
						<li><a href="javascript:void(0);">设置</a></li>
						<li><a href="javascript:void(0);" onclick="javascript:updatePasswordLayer();">密码修改</a></li>
						<li><a href="javascript:void(0);"> <span
								class="badge bg-danger pull-right">3</span> 通知
						</a></li>
						<li><a href="javascript:void(0);">帮助</a></li>
						<li class="divider"></li>
						<li><a href="${ctx}/logout">退出</a></li>
					</ul></li>
			</ul>
		</header>
		<section class="hbox stretch" style="height: 100%">
			<!-- .aside -->
			<aside  id="nav"  class="bg-dark lter aside-md hidden-print hidden-xs">
				<section class="vbox">
					<header class="header bg-primary lter text-center clearfix">
						<div class="btn-group">
						<a style="" href="javascript:void(0)" nav-n="系统基础管理,角色管理,/role/list.shtml?id=3"><span>工作面板</span></a>
						</div>
					</header>
					<section class="w-f">
						<!-- sidebar-html -->
						<!-- /sidebar-html -->
						<div class="slim-scroll" data-height="auto"
							data-disable-fade-out="true" data-distance="0" data-size="5px"
							data-color="#333333">
							<!-- nav -->
							<nav class="nav-primary hidden-xs">
								<ul class="nav">
									<c:forEach var="key" items="${list}" varStatus="s">
										<!-- <li class="active"> 某一项展开-->
										<li <c:if test="${s.index==0}">class="active"</c:if>><a
											href="javascript:void(0)"
											<c:if test="${s.index==0}">class="active"</c:if>> <c:if
													test="${s.index==0}">
													<i class="fa fa-dashboard icon"> <b class="bg-danger"></b>
													</i>
												</c:if> <c:if test="${s.index==1}">
													<i class="fa fa-pencil-square icon"> <b
														class="bg-warning"></b>
													</i>
												</c:if> <c:if test="${s.index==2}">
													<i class="fa fa-columns icon"> <b class="bg-primary"></b>
													</i>
												</c:if> <c:if test="${s.index==3}">
													<i class="fa fa-book icon"> <b class="bg-info"></b>
													</i>
												</c:if> <c:if test="${s.index==4}">
													<i class="fa fa-th-list icon"> <b class="bg-success"></b>
													</i>
												</c:if> <span class="pull-right"> <i
													class="fa fa-angle-down text"></i> <i
													class="fa fa-angle-up text-active"></i>
											</span> <span>${key.name}</span>
										</a>

											<ul class="nav lt">
												<c:forEach var="kc" items="${key.children}">
													<li class="active"><a
														href="javascript:void(0)"
														class="active" nav-n="${key.name},${kc.name},${kc.resUrl}?id=${kc.id}"> <i class="fa fa-angle-right"></i> <span>${kc.name}</span>
													</a></li>
												</c:forEach>
											</ul></li>
									</c:forEach>
								</ul>
							</nav>
							<!-- / nav -->
						</div>
					</section>
					<footer class="footer lt hidden-xs b-t b-dark">
						<div id="chat" class="dropup">
							<section class="dropdown-menu on aside-md m-l-n">
								<section class="panel bg-white">
									<header class="panel-heading b-b b-light">Active
										chats</header>
									<div class="panel-body animated fadeInRight">
										<p class="text-sm">No active chats.</p>
										<p>
											<a href="javascript:void(0);" class="btn btn-sm btn-default">Start a chat</a>
										</p>
									</div>
								</section>
							</section>
						</div>
						<div id="invite" class="dropup">
							<section class="dropdown-menu on aside-md m-l-n">
								<section class="panel bg-white">
									<header class="panel-heading b-b b-light">
										John <i class="fa fa-circle text-success"></i>
									</header>
									<div class="panel-body animated fadeInRight">
										<p class="text-sm">No contacts in your lists.</p>
										<p>
											<a href="javascript:void(0);" class="btn btn-sm btn-facebook"><i
												class="fa fa-fw fa-facebook"></i> Invite from Facebook</a>
										</p>
									</div>
								</section>
							</section>
						</div>
						<a href="#nav" data-toggle="class:nav-xs"
							class="pull-right btn btn-sm btn-dark btn-icon"> <i
							class="fa fa-angle-left text"></i> <i
							class="fa fa-angle-right text-active"></i>
						</a>
						<div class="btn-group hidden-nav-xs">
							<button type="button" title="Chats"
								class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
								data-target="#chat">
								<i class="fa fa-comment-o"></i>
							</button>
							<button type="button" title="Contacts"
								class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
								data-target="#invite">
								<i class="fa fa-facebook"></i>
							</button>
						</div>
					</footer>
				</section>
			</aside>
			<!-- /.aside -->
			<section id="content"><!-- BEGIN CONTENT -->
				<section id="id_vbox" class="vbox">
					<ul class="breadcrumb no-border no-radius b-b b-light" id="topli">
						<li><i class="fa fa-home"></i><a href="index">Home</a></li>
						<li><a href="javascript:void(0)">系统基础管理</a></li>
						<li><a href="javascript:void(0)">用户管理</a></li>
					</ul>
					<section class="scrollable">
						<div id="loadhtml"><!-- BEGIN LOADHTML -->
						
						</div><!-- END LOADHTML -->
					</section>
				</section>
			</section><!-- END CONTENT -->
			<aside class="bg-light lter b-l aside-md hide" id="notes">
				<div class="wrapper">Notification</div>
			</aside>
		</section>
	</section>
	<!-- Bootstrap -->
	<div id="flotTip" style="display: none; position: absolute;"></div>
<!-- basic scripts -->
<script type="text/javascript" src="${res}/js/jquery-1.x.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${res_libs}/bootstrap/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${my}/js/app.v1.js"></script> --%>
<script type="text/javascript" src="${my}/js/common.js"></script>
<script type="text/javascript" src="${my}/js/app.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loadhtml").load($$ctx+"/index/main");
	});
</script>
</body>
</html>