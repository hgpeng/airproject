package com.hhwork.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.logicalcobwebs.proxool.ProxoolDataSource;

import com.hhwork.annotation.Column;
import com.hhwork.annotation.Table;
import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.model.BaseData;

public class SQLHelpers {

	public static SQLValues generateInsertSQL(Object obj){
		SQLValues ret=new SQLValues();
		StringBuilder sql=new StringBuilder();
		StringBuilder params=new StringBuilder("values(");
		List<Object> args=new ArrayList<Object>();
		sql.append("insert into ");
		Class clazz=obj.getClass();
		//获取表名
		String tableName=null;
		if(clazz.isAnnotationPresent(Table.class)){
			Table table=(Table) clazz.getAnnotation(Table.class);
			tableName=table.value();
		}else{
			tableName=clazz.getSimpleName();
			tableName=tableName.substring(0,1).toLowerCase()+tableName.substring(1);
		}
		sql.append(tableName).append("(");
		//获取字段名跟字段值
		Field[] fields=clazz.getDeclaredFields();
		for(Field f:fields){
			String columnName=null;
			//默认忽略id
			if(f.getName().equals("id")){
				continue;
			}
			if(f.isAnnotationPresent(Column.class)){
				Column c=f.getAnnotation(Column.class);
				//忽略该列
				if(c.ignore()){
					continue;
				}
				if(StringUtils.isBlank(c.value())){
					columnName=f.getName();
					columnName=columnName.substring(0,1).toLowerCase()+columnName.substring(1);
				}else{
					columnName=c.value();
				}
				
			}else{
				columnName=f.getName();
			}
			
			try {
				Method m = (Method) obj.getClass().getMethod(  
				        "get" + getMethodName(f.getName()));
				Object val =  m.invoke(obj);// 调用getter方法获取属性值
				//不处理空值
				if(val==null){
					continue;
				}
				sql.append(columnName).append(",");
				params.append("?,");
				args.add(val);
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}catch(InvocationTargetException e){
				e.printStackTrace();
			}catch(IllegalAccessException e){
				e.printStackTrace();
			}
		}
		sql.setLength(sql.length()-1);
		sql.append(") ");
		params.setLength(params.length()-1);
		params.append(")");
		sql.append(params.toString());
		ret.sql=sql.toString();
		ret.args=args.toArray();
		return ret;
	}
	
	/**
	 * 删除语句
	 * @param obj
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static String generateDeleteSQL(Object obj,int id){
		StringBuilder sql=new StringBuilder();
		sql.append("delete from ");
		Class clazz=obj.getClass();
		//获取表名
		String tableName=null;
		if(clazz.isAnnotationPresent(Table.class)){
			Table table=(Table) clazz.getAnnotation(Table.class);
			tableName=table.value();
		}else{
			tableName=clazz.getSimpleName();
			tableName=tableName.substring(0,1).toLowerCase()+tableName.substring(1);
		}
		sql.append(tableName).append(" where id=").append(id);
		return sql.toString();
	}
	
	public static SQLValues generateUpdateSQL(Object obj,int id){
		SQLValues sqlValues=new SQLValues();
		StringBuilder sql=new StringBuilder();
		List<Object> args=new ArrayList<Object>();
		sql.append("update ");
		//表名
		Class clazz=obj.getClass();
		//获取表名
		String tableName=null;
		if(clazz.isAnnotationPresent(Table.class)){
			Table table=(Table) clazz.getAnnotation(Table.class);
			tableName=table.value();
		}else{
			tableName=clazz.getSimpleName();
			tableName=tableName.substring(0,1).toLowerCase()+tableName.substring(1);
		}
		sql.append(tableName).append(" set ");
		Field[] fields=clazz.getDeclaredFields();
		for(Field f:fields){
			String columnName=null;
			//默认忽略id
			if(f.getName().equals("id")){
				continue;
			}
			if(f.isAnnotationPresent(Column.class)){
				Column c=f.getAnnotation(Column.class);
				//忽略该列
				if(c.ignore()){
					continue;
				}
				if(StringUtils.isBlank(c.value())){
					columnName=f.getName();
					columnName=columnName.substring(0,1).toLowerCase()+columnName.substring(1);
				}else{
					columnName=c.value();
				}
				
			}else{
				columnName=f.getName();
			}
			try {
				Method m = (Method) obj.getClass().getMethod(  
				        "get" + getMethodName(f.getName()));
				Object val =  m.invoke(obj);// 调用getter方法获取属性值
				//不处理空值
				if(val==null){
					continue;
				}
				sql.append(columnName).append("=?,");
				args.add(val);
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}catch(InvocationTargetException e){
				e.printStackTrace();
			}catch(IllegalAccessException e){
				e.printStackTrace();
			}
			
		}
		sql.setLength(sql.length()-1);
		//默认是id（有待修改）
		sql.append(" where id=?");
		args.add(id);
		
		sqlValues.sql=sql.toString();
		sqlValues.args=args.toArray();
		return sqlValues;
	}
	
	
	public static <T> Pagination<T> getRowSize(String originalSql,
			ProxoolDataSource dataSource, Object[] objs, Pagination<T> page,
			PageMapper<T> callback) {
		int pageSize = page.getPageSize();
		int start = page.getPage();
		StringBuilder sql = new StringBuilder(originalSql);
		if(StringUtils.isNotBlank(page.getSortname()) && StringUtils.isNotBlank(page.getSortorder())){
			sql.append(" order by ").append(page.getSortname()).append(" ").append(page.getSortorder());
		}
		
		sql.append(" limit ").append(pageSize * (start - 1)).append(",").append(pageSize);
		PreparedStatement statement = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			if (conn == null) {
				return page;
			}
			statement = conn.prepareStatement(sql.toString());
			if (objs != null) {
				for (int i = 0, n = objs.length; i < n; i++) {
					statement.setObject(i + 1, objs[i]);
				}
			}
			rs = statement.executeQuery();
			if (callback == null) {
				return page;
			}
			Pagination<T> results = callback.getPage(rs, page);
			sql.setLength(0);
			//获取总数量
			sql.append("select FOUND_ROWS() as ct");
			rs = statement.executeQuery(sql.toString());
			if (rs.next()) {
				int count = rs.getInt(1);
				results.setTotal(count);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return page;
	}
	
	/**
	 * getRowSize默认实现，返回map
	 * @param originalSql
	 * @param dataSource
	 * @param objs
	 * @param page
	 * @return
	 */
	public static  Pagination<Map<String,Object>> getRowSize(String originalSql,
			ProxoolDataSource dataSource, Object[] objs, Pagination<Map<String,Object>> page){
		return getRowSize(originalSql, dataSource, objs, page, new PageMapper<Map<String,Object>>() {

			@Override
			public Map<String, Object> toCustomizedBean(ResultSet rs) {
				Map<String, Object> data = new LinkedHashMap<String, Object>();
				try {
					ResultSetMetaData metaData = rs.getMetaData();
					int columnCount = metaData.getColumnCount();
			        for (int i = 1; i <= columnCount; ++i) {
						String key = metaData.getColumnLabel(i);
						if ((key == null) || (key.length() < 1)) {
							key = metaData.getColumnName(i);
						}
						Object obj = rs.getObject(i);
						if (obj instanceof Blob){
							obj = rs.getBytes(i);
						} else if (obj instanceof Clob) {
							obj = rs.getString(i);
						} else if ((obj != null) && (obj instanceof java.sql.Date) && ("java.sql.Timestamp".equals(rs.getMetaData().getColumnClassName(i)))) {
							obj = rs.getTimestamp(i);
						}

						data.put(key, obj);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return data;
			}
		});
	}
	
	
	private static String getMethodName(String name){
		StringBuilder sb=new StringBuilder();
		if(StringUtils.isBlank(name)){
			return sb.toString();
		}
		sb.append(name.substring(0,1).toUpperCase()).append(name.substring(1));
		return sb.toString();
	}
	
	/**
	 * sql跟args参数
	 * @author hgpeng
	 *
	 */
	public static class SQLValues{
		private String sql;
		
		private Object[] args;

		public String getSql() {
			return sql;
		}

		public Object[] getArgs() {
			return args;
		}
	}
	
	public static void main(String[] args) {
		BaseData baseData=new BaseData();
		SQLValues sqlValue=generateInsertSQL(baseData);
		System.out.println(sqlValue.sql);
	}
}
