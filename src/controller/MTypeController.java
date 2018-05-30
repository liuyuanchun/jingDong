package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import entity.BigType;
import entity.SmallType;

import service.TypeService;
@Controller
public class MTypeController {
	@Autowired
	TypeService ts;
	@RequestMapping(value="showMType")
	public ModelAndView showMType(){
		ModelAndView mv = new ModelAndView("manage/type/showType");
		List<BigType> btypelist = ts.searchAllType(); 
		mv.addObject("btypelist", btypelist);
		return mv;
	}
	@RequestMapping(value="showMsType")
	public void showMsType(int bId,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<SmallType> smallTypelist = ts.searchSTypeBybId(bId);
			String mes ="";
			for(int i = 0; i <smallTypelist.size();i++ ){
				mes += smallTypelist.get(i).getId() + "," + smallTypelist.get(i).getName() + ";";
			}
			out.print(mes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="addMbType")
	public void addMbType(String bType,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			boolean flag = ts.insertBType(bType);
			if(flag){
				out.print("success");
			}else{
				out.print("添加失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="addMsType")
	public void addMsType(String sName,Integer bId,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			boolean flag = ts.insertSType(bId,sName);
			if(flag){
				out.print("success");
			}else{
				out.print("添加失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="delMsType")
	public void delMsType(Integer sId,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			boolean flag = ts.deleteSType(sId);
			if(flag){
				out.print("success");
			}else{
				out.print("删除失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="modifyMsType")
	public void modifyMsType(Integer sId,String nsName,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			boolean flag = ts.modifySType(sId,nsName);
			if(flag){
				out.print("success");
			}else{
				out.print("修改失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
