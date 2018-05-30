package controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Cart;
import entity.User;

import service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cs;
	
	@RequestMapping(value="showCart")
	public ModelAndView showCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("cart/cart");
		User user = (User)request.getSession().getAttribute("user");
		List<Cart> cartlist = cs.searchAllCart(user.getId());
		mv.addObject("cartlist", cartlist);
		return mv;
	}
	@RequestMapping(value="addToCart",produces="text/html;charset=utf-8")
	@ResponseBody
	public String addToCart(Integer proId,Integer nums,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user !=null){
			Cart cart = new Cart();
			cart.setuId(user.getId());
			cart.setpId(proId);
			cart.setNum(nums);
			boolean flag = cs.addToCart(cart);
			if(flag){
				return "添加成功！";
			}else{
				return "添加失败。。";
			}
		}else{
			return "noLogin";
		}
	}
	@RequestMapping(value="deleteFromCart")
	public ModelAndView deleteFromCart(Integer proId,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		cs.deleteFromCart(proId,user.getId());
		List<Cart> cartlist = cs.searchAllCart(user.getId());
		mv.addObject("cartlist", cartlist);
		mv.setViewName("redirect:showCart");
		return mv;
	}
	
	@RequestMapping(value="modifyCart")
	public ModelAndView modifyCart(Integer proId,Integer num,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		DecimalFormat df = new DecimalFormat("0.00");
		Cart cart = new Cart();
		cart.setuId(user.getId());
		cart.setpId(proId);
		cart.setNum(num);
		double price = cs.searchCartById(proId,user.getId()).getProduct().getPrice();
		double count  = price * num;
		cart.setCount(Double.parseDouble(df.format(count)));
		cs.updateToCart(cart);
		List<Cart> cartlist = cs.searchAllCart(user.getId());
		mv.addObject("cartlist", cartlist);
		return mv;
	}
	@RequestMapping(value="showAccount")
	public ModelAndView showAccount(String proIdArray,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("cart/account");
		List<Cart> proList = new ArrayList<Cart>();
		Double allPrice =0.0;
		User user = (User)request.getSession().getAttribute("user");
		if(user != null){
			proIdArray = proIdArray.substring(0,proIdArray.length()-1);
			String[] proIdlist = proIdArray.split(",");
			for(int i = 0; i < proIdlist.length;i++){
				int proId = Integer.parseInt(proIdlist[i]);
				Cart cart = cs.searchCartById(proId, user.getId());
				allPrice += cart.getCount();
				proList.add(cart);
			}
		}
		DecimalFormat df = new DecimalFormat("0.00");
		allPrice = Double.valueOf(df.format(allPrice));
		mv.addObject("allPrice", allPrice);
		mv.addObject("proList", proList);
		return mv;
	}
}
