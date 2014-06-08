package com.thinkgem.jeesite.common.persistence;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * 功能描述:判断对象是否为空
 * <p>
 * 版权所有：dorsia
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 */
public class BlankUtil {

	/**
	 * 方法用途和描述: 判断字符串是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isBlank(final String str) {
		return (str == null) || "".equals(str);// (str.trim().length() <= 0);
	}

	/**
	 * 方法用途和描述: 判断字符是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param cha
	 * @return
	 */
	public static boolean isBlank(final Character cha) {
		return (cha == null) || cha.equals(' ');
	}

	/**
	 * 方法用途和描述: 判断对象是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNull(final Object obj) {
		return (obj == null);
	}

	public static boolean isBlank(Object obj) {
		return (obj == null || "".equals(obj.toString().trim()));
	}

	/**
	 * 方法用途和描述: 判断数组是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param objs
	 * @return
	 */
	public static boolean isBlank(final Object[] objs) {
		return (objs == null) || (objs.length <= 0);
	}

	/**
	 * 方法用途和描述: 判断Collectionj是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isBlank(final Collection obj) {
		return (obj == null) || (obj.size() <= 0);
	}

	/**
	 * 方法用途和描述: 判断Set是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isBlank(final Set obj) {
		return (obj == null) || (obj.size() <= 0);
	}

	/**
	 * 方法用途和描述: 判断Serializable是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isBlank(final Serializable obj) {
		return obj == null;
	}

	/**
	 * 方法用途和描述: 判断Map是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isBlank(final Map obj) {
		return (obj == null) || (obj.size() <= 0);
	}

	/**
	 * 方法用途和描述: 判断字符串数组第一个是否为空
	 * <p>
	 * 方法的实现逻辑描述（如果是接口方法可以不写）：
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isBlank(final String[] array) {
		return (null == array || array.length == 0 || null == array[0] || array[0].trim().length() <= 0 || "null".equalsIgnoreCase(array[0]) || "undefined".equalsIgnoreCase(array[0]));
	}

}
