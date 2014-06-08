
package com.thinkgem.jeesite.common.persistence;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;


@MappedSuperclass
public class BaseDomainEntity<ID extends Serializable> extends AbstractValueObject {

	private static final long serialVersionUID = -871581230406925936L;

	@Id
	@GeneratedValue(generator = "system-identity")
	@GenericGenerator(name = "system-identity", strategy = "identity")
	@Column(nullable = false)
	protected ID id;

	public BaseDomainEntity() {
	}

	/**
	 * Declares the identifier property of an entity bean.
	 * 
	 * @return the id
	 */

	public ID getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(ID id) {
		this.id = id;
	}

}
