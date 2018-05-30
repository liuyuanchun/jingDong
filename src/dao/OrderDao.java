package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;

public interface OrderDao {
	public boolean addOrder(Order order);
	
	public Order searchOrderByOrderNo(@Param(value="no")String orderNumber);
	
	public boolean addOrderAndPro(@Param(value="oId")int oId,@Param(value="pId")int pId,@Param(value="num")int num);
	
	public List<Order> searchAllOrder(@Param(value="uId")int uId);
	
	public List<Order> searchAllOrders();
	
	public boolean deleteOrder(@Param(value="orderId")int orderId);
	
	public boolean deleteMofOP(@Param(value="orderId")int orderId);
	
	public boolean updateStatusOfOrder(@Param(value="no")String no);
	
	public boolean updateSendOrderOfOrder(@Param(value="orderId")int orderId);
}
