package com.thinkgem.jeesite.modules.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.file.dao.CommonFileDao;
import com.thinkgem.jeesite.modules.file.entity.CommonFile;

@Service
@Transactional
public class CommonFileService extends BaseService {
	
	@Autowired
	private CommonFileDao commonFileDao;
	
	public void save(CommonFile commonFile){
		commonFileDao.saveT(commonFile);
	}
	
	public void update(CommonFile commonFile){
		commonFileDao.updateT(commonFile);
	}
	
	public void deleteById(CommonFile commonFile){
		commonFileDao.deleteT(commonFile);
	}

}
