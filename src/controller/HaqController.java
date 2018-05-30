package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Pro;
import entity.Supplier;
import entity.SupplierOrder;
import entity.User;
import service.HaqService;

@Controller
public class HaqController {
	
	@Autowired
	HaqService haqService ;
	
	/**
	 * TODO 用户信息修改-根据用户编码获取用户实体类对象信息
	 * @param userId
	 * @return jsp
	 * @author haq
	 * @time 2018年5月6日17:41:48
	 */
	@RequestMapping(value="showUserModifyPage")
	public ModelAndView showUserModifyPage(String userId){
		ModelAndView mv = new ModelAndView("manage/user/modifyUserInfo");
		User user = haqService.getUserInfoById(userId);
		if(user==null){
			user=new User();
		}
		mv.addObject("userDTO", user);
		return mv;
	}
	
	/**
	 * TODO 用户信息修改-点击保存按钮 修改用户信息
	 * @param user
	 * @return jsp
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	@RequestMapping(value="doUserModify")
	@ResponseBody
	public ModelAndView doUserModify(User user){
		ModelAndView mv = new ModelAndView();
		boolean flag = haqService.modifyUserInfo(user);
		if(flag){
			mv.setViewName("redirect:showMUser");
		}else{
			mv.setViewName("redirect:showUserModifyPage?userId="+user.getId());
		}
		return mv;
	}
	/**
	 * TODO 删除用户
	 * @param userId
	 * @return resultUtil
	 */
	@RequestMapping(value="doUserDeleteById")
	public void doUserDeleteById(String userId,HttpServletResponse response){
		boolean flag = haqService.deleteUserById(userId);
		try {
			PrintWriter out = response.getWriter();
			if(flag){
				out.print("200");
			}else{
				out.print("500");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * TODO 根据用户名或电话号码查询用户信息
	 * @param user
	 * @return jsp
	 * @author haq
	 * @time 2018年5月8日20:42:18
	 */
	@RequestMapping(value="searchUserForManage")
	public ModelAndView searchUserForManage(User user){
		ModelAndView mv = new ModelAndView("manage/user/personMessage");
		List<User> userList=haqService.searchUserForManage(user);
		mv.addObject("userDTO", user);
		mv.addObject("userlist", userList);
		return mv;
	}
	
	/**
	 * TODO 展示供应商信息
	 * @param supplier
	 * @return jsp
	 * @author haq
	 * @time 2018年5月11日17:53:47
	 */
	@RequestMapping(value="showMSupplier")
	public ModelAndView showMSupplier(Supplier supplier){
		ModelAndView mv = new ModelAndView("manage/supplier/showSupplier");
		List<Supplier> supplierlist=haqService.getListForSupplier(supplier);
		mv.addObject("supplierlist", supplierlist);
		mv.addObject("supplier", supplier);
		return mv;
	}
	
	
	@RequestMapping(value="modifySupplierInfo")
	public ModelAndView modifySupplierInfo(Supplier supplier){
		ModelAndView mv = new ModelAndView("manage/supplier/modifySupplierInfo");
		Supplier supplierlist=haqService.getDTOForSupplier(supplier);
		mv.addObject("supplierDTO", supplierlist);
		return mv;
	}
	
	@RequestMapping(value="doSupplierModify")
	@ResponseBody
	public ModelAndView doSupplierModify(Supplier supplier){
		ModelAndView mv = new ModelAndView();
		boolean flag = haqService.doSupplierModify(supplier);
		if(flag){
			mv.setViewName("redirect:showMSupplier");
		}else{
			mv.setViewName("redirect:modifySupplierInfo?id="+supplier.getId());
		}
		return mv;
	}
	
	/**
	 * TODO 删除供应商信息
	 * @param supplier
	 * @return
	 */
	@RequestMapping(value="doSupplierDeleteById")
	@ResponseBody
	public void doSupplierDeleteById(Supplier supplier,HttpServletResponse response){
		boolean flag = haqService.deleteSupplierById(supplier);
		try {
			PrintWriter out = response.getWriter();
			if(flag){
				out.print("200");
			}else{
				out.print("500");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//
	
	@RequestMapping(value="addSupplier")
	@ResponseBody
	public ModelAndView addSupplier(Supplier supplier){
		ModelAndView mv = new ModelAndView();
		boolean flag = haqService.addSupplier(supplier);
		if(flag){
			mv.setViewName("redirect:showMSupplier");
		}else{
			mv.setViewName("redirect:showAddSupplierPage");
		}
		return mv;
	}
	
	@RequestMapping(value="showAddSupplierPage")
	@ResponseBody
	public ModelAndView showAddSupplierPage(Supplier supplier){
		ModelAndView mv = new ModelAndView("manage/supplier/addSupplierPage");
		return mv;
	}
	
	//
	
	@RequestMapping(value="showMSupplierOrder")
	@ResponseBody
	public ModelAndView showMSupplierOrder(SupplierOrder supplierOrder){
		ModelAndView mv = new ModelAndView("manage/supplier/showSupplierOrder");
		List<SupplierOrder> supplierlist=haqService.getListForSupplierOrder(supplierOrder);
		mv.addObject("supplierlist", supplierlist);
		mv.addObject("supplier", supplierOrder);
		return mv;
	}
	
	@RequestMapping(value="modifySupplierOrder")
	@ResponseBody
	public ModelAndView modifySupplierOrder(SupplierOrder supplierOrder){
		ModelAndView mv = new ModelAndView("manage/supplier/modifySupplierOrder");
		SupplierOrder supplierDTO=haqService.getDTOFotSupplierOrder(supplierOrder);
		mv.addObject("supplierDTO", supplierDTO);
		return mv;
	}
	
	@RequestMapping(value="doSupplierOrderModify")
	@ResponseBody
	public ModelAndView doSupplierOrderModify(SupplierOrder supplierOrder){
		ModelAndView mv = new ModelAndView();
		boolean flag = haqService.doSupplierOrderModify(supplierOrder);
		if(flag){
			mv.setViewName("redirect:showMSupplierOrder");
		}else{
			mv.setViewName("redirect:modifySupplierOrder?id="+supplierOrder.getId());
		}
		return mv;
	}
	
	@RequestMapping(value="doSupplierOrderDeleteById")
	@ResponseBody
	public void doSupplierOrderDeleteById(SupplierOrder supplierOrder,HttpServletResponse response){
		boolean flag = haqService.deleteSupplierOrderById(supplierOrder);
		try {
			PrintWriter out = response.getWriter();
			if(flag){
				out.print("200");
			}else{
				out.print("500");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="showAddMSupplierOrder")
	@ResponseBody
	public ModelAndView showAddMSupplierOrder(){
		ModelAndView mv = new ModelAndView("manage/supplier/addSupplierOrder");
		Supplier supplier =new Supplier();
		List<Supplier> supplierList=haqService.getListForSupplier(supplier);
		List<Pro> proList=haqService.getListForPro();
		mv.addObject("supplierList", supplierList);
		mv.addObject("proList", proList);
		return mv;
	}
	//doAddSupplierPro
	
	@RequestMapping(value="doAddSupplierPro")
	@ResponseBody
	public ModelAndView doAddSupplierPro(SupplierOrder supplierOrder){
		ModelAndView mv = new ModelAndView();
		boolean flag = haqService.addSupplierOrder(supplierOrder);
		if(flag){
			mv.setViewName("redirect:showMSupplierOrder");
		}else{
			mv.setViewName("redirect:showAddMSupplierOrder");
		}
		return mv;
	}
}
