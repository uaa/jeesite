package com.thinkgem.jeesite.modules.fragment.service;

import java.util.Date;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BeanUtil;
import com.thinkgem.jeesite.common.persistence.BlankUtil;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.fragment.dao.NoteDao;
import com.thinkgem.jeesite.modules.fragment.entity.Note;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Service
@Transactional(readOnly = true)
public class NoteService extends BaseService {

	@Resource
	private NoteDao noteDao;
	
	@Transactional(readOnly=false)
	public void saveNote(Note note) {
		if(!BlankUtil.isBlank(note)) {
			note.setSendTime(new Date());
			User user = UserUtils.getUser();
			note.setUser(user);
			noteDao.saveT(note);
		}
	}
	
	public Page<Note> findPageNotes(Page<Note> page, Note note) {
		DetachedCriteria dc = noteDao.createDetachedCriteria();
		if(!BlankUtil.isBlank(note.getTitle())) {
			dc.add(Restrictions.like("title", "%"+note.getTitle()+"%"));
		}
		if(!BlankUtil.isBlank(note.getContent())) {
			dc.add(Restrictions.like("content", "%"+note.getContent()+"%"));
		}
		return noteDao.find(page, dc);
	}
	
	@Transactional(readOnly=false)
	public void updateNote(Note n) {
		logger.debug("更新便笺信息");
		Note entity = noteDao.findTById(n.getId());
		BeanUtil.copyProperties(entity, n);
		noteDao.updateT(entity);
	}
	
	public Note findNote(Note n) {
		return noteDao.findTById(n.getId());
	}
	
	@Transactional(readOnly=false)
	public void deleteNote(Note n) {
		noteDao.deleteT(noteDao.findTById(n.getId()));
	}
}
