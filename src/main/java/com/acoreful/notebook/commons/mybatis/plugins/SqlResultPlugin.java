package com.acoreful.notebook.commons.mybatis.plugins;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.apache.ibatis.executor.resultset.DefaultResultSetHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.log4j.Logger;

@Intercepts({ @Signature(type = ResultSetHandler.class, method = "handleResultSets", args = { Statement.class }) })
public class SqlResultPlugin implements Interceptor{
	
	public final static Logger logger = Logger.getLogger(SqlResultPlugin.class);
	public static final String BATCHSAVE = ".BaseMapper.";
	
	@Override
	public Object intercept(Invocation ivk) throws Throwable {
		logger.info("ResultSet Handel*********************88");
		if (ivk.getTarget() instanceof DefaultResultSetHandler) {
			DefaultResultSetHandler delegate = (DefaultResultSetHandler) ivk
					.getTarget();
			Statement stmt = (Statement) ivk.getArgs()[0];
			List<Object> lists=delegate.handleResultSets(stmt);
			/*BaseStatementHandler delegate = (BaseStatementHandler) ReflectHelper
					.getValueByFieldName(statementHandler, "delegate");
			*/
			MappedStatement mappedStatement = (MappedStatement) ReflectHelper
					.getValueByFieldName(delegate, "mappedStatement");
			BoundSql boundSql = (BoundSql) ReflectHelper
					.getValueByFieldName(delegate, "boundSql");
		
			return this.handleResultSet(mappedStatement, boundSql, lists);
		}
		return ivk.proceed();
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		logger.info("SqlResultPlugin init **********");
		/*dialect = p.getProperty("dialect");
		if (isEmpty(dialect)) {
			try {
				throw new PropertyException("dialectName or dialect property is not found!");
			} catch (PropertyException e) {
				e.printStackTrace();
			}
		}*/
		
	}
	
	/**
	 * 处理结果集
	 * @param mappedStatement
	 * @param boundSql
	 * @param lists
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Object> handleResultSet(MappedStatement mappedStatement,BoundSql boundSql,List<Object> lists){
		 if(mappedStatement.getId().indexOf(BATCHSAVE)>-1){
				try {
				  List<Object> mlist = new ArrayList<Object>();
				    Object parameterObject = boundSql.getParameterObject();
				    Map map = (Map) parameterObject;
					Object o3 = null;
					if(null!=map){
						o3=map.get("param3");
					}
					for (Object object : lists) {
						Map<String, Object> m = (Map) object;
						Object o = null; 
						if(null!=o3){
							Class fm = (Class) o3;
							o= fm.newInstance();
						}else{
							o = (Object) parameterObject.getClass().newInstance();
						}
						Map<String, Object> fmap = (Map<String, Object>) o;
						for (Entry<String, Object> entry : m.entrySet()) {
							fmap.put(entry.getKey(), entry.getValue());
						}
						mlist.add(o);
					}
					 return mlist;
				} catch (Exception e) {
					e.printStackTrace();
				}
		    	
		    }
		 return lists;
	}

}
