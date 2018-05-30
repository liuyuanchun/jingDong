package service;

import java.util.List;

import entity.BigType;
import entity.SmallType;

public interface TypeService {
	public List<BigType> searchAllType(); 
	
	public List<SmallType> searchSTypeBybId(int bId);
	
	public boolean insertBType(String bName);
	
	public boolean insertSType(int bId,String sName);
	
	public boolean deleteSType(int sId);
	
	public boolean modifySType(int sId,String nsName);
}
