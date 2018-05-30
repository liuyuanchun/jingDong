package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManageController {
	@RequestMapping(value="showManage")
	public ModelAndView showManage(){
		ModelAndView mv = new ModelAndView("manage/mainM/index");
		return mv;
	}
	@RequestMapping(value="MHeader")
	public ModelAndView showMHeader(){
		ModelAndView mv = new ModelAndView("manage/mainM/header");
		return mv;
	}
	@RequestMapping(value="MFooter")
	public ModelAndView showMFooter(){
		ModelAndView mv = new ModelAndView("manage/mainM/footer");
		return mv;
	}
	@RequestMapping(value="MLeft")
	public ModelAndView showMLeft(){
		ModelAndView mv = new ModelAndView("manage/mainM/left");
		return mv;
	}
}
