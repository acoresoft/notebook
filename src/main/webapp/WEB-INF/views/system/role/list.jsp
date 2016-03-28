<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/res/taglibs.jsp" %>
<script type="text/javascript" src="${my}/js/system/role/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">角色名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="name"
					name="roleFormMap.roleFormMap.name">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
		</form>
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
