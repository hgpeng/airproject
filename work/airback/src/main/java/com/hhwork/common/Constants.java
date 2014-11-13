package com.hhwork.common;

/**
 * 常亮
 * @author hgpeng
 *
 */
public class Constants {

	public static final String ADMIN="admin";
	/**
	 * 状态
	 * @author hgpeng
	 *
	 */
	public static class Status{
		public static final int SUCCESS=1;
		
		public static final int FAIL=-1;
		
		public static final int NOT_EXISTS=-2;
	}
	
	public static class BaseType{
		/**
		 * 菜单
		 */
		public static final int MENU=1;
		
		/**
		 * 菜单项
		 */
		public static final int MENUITEM=2;
		
		/**
		 * flash脚本
		 */
		public static final int FLASH=10;
		
		/**
		 * html脚本
		 */
		public static final int HTML=11;
	}
	
	/**
	 * 产品状态
	 * @author hgpeng
	 *
	 */
	public static class ProductStatus{
		/**
		 * 上架
		 */
		public static final int OnShelves=1;
		
		/**
		 * 下架
		 */
		public static final int OffShelves=2;
	}
	
}
