<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
	<!-- <style type="text/css">
		.help-block{left: 109px;
				    margin-bottom: 2px;
				    margin-top: 5px;
				    position: relative !important;
				    top: 3px;
				    width: 300px !important;}
	</style> -->
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>

	<div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
			<span class="sr-only">Toggle sidebar</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<!-- /section:basics/sidebar.mobile.toggle -->
		<div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<a href="#" class="navbar-brand" style="pasition:absolute;margin-top:-13px;height: 58px">
				<img src="${res}/images/logo-dfbx.png"/><small>示例项目</small>
			</a>

			<!-- /section:basics/navbar.layout.brand -->

			<!-- #section:basics/navbar.toggle -->

			<!-- /section:basics/navbar.toggle -->
		</div>

		<!-- #section:basics/navbar.dropdown -->
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			
			<ul class="nav ace-nav">
				<!-- #section:basics/navbar.user_menu -->
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<img class="nav-user-photo" src="${res}/avatars/avatar4.png" alt="Jason's Photo" />
						<span class="user-info">
							<small>您好,</small><shiro:principal property="name" />
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>

					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

						<li class="divider"></li>

						<li>
							<a href="${ctx}/logout">
								<i class="ace-icon fa fa-power-off"></i>
								登出
							</a>
						</li>
					</ul>
				</li>

				<!-- /section:basics/navbar.user_menu -->
			</ul>
		</div>
		<!-- /section:basics/navbar.dropdown -->
	</div><!-- /.navbar-container -->
</div>
