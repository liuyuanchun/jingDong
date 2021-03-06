package entity;

import java.io.Serializable;

public class Supplier implements Serializable{

	private static final long serialVersionUID = -922606262078093085L;
	
	private String id;
	
	private String supplierName;
	
	private String supplierCode;
	
	private String supplierType;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}

	public String getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(String supplierType) {
		this.supplierType = supplierType;
	}
	
	

}
