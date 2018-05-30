package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;

import dao.CartDao;
import dao.OrderDao;
import entity.Cart;
import entity.Order;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao od;
	@Autowired 
	CartDao cd;
	public boolean submitOrder(List<Cart> cart,String orderNumber,double money,String date) {
		Order order = new Order();
		order.setNo(orderNumber);
		order.setuId(cart.get(0).getuId());
		order.setMoney(money);
		order.setStatus("未付款");
		order.setDate(date);
		boolean flag = false;
		//在订单表中添加订单
		boolean flag1 = od.addOrder(order);
		//删除购物车中的物品
		boolean flag2= true;
		for(int i= 0; i< cart.size();i++){
			flag2 = cd.deleteFromCart(cart.get(i).getpId(), cart.get(i).getuId());
			
			if(flag2 == false){
				break;
			}
		}
		//通过订单号查找订单
		Order order1 = od.searchOrderByOrderNo(orderNumber);
		//在订单-商品关系表中添加所生成订单的信息
		boolean flag3=true;
		for(int i= 0; i< cart.size();i++){
			flag3 = od.addOrderAndPro(order1.getId(), cart.get(i).getpId(),cart.get(i).getNum());
		}
		
		if(flag1&&flag2&&flag3){
			flag = true;
		}
		return flag;
	}
	public List<Order> searchAllOrder(int uId) {
		
		return od.searchAllOrder(uId);
	}
	
	public List<Order> searchAllOrders(){
		return od.searchAllOrders();
	}
	public boolean deleteOrder(int orderId) {
		boolean flag1 = od.deleteOrder(orderId);
		boolean flag2 = od.deleteMofOP(orderId);
		if(flag1&&flag2){
			return true;
		}else{
			return false;
		}
	}
	public boolean updateStatusOfOrder(String no) {
		
		return od.updateStatusOfOrder(no);
	}
	public boolean updateSendOrderOfOrder(int orderId) {
		
		return od.updateSendOrderOfOrder(orderId);
	}

}
