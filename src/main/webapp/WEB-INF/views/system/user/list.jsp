<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/res/taglibs.jsp" %>
<script type="text/javascript" src="${my}/js/system/user/list.js"></script>
<div class="row">
	<div class="col-md-12">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label">账号:</label>
				<input class="form-control" id="accountName"
					name="userFormMap.accountName">
			</div>
			<a href="javascript:void(0);" class="btn btn-default" id="search">查询</a>
			<a href="javascript:void(0);" class="btn btn-info" id="search">导出excel</a>
		</form>
	</div>
</div>
	<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${resList}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
	
	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
