package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.BigType;

import service.TypeService;
@Controller
public class TypeController {
	@Autowired
	TypeService ts;
	@RequestMapping(value="showType")
	public ModelAndView showType(){
		ModelAndView mv = new ModelAndView("type/type");
		List<BigType> type = ts.searchAllType();
		mv.addObject("bigType", type);
		return mv;
	}
}
