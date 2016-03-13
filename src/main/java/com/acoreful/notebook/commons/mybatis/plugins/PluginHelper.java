package com.acoreful.notebook.commons.mybatis.plugins;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;

import com.acoreful.notebook.commons.util.EhcacheUtils;

public class PluginHelper {
	
	
	@SuppressWarnings("unchecked")
	public static final String joinSql(Connection connection, MappedStatement mappedStatement, BoundSql boundSql,
			Map<String, Object> formMap, List<Object> formMaps) throws Exception {
		Object table = null;
		String sql = "";
		Map<String, Object> mapfield = null;
		String field = null;
		if (null != formMap) {
			table = formMap.get("ly_table");
			mapfield = (Map<String, Object>) EhcacheUtils.get(table);
			field = mapfield.get("field").toString();
			sql = " select " + field + " from " + String.valueOf(table);
		}
		return sql;
	}
}
