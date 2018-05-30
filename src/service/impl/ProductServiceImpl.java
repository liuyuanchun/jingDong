package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ProductService;

import dao.ProductDao;

import entity.Product;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDao pd; 
	public List<Product> searchAll(){
		return pd.searchAll(null);
	}
	
	public List<Product> searchAllBysId(Integer sId) {
		
		return pd.searchAllBysId(sId, null);
	}
	
	public List<Product> searchAllBybId(Integer bId) {
		
		return pd.searchAllBybId(bId,null);
	}

	public boolean addProduct(Product product) {
		
		return pd.addProduct(product);
	}

	public List<Product> searchByCondition(Product condition,Integer page) {
		
		return pd.searchByCondition(condition,page);
	}

	public int searchCountByCondition(Product condition) {
		
		return pd.searchCountByCondition(condition);
	}

	public boolean deleteProductByproId(int proId) {
		
		return pd.deleteProductByproId(proId);
	}

	public boolean updateProduct(Product product) {
		
		return pd.updateProduct(product);
	}

	public List<Product> searchPage(Integer page) {

		return pd.searchAll(page);
	}


	public List<Product> searchBysId(Integer sId, Integer page) {
		// TODO Auto-generated method stub
		return pd.searchAllBysId(sId, page);
	}

	public List<Product> searchBybId(Integer bId, Integer page) {
		// TODO Auto-generated method stub
		return pd.searchAllBybId(bId, page);
	}

	public Product searchById(Integer proId) {
		// TODO Auto-generated method stub
		return pd.searchById(proId);
	}

	public boolean deleteProductByproId(Integer proId) {
		// TODO Auto-generated method stub
		return pd.deleteProductByproId(proId);
	}

}
