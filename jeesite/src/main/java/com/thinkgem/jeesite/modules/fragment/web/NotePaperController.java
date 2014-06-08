package com.thinkgem.jeesite.modules.fragment.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.ResultObject;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.fragment.entity.Note;
import com.thinkgem.jeesite.modules.fragment.service.NoteService;

@Controller
@RequestMapping(value = "${adminPath}/fragment/notepaper")
public class NotePaperController extends BaseController {
	
	@Resource
	private NoteService noteService;

	@RequestMapping(value="main")
	public String main(Model model) {
		logger.debug("跳转至便笺主页面");
		return "modules/fragment/notepaper/main";
	}
	
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
	}
	
}
