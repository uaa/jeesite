package com.thinkgem.jeesite.modules.fragment.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BlankUtil;
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
			note.setCreateDate(new Date());
			User user = UserUtils.getUser();
			note.setUser(user);
			noteDao.save(note);
		}
	}
	
}
