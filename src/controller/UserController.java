package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.User;

import service.UserService;
import util.CreateMD5;
import util.RandomNumber;

@Controller
public class UserController {
	@Autowired
	UserService us;
	@RequestMapping(value="showRegister")
	public ModelAndView showRegister() {
		return new ModelAndView("user/register");
	}
	@RequestMapping(value="showLogin")
	public ModelAndView showLogin() {
		return new ModelAndView("user/login");
	}
	@RequestMapping(value="login")
	public ModelAndView login(User user) {
		ModelAndView mv = new ModelAndView();
		boolean flag = us.addUser(user);
			if(flag){
				mv.setViewName("user/login");
			}else{
				mv.setViewName("redirect:showRegister");
			}

		return mv;
	}
	@RequestMapping(value="getRandom")
	public void getRandom(HttpServletResponse response,HttpServletRequest request) {
		RandomNumber rd = new RandomNumber();
		try {
			String rand = rd.generateImage(response);
			request.getSession().setAttribute("rand", rand);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="testRandom")
	public void testRandom(String text,HttpServletRequest request,HttpServletResponse response) {
		try {
			
			PrintWriter out = response.getWriter();
			String random = (String)request.getSession().getAttribute("rand");
			if(random!=null&&random.equals(text)){
				out.print("success");
			}else{
				out.print("验证码错误");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="doLogin")
	public ModelAndView doLogin(String username,String password,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		User user = us.doLogin(username, password);
		if(user!=null){
			mv.setViewName("redirect:showMain");
			request.getSession().setAttribute("user", user);
		}else{
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>alert('登录失败');</script>");
			mv.setViewName("user/login");
		}
		return mv;
	} 
	@RequestMapping(value="showMUser")
	public ModelAndView showMUser(){
		ModelAndView mv = new ModelAndView("manage/user/personMessage");
		List<User> userlist = us.selectAllUser();
		mv.addObject("userlist", userlist);
		return mv;
	}
	@RequestMapping(value="showModifyMpwd")
	public ModelAndView showModifyMpwd(){
		ModelAndView mv = new ModelAndView("manage/user/modifyPwd");
		return mv;
	}
	@RequestMapping(value="ModifyMpwd")
	public void modifyMpwd(String password,HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			User user = (User)request.getSession().getAttribute("user");
			user.setPassword(password);
			boolean flag = us.updateUser(user);
			if(flag){
				request.getSession().setAttribute("user", user);
				out.print("<script>alert('修改成功');window.location.href='showMUser';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="compareMPwd")
	public void compareMPwd(String oPwd,HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			User user = (User)request.getSession().getAttribute("user");
			if(CreateMD5.getMd5(oPwd).equals(user.getPassword())){
				out.print("true");
			}else{
				out.print("原密码不正确");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
