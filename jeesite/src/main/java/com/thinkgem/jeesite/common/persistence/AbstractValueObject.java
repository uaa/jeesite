package com.thinkgem.jeesite.common.persistence;

import java.beans.PropertyDescriptor;
import java.util.Collection;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;


public abstract class AbstractValueObject implements IValueObject {

	@SuppressWarnings("rawtypes")
	@Override
	public String toString() {
		try {
			StringBuffer sb = new StringBuffer();
			sb.append(this.getClass().getPackage().getName()).append(".")
					.append(this.getClass().getName()).append(":");
			PropertyDescriptor[] propDescs = PropertyUtils
					.getPropertyDescriptors(this);
			for (int i = 1, n = propDescs.length; i < n; i++) {
				String name = propDescs[i].getName();
				if (!PropertyUtils.isReadable(this, name)) {
					continue;
				}
				// System.out.println(this+"的属性名称："+name);
				Object propValue = PropertyUtils.getProperty(this, name);
				// System.out.println(this+"的属性名称："+name+"可以成功老帖");
				if (propValue instanceof Collection) {
					sb.append(name)
							.append(BlankUtil.isBlank((Collection) propValue) ? "=[null],"
									: "=[more...],");
				} else if (propValue instanceof Map) {
					sb.append(name).append(
							BlankUtil.isBlank((Map) propValue) ? "=[null],"
									: "=[more...],");
				} else if (propValue instanceof IValueObject) {
					String className = propValue.getClass().getName();
					sb.append(name).append("=[").append(className).append("],");
				} else {
					sb.append(name).append("=[").append(propValue).append("],");
				}
			}
			return sb.toString();
		} catch (Exception ex) {
			return "";
		}
	}
}
