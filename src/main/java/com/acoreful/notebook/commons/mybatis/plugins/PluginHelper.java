package com.acoreful.notebook.commons.mybatis.plugins;

import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;

import com.acoreful.notebook.commons.util.EhcacheUtils;

public class PluginHelper {
	
	public static final String SHOW_COLUMNS_FROM = "show columns from ";

	public static final String COLUMN_KEY = "column_key";

	public static final String FIELD = "field";

	public static final String LY_TABLE = "sys_table";

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
			table = formMap.get("sys_table");
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
		} else if (DELETEBYNAMES.equals(sqlId)) {
			sql = "delete from " + table.toString() + " where ";
			String param = "";
			for (Entry<String, Object> entry : formMap.entrySet()) {
				if (!"sys_table".equals(entry.getKey()) && null != entry.getValue() && !"_t".equals(entry.getKey()))
					param += " and " + entry.getKey() + " in (" + entry.getValue() + ")";
			}
			if (StringUtils.isNotBlank(param)) {
				param = param.substring(param.indexOf("and") + 4);
				sql += param;
			}
		} else if (FINDBYNAMES.equals(sqlId)) {
			String[] fe = field.split(",");
			String param = "";
			for (String string : fe) {
				if (formMap.containsKey(string)) {
					Object v = formMap.get(string);
					if (v.toString().indexOf("%") > -1)// 处理模糊查询
					{
						param += " and " + string + " like '" + v + "'";
					} else {
						param += " and " + string + " = '" + v + "'";
					}
				}
			}
			if (StringUtils.isNotBlank(param)) {
				param = param.substring(param.indexOf("and") + 4);
				sql += " where " + param;

			}
			Object by = formMap.get("orderby");
			if (null != by) {
				sql += " " + by;
			}
		}else if (ADDENTITY.equals(sqlId)) {
			String[] fe = field.split(",");
			String fieldString = "";
			String fieldValues = "";
			for (String string : fe) {
				Object v = formMap.get(string);
				if (null != v && !StringUtils.isBlank(v.toString())) {
					fieldString += string + ",";
					fieldValues += "'" + v + "',";
				}
			}
			sql = "insert into " + table.toString() + " (" + trimComma(fieldString) + ")  values ("
					+ trimComma(fieldValues) + ")";
		}  else {
			
			throw new Exception(sqlId+"调用公共方法异常!");
		}
		return sql;
	}
	
	
	
	public static String trimComma(
			String para) {
		if (StringUtils
				.isNotBlank(para)) {
			if (para.endsWith(",")) {
				return para
						.substring(
								0,
								para.length() - 1);
			} else {
				return para;
			}
		} else {
			return "";
		}
	}
}
