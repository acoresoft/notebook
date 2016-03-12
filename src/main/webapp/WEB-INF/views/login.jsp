<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/res/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Notebook后台管理</title>
<meta name="description" content="User login page" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${res_libs}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${res_libs}/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${my}/css/login.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="${res}/js/html5shiv.js"></script>
<script src="${res}/js/respond.min.js"></script>
<![endif]-->
</head>
<body class="login-layout light-login">
	<div id="loginbox" style="padding-top: 10%;">
		<form id="loginform" name="loginform" class="form-vertical"
			action="${ctx }/login.shtml" method="post">
			<div class="control-group normal_text">
				<table style="width: 100%">
					<tr>
						<td align="left"><img src="${my }/img/logo_left.png"
							alt="Logo"></td>
						<td align="center" style="font-weight: bold; color: gray;">Notebook管理系统</td>
						<td align="right"><img src="${my}/img/logo_left.png"
							alt="Logo"></td>
					</tr>
				</table>

			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly" style="background: #28b779"><img
							src="${my }/img/account_1.png" alt="请输入账号.."></span><input
							type="text" placeholder="username" name="username" value="admin"
							style="height: 32px; margin-bottom: 0px;" placeholder="请输入登录账号"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><img src="${my }/img/lock_1.png"
							alt="请输入密码.."></span><input type="password" placeholder="请输入登录密码"
							name="password" value="123456"
							style="height: 32px; margin-bottom: 0px;" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<a href="javascript:void(0);" class="flip-link btn btn-info"
					id="to-recover">忘记密码？</a>
				<a href="install.shtml"
					class="flip-link btn btn-danger" id="to-recover">一键初始化系统</a> 
				<a type="submit" href="javascript:checkUserForm()"
					class="btn btn-success">登&nbsp;&nbsp;录</a>
			</div>
		</form>
	</div>
<!-- basic scripts -->
<script type="text/javascript" src="${res}/js/jquery-1.x.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.min.js"></script>
</body>
</html>