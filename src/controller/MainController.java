package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService ms;
	@RequestMapping(value="showMain")
	public ModelAndView showMain(){
		ModelAndView mv = new ModelAndView("main/main");
		return mv;
	}
	@RequestMapping(value="header",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView header(){
		return new ModelAndView("main/header");
	}
	@RequestMapping(value="reci",method={RequestMethod.POST,RequestMethod.GET})
	public void reci(String text,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<String> strs = ms.searchReCi(text);
			System.out.println(strs.size());
			String mes ="";
			for(int i=0; i< strs.size();i++){
				mes +=strs.get(i) + ",";
			}
			out.print(mes);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping(value="footer",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView footer(){
		return new ModelAndView("main/footer");
	}
	@RequestMapping(value="loginOut",method={RequestMethod.POST,RequestMethod.GET})
	public void loginOut(HttpServletRequest request,HttpServletResponse response){
		request.getSession().setAttribute("user", null);
		try {
			PrintWriter out = response.getWriter();
			out.print("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
