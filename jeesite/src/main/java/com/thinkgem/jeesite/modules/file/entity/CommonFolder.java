package com.thinkgem.jeesite.modules.file.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.thinkgem.jeesite.common.persistence.BaseDomainEntity;

@Entity
@Table
public class CommonFolder extends BaseDomainEntity<Integer>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private Integer size;
	private Integer parentId;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

}
