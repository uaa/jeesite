package com.thinkgem.jeesite.modules.file.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.file.service.CommonFileService;

@Controller
@RequestMapping(value = "${adminPath}/file/commonFile")
public class CommonFileController extends BaseController {
	
	@Autowired
	private CommonFileService commonFileService;

	@RequestMapping(value="main")
	public String main(Model model) {
		logger.debug("跳转至文件主页面");
		return "modules/file/commonFileList";
	}
	/*
	@RequestMapping(value="/create")
	@ResponseBody
	public ResultObject create(Note note) {
		//Note note = new Note();
		noteService.saveNote(note);
		ResultObject ro = new ResultObject();
		ro.setSuccess(true);
		return ro;
	}
	
	@RequestMapping(value="update")
	@ResponseBody
	public String update(Note note) {
		
		return "";
	}
	
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(Note note) {
		
		return "";
	}*/
	
}
