package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MainDao {
	public List<String> searchReCi(@Param(value="text")String text);
}
