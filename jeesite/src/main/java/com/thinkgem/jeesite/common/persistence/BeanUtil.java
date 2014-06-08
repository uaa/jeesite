package com.thinkgem.jeesite.common.persistence;

/**  
 * 全球陶瓷艺术（数字）馆 
 * 功能描述： 
 * 
 * <p>版权所有：dorsia 
 * <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
 *
 * @author:Peter  2012-11-20 
 * @version 1.0.0  
 */

import java.lang.reflect.Method;
import java.util.HashMap;

/**
 * 全球陶瓷艺术（数字）馆 功能描述：
 * 
 * <p>
 * 版权所有：dorsia
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author:Peter 2012-11-20
 * @version 1.0.0
 */
@SuppressWarnings("rawtypes")
public class BeanUtil {

	private static HashMap<Class, Method[]> beanMethodCache = new HashMap<Class, Method[]>();
	private static HashMap<Class, HashMap<String, Method>> fromBeanMethodCache = new HashMap<Class, HashMap<String, Method>>();

	public static <T> T copyProperties(T bean, Object fromBean) {

		Object[] objects = new Object[0];
		try {
			Class formBeanClass = fromBean.getClass();

			Method[] beanMethods = beanMethodCache.get(bean.getClass());
			if (beanMethods == null) {
				beanMethods = bean.getClass().getMethods();
				beanMethodCache.put(bean.getClass(), beanMethods);
			}

			HashMap<String, Method> fromBeanMethods = fromBeanMethodCache.get(formBeanClass);
			if (fromBeanMethods == null) {
				fromBeanMethods = new HashMap<String, Method>();
				Method[] methods = formBeanClass.getMethods();
				String getMethodName = null;
				for (Method method : methods) {
					getMethodName = method.getName();
					if (getMethodName.startsWith("get") || getMethodName.startsWith("is"))
						fromBeanMethods.put(getMethodName, method);
				}
				fromBeanMethodCache.put(formBeanClass, fromBeanMethods);
			}

			String methodName = null;
			String getMethodName = null;

			Class[] paramsType = null;
			Class paramType = null;
			for (Method method : beanMethods) {
				methodName = method.getName();
				if (methodName.startsWith("set")) {
					paramsType = method.getParameterTypes();
					if (paramsType.length != 1)
						continue;

					paramType = paramsType[0];
					if (paramType.isInstance(boolean.class)) {
						getMethodName = "is" + methodName.substring(3);
					} else {
						getMethodName = "get" + methodName.substring(3);
					}
					Method formBeanGetMethod = fromBeanMethods.get(getMethodName);
					if (formBeanGetMethod != null) {
						if (paramType.equals(formBeanGetMethod.getReturnType())) {
							Object value = formBeanGetMethod.invoke(fromBean, objects);
							if (value != null) {
								method.invoke(bean, new Object[] { value });
							}
						}
					}
				}
			}
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
