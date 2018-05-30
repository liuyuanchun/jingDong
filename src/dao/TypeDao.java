package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.BigType;
import entity.SmallType;

public interface TypeDao {
	public List<BigType> searchAllType(); 
	
	public List<SmallType> searchSTypeBybId(@Param(value="bId")int bId);
	
	public boolean insertBType(@Param(value="bName")String bName);
	
	public boolean insertSType(@Param(value="bId")int bId,@Param(value="sName")String sName);
	
	public boolean deleteSType(@Param(value="sId")int sId);
	
	public boolean modifySType(@Param(value="sId")int sId,@Param(value="nsName")String nsName);
}
