package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Cart;

public interface CartDao {
	public List<Cart> searchAllCart(@Param(value="userId")int userId); 

	public Cart searchCartById(@Param(value="pId")int pId,@Param(value="userId")int userId);
	
	public boolean updateToCart(Cart cart);
	
	public boolean addToCart(Cart cart);
	
	public boolean deleteFromCart(@Param(value="proId")int proId,@Param(value="uId")int uId);

}
