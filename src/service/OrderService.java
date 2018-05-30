package service;

import java.util.List;

import entity.Cart;
import entity.Order;


public interface OrderService {
	public boolean submitOrder(List<Cart> cart,String OrderNumber,double money,String date);
	
	public List<Order> searchAllOrder(int uId);
	
	public List<Order> searchAllOrders();
	
	public boolean deleteOrder(int orderId);
	
	public boolean updateStatusOfOrder(String no);
	
	public boolean updateSendOrderOfOrder(int orderId);
	
}
