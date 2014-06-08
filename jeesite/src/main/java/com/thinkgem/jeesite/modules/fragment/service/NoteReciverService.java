package com.thinkgem.jeesite.modules.fragment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BeanUtil;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.fragment.dao.NoteReciverDao;
import com.thinkgem.jeesite.modules.fragment.entity.NoteReciver;

@Service
@Transactional(readOnly=true)
public class NoteReciverService extends BaseService {

	@Resource
	private NoteReciverDao noteReciverDao;
	
	@Transactional(readOnly=false)
	public void saveNoteReciver(NoteReciver nr) {
		noteReciverDao.saveT(nr);
	}
	
	@Transactional(readOnly=false)
	public void updateNoteReciver(NoteReciver nr) {
		NoteReciver entity = noteReciverDao.findTById(nr.getId());
		BeanUtil.copyProperties(entity, nr);
		noteReciverDao.updateT(entity);
	}
}
