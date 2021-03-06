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
		<div class="row"
			style="padding-right: 8px; padding-left: 8px; padding-top: 8ps; padding-bottom: 30px;">
			<div class="col-md-12 portlet ui-sortable"
				style="padding-bottom: 15px">
				<section class="panel panel-success portlet-item">
					<header class="panel-heading">
						<i class="fa fa-briefcase"></i> 警告设置
					</header>
					<table class="table table-striped table-bordered table-hover"
						width="100%" style="vertical-align: middle;">
						<thead>
							<tr style="background-color: #faebcc; text-align: center;">
								<td width="100">名称</td>
								<td width="100">参数</td>
								<td width="205">预警设置</td>
								<td width="375">邮箱设置</td>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>CPU</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_cpuUsage" style="color: red;">50</span> %
								</td>
								<td align="center">
									<table>
										<tr>
											<td>使用率超出</td>
											<td><input class='inputclass' name='cpu' id='cpu'
												type='text' value='${cpu}' /> %,</td>
											<td>发送邮箱提示 <a class='btn btn-info'
												href='javascript:void(0)' onclick='modifySer("cpu");'>
													修改 </a></td>
										</tr>
									</table>
								</td>
								<td rowspan='3' align="center" style="vertical-align: middle;"><input
									class='inputclass' style='width: 250px; height: 32px;'
									name='toEmail' id='toEmail' type='text'
									value='${toEmail}' /><a class='btn btn-info'
									href='javascript:void(0)' onclick='modifySer("toEmail");'>
										修改 </a></td>
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>服务器内存</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_serverUsage" style="color: blue;">50</span> %
								</td>
								<td align="center">
									<table>
										<tr>
											<td>使用率超出</td>
											<td><input class='inputclass' name='ram' id='ram'
												type='text' value='${ram}' /> %,</td>
											<td>发送邮箱提示 <a class='btn btn-info'
												href='javascript:void(0)' onclick='modifySer("ram");'>
													修改 </a></td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>JVM内存</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_jvmUsage" style="color: green;">50</span> %
								</td>
								<td align="center">
									<table>
										<tr>
											<td>使用率超出</td>
											<td><input class='inputclass' name='jvm' id='jvm'
												type='text' value='${jvm}' /> %,</td>
											<td>发送邮箱提示 <a class='btn btn-info'
												href='javascript:void(0)' onclick='modifySer("jvm");'>
													修改 </a></td>
										</tr>
									</table>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
			<div class="col-md-6">
				<section class="panel panel-info portlet-item">
					<header class="panel-heading">
						<i class="fa fa-th-list"></i> 服务器信息
					</header>
					<div class="panel-body" style="padding: 0px"
						data-url="${cxt }/monitor/systemInfo"></div>
				</section>
			</div>
			<div class="col-md-6">
				<section class="panel panel-danger portlet-item">
					<header class="panel-heading">
						<i class="fa fa-fire"></i> 实时监控
					</header>

					<div class="panel-body">
						<div id="main" style="height: 370px;"></div>
					</div>
				</section>
			</div>
			<!-- /.span -->
			<div class="col-md-12" style="margin-top: 10px; height: 330px">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-rss-square"></i> 实时监控
					</header>

					<div class="panel-body">
						<table style="width: 100%;">
							<tr>
								<td width="33.3%"><div id="main_one" style="height: 280px;"></div></td>
								<td width="33.3%"><div id="main_two" style="height: 280px;"></div></td>
								<td width="33.3%"><div id="main_three"
										style="height: 280px;"></div></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
			<!-- /.span -->
		</div>
	</section>
<!-- basic scripts -->
<script type="text/javascript" src="${res}/js/jquery-1.x.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${res_libs}/bootstrap/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${my}/js/app.v1.js"></script> --%>
<script type="text/javascript" src="${res}/js/echarts.min.js"></script>
<script type="text/javascript" src="${my}/js/common.js"></script>
<script type="text/javascript" src="${my}/js/admin/monitor/systeminfo.js"></script>
<script type="text/javascript">
	function modifySer(key){
		$.ajax({
	        async: false,
	        url: "${ctx}/monitor/modifySer",
	        data:{"key":key,"value":$("#"+key).val()},
	        dataType: "json",
	        success: function (data) {
	    	    if(data.flag){
	    	    	alert("更新成功！");
	    	    }else{
	    	    	alert("更新失败！");
	    	    }
	        }
		});
	}
</script>
</body>
</html>
