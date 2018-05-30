package service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;
import dao.ProductDao;

import entity.Cart;
import entity.Product;
import service.CartService;
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDao cd;
	@Autowired
	ProductDao pd;
	public List<Cart> searchAllCart(int userId) {
		
		return cd.searchAllCart(userId);
	}
	
	public boolean addToCart(Cart cart) {
		if(cd.searchCartById(cart.getpId(),cart.getuId())==null){
			DecimalFormat df = new DecimalFormat("0.00");
			Product product = pd.searchById(cart.getpId());
			double count = cart.getNum() * product.getPrice();
			cart.setCount(Double.parseDouble(df.format(count)));
			return cd.addToCart(cart);
		}else{
			DecimalFormat df = new DecimalFormat("0.00");
			Cart oldCart = cd.searchCartById(cart.getpId(),cart.getuId());
			int num = cart.getNum() + oldCart.getNum();
			double count = num * oldCart.getProduct().getPrice();
			cart.setNum(num);
			cart.setCount(Double.parseDouble(df.format(count)));
			return cd.updateToCart(cart);
		}
	}

	public boolean deleteFromCart(int proId,int userId) {
		
		return cd.deleteFromCart(proId,userId);
	}

	public boolean updateToCart(Cart cart) {
		
		return cd.updateToCart(cart);
	}

	public Cart searchCartById(int pId,int uId) {
		
		return cd.searchCartById(pId,uId);
	}

}
