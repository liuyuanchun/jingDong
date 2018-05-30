package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDao;
import dao.TypeDao;

import entity.BigType;
import entity.Product;
import entity.SmallType;
import service.TypeService;
@Service
public class TypeServiceImpl implements TypeService{
	@Autowired
	TypeDao td;
	@Autowired
	ProductDao pd;
	public List<BigType> searchAllType() {
		
		return td.searchAllType();
	}
	
	public List<SmallType> searchSTypeBybId(int bId) {
		
		return td.searchSTypeBybId(bId);
	}

	public boolean insertBType(String bName) {
		
		return td.insertBType(bName);
	}

	public boolean insertSType(int bId, String sName) {
		
		return td.insertSType(bId, sName);
	}

	public boolean deleteSType(int sId) {
		
		boolean flag = false;
		boolean sFlag = td.deleteSType(sId);
		List<Product> pro = pd.searchAllBysId(sId);
		boolean pFlag = false;
		if(pro.size()>0){
			pFlag = pd.updateSTOfPro(sId);
		}else{
			pFlag = true;
		}
		if(sFlag&&pFlag){
			flag = true;
		}
		return flag;
	}

	public boolean modifySType(int sId,String nsName) {
		
		return td.modifySType(sId, nsName);
	}

}
