package com.acoreful.notebook.commons.mybatis.plugins;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;

import com.acoreful.notebook.commons.util.EhcacheUtils;

public class PluginHelper {
	
	public static final String SHOW_COLUMNS_FROM = "show columns from ";

	public static final String COLUMN_KEY = "column_key";

	public static final String FIELD = "field";

	public static final String LY_TABLE = "ly_table";

	public static final String FINDBYWHERE = "findByWhere";

	public static final String FINDBYPAGE = "findByPage";

	public static final String DELETEBYNAMES = "deleteByNames";

	public static final String DELETEBYATTRIBUTE = "deleteByAttribute";

	public static final String FINDBYNAMES = "findByNames";

	public static final String FINDBYATTRIBUTE = "findByAttribute";

	public static final String ADDENTITY = "addEntity";

	public static final String EDITENTITY = "editEntity";

	public static final String FINDBYFRIST = "findbyFrist";

	public static final String BATCHSAVE = "batchSave";
	
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
		String sqlId = mappedStatement.getId();
		sqlId = sqlId.substring(sqlId.lastIndexOf(".") + 1);
		if (FINDBYWHERE.equals(sqlId)) {
			if (null != formMap.get("where") && !StringUtils.isBlank(formMap.get("where").toString())) {
				sql += " " + formMap.get("where").toString();
			}
		} else {
			throw new Exception("调用公共方法异常!");
		}
		return sql;
	}
}
