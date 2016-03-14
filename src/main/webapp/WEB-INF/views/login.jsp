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
<script type="text/javascript">
var $$ctx = "${ctx}";
</script>
</head>
<body class="login">
	<div class="menu-toggler sidebar-toggler"></div>
	<!-- END SIDEBAR TOGGLER BUTTON -->
	<!-- BEGIN LOGO -->
	<div class="logo">
        <a href="${ctx }/index">
            <img src="${my }/img/logo.png" alt=""> </a>
    </div>
    <!-- END LOGO -->
    <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" action="${ctx }/login" method="post">
                <h3 class="form-title font-green"> Notebook 管理系统 </h3>
                <div class="alert alert-danger alert-dismissible fade in display-hide">
                    <button type="button" class="close" data-dismiss="alert"></button>
                    <span> 请输入用户名和密码。 </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" /> </div>
                <div class="form-actions">
                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a> 
                    <!-- <label class="rememberme check">
                        <input type="checkbox" name="remember" value="1" />Remember </label>-->
                    <button type="submit" class="btn green uppercase right">登录</button>
                </div>
                <div class="login-options display-hide">
                    <h4>Or login with</h4>
                    <ul class="social-icons">
                        <li>
                            <a class="social-icon-color facebook" data-original-title="facebook" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color twitter" data-original-title="Twitter" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color googleplus" data-original-title="Goole Plus" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color linkedin" data-original-title="Linkedin" href="javascript:;"></a>
                        </li>
                    </ul>
                </div>
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="index.html" method="post">
                <h3 class="font-green">忘记密码?</h3>
                <p> 请输入下面的电子邮件地址重置您的密码。</p>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="邮箱" name="email" /> </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn btn-default">返回</button>
                    <button type="submit" class="btn btn-success uppercase pull-right">提交</button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
        </div>
    
	<%-- <div id="loginbox" style="padding-top: 10%;">
		<form id="loginform" name="loginform" class="form-vertical"  method="post" action="${ctx }/login">
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
				<a href="install"
					class="flip-link btn btn-danger" id="to-recover">一键初始化系统</a> 
				<button type="submit" href="javascript:void(0);"
					class="btn btn-success">登&nbsp;&nbsp;录</button>
			</div>
		</form>
	</div> --%>
	 <div class="copyright"> 2016 © Notebook(acoreful.com).</div>
<!-- basic scripts -->
<script type="text/javascript" src="${res}/js/jquery-1.x.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${res_libs}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${my}/js/login.js"></script>
</body>
</html>