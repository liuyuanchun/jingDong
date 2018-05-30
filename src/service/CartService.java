package service;

import java.util.List;

import entity.Cart;

public interface CartService {
	public List<Cart> searchAllCart(int userId);
	
	public boolean addToCart(Cart cart);
	
	public boolean deleteFromCart(int proId,int userId);
	
	public boolean updateToCart(Cart cart);
	
	public Cart searchCartById(int pId,int uId);
}
