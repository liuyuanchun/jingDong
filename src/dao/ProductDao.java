package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Product;

public interface ProductDao {
	
	public List<Product> searchAll(@Param(value="page") Integer page);
	
	public List<Product> searchByCondition(@Param(value="condition")Product condition,@Param(value="page")int page);
	
	public int searchCountByCondition(@Param(value="condition")Product condition);
	
	public List<Product> searchAllBysId(@Param(value="sId")int sId,@Param(value="page") Integer page);
	
	public List<Product> searchAllBybId(@Param(value="bId")int bId,@Param(value="page") Integer page);
	
	public Product searchById(@Param(value="proId")Integer proId);
	
	public boolean addProduct(Product product);
	
	public boolean deleteProductByproId(@Param(value="proId") Integer proId);
	
	public boolean updateProduct(Product product);
	
	public boolean updateSTOfPro(@Param(value="sId")Integer sId);
	
}
