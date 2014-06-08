package com.thinkgem.jeesite.modules.fragment.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.thinkgem.jeesite.common.persistence.BaseDomainEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Entity
@Table(name="note_receiver")
public class NoteReciver extends BaseDomainEntity<Integer> {

	private static final long serialVersionUID = 1L;

	private User receiver;
	
	private Note note;
	
	private Date receiveTime;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="note_id")
	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}
	
	@Column(name="receive_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
	
	
	
}
