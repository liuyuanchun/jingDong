package entity;

import java.util.List;

public class BigType {
	private Integer id;
	private String name;
	private List<SmallType> smallType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<SmallType> getSmallType() {
		return smallType;
	}
	public void setSmallType(List<SmallType> smallType) {
		this.smallType = smallType;
	}
	
}
