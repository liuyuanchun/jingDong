package entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class Pro implements Serializable{

	private static final long serialVersionUID = -8787066765522171071L;
	
	private String id;
	
	private String proName;
	
	private String proCode;
	
	private BigDecimal proPrice;
	
	private String supplierId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}


	public BigDecimal getProPrice() {
		return proPrice;
	}

	public void setProPrice(BigDecimal proPrice) {
		this.proPrice = proPrice;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	

}
