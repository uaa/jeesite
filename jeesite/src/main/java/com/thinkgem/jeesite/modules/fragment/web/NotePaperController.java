package com.thinkgem.jeesite.modules.fragment.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.ResultObject;
import com.thinkgem.jeesite.common.persistence.MyPage;
import com.thinkgem.jeesite.common.persistence.Page;
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
	
	@RequestMapping(value="/update")
	@ResponseBody
	public ResultObject updateNote(Note note) {
		noteService.updateNote(note);
		ResultObject ro = new ResultObject();
		ro.setSuccess(true);
		return ro;
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public ResultObject deleteNote(Note note) {
		noteService.deleteNote(note);
		ResultObject ro = new ResultObject();
		ro.setSuccess(true);
		return ro;
	}
	
	@RequestMapping(value="/listPage")
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	public MyPage findNotes(MyPage myPage, Note note) {
		MyPage p = new MyPage();
		Page page = new Page();
		page.setPageNo(myPage.getPage());
		page.setPageSize(myPage.getPageSize());
		page = noteService.findPageNotes(page, note);
		p.setRows(page.getList());
		p.setPage(page.getPageNo());
		p.setPageSize(page.getPageSize());
		p.setTotal(page.getTotalPage());
		p.setRecords((int)page.getCount());
		return p;
	}
	
	@RequestMapping(value="/note")
	@ResponseBody
	public Note findNote(Note n) {
		return noteService.findNote(n);
	}
	
	
}
