package com.thinkgem.jeesite.modules.fragment.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.fragment.entity.Note;

@Controller
@RequestMapping(value = "${adminPath}/fragment/notepaper")
public class NotePaperController extends BaseController {

	@RequestMapping(value="main")
	public String main(Model model) {
		logger.debug("跳转至便笺主页面");
		System.out.println("--------------------------");
		return "modules/fragment/notepaper/main";
	}
	
	@RequestMapping(value="create")
	@ResponseBody
	public String create(Note note) {
		//User user = UserUtils.getUser();
		
		return "";
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
