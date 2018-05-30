package service;

import java.util.List;

import entity.Product;

public interface ProductService {
	public List<Product> searchAll();
	
	public List<Product> searchPage(Integer page);
	
	public List<Product> searchByCondition(Product condition,Integer page);
	
	public List<Product> searchAllBysId(Integer sId);
	
	public List<Product> searchAllBybId(Integer bId);
	
	public List<Product> searchBysId(Integer sId,Integer page);
	
	public List<Product> searchBybId(Integer bId,Integer page);
	
	public Product searchById(Integer proId);
	
	public boolean addProduct(Product product);
	
	public int searchCountByCondition(Product condition);
	
	public boolean deleteProductByproId(Integer proId);
	
	public boolean updateProduct(Product product);
}
