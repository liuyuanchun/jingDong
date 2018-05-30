package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import service.CartService;
import service.OrderService;
import util.MakeOrderNum;

import entity.Cart;
import entity.Order;
import entity.User;
@Controller
public class OrderController {
	@Autowired
	CartService cs;
	@Autowired 
	OrderService os;
	/**
	 * 提交订单到达支付页
	 * @param proIdArray
	 * @param price
	 * @param request
	 * @return
	 */
	@RequestMapping(value="submitOrder")
	public ModelAndView submitOrder(String proIdArray,Double price,String no,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		MakeOrderNum mn = new MakeOrderNum();
		String orderNumber =mn.makeOrderNum();
		if(proIdArray!= null&&price==null){
			List<Cart> proList = new ArrayList<Cart>();
			Double allPrice =0.0;
			User user = (User)request.getSession().getAttribute("user");
			if(user != null){
				String[] proIdlist = proIdArray.split(",");
				for(int i = 0; i < proIdlist.length;i++){
					int proId = Integer.parseInt(proIdlist[i]);
					Cart cart = cs.searchCartById(proId, user.getId());
					allPrice += cart.getCount();
					proList.add(cart);
				}
			} 
		
			//获取当前系统时间并进行初始化
			SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String ndate = df1.format(date);
			//将总价钱格式化
			DecimalFormat df = new DecimalFormat("0.00");
			allPrice = Double.valueOf(df.format(allPrice));
			boolean flag = os.submitOrder(proList, orderNumber,allPrice,ndate); 
			if(flag){
				mv.setViewName("order/payOrder");
				mv.addObject("allPrice", allPrice);
				mv.addObject("proList", proList);
				mv.addObject("orderNumber", orderNumber);
			}
			return mv;
		}else {
			mv.setViewName("order/payOrder");
			mv.addObject("orderNumber", no);
			mv.addObject("allPrice", price);
			return mv;
		}
	}
	/**
	 * 查看订单页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="showOrder")
	public ModelAndView showOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("order/showOrder");
		User user = (User)request.getSession().getAttribute("user");
		List<Order> orderlist = os.searchAllOrder(user.getId());
		mv.addObject("orderlist", orderlist);
		return mv;
	}
	/**
	 * 删除订单
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="deleteOrder")
	public ModelAndView deleteOrder(Integer id,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("order/showOrder");
		os.deleteOrder(id);
		User user = (User)request.getSession().getAttribute("user");
		List<Order> orderlist = os.searchAllOrder(user.getId());
		mv.addObject("orderlist", orderlist);
		return mv;
	}
	/**
	 * 成功支付的处理
	 * @return
	 */
	@RequestMapping(value="successPay")
	public ModelAndView successPay(String no){
		ModelAndView mv = new ModelAndView();
		os.updateStatusOfOrder(no);
		mv.setViewName("redirect:showOrder");
		return mv;
	}
	/**
	 * 后台管理人员查看订单
	 * @param request
	 * @return
	 */
	@RequestMapping(value="showMOrder")
	public ModelAndView showMOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("manage/order/showOrder");
		List<Order> orderlist = os.searchAllOrders();
		mv.addObject("orderlist", orderlist);
		return mv;
	}
	/**
	 * 管理人员发货
	 * @param request
	 * @return
	 */
	@RequestMapping(value="sendMOrder")
	public void sendMOrder(int orderId,HttpServletResponse response){
		os.updateSendOrderOfOrder(orderId);
		try {
			PrintWriter out = response.getWriter();
			out.print("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
