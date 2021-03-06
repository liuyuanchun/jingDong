package service;

import java.util.List;

import entity.Pro;
import entity.Supplier;
import entity.SupplierOrder;
import entity.User;

public interface HaqService {
	/**
	 * 用户信息修改-根据用户编码获取用户实体类对象信息
	 * @param userId
	 * @return user
	 * @author haq
	 * @time 2018年5月6日17:41:48
	 */
	public User getUserInfoById(String userId);
	
	/**
	 * 用户信息修改-点击保存按钮 修改用户信息
	 * @param user
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	public boolean modifyUserInfo(User user);
	
	/**
	 * 用户信息删除
	 * @param userId
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日19:32:22
	 */
	public boolean deleteUserById(String userId);
	
	/**
	 * 根据用户名或电话号码查询用户信息
	 * @param user
	 * @return list
	 * @author haq
	 * @time 2018年5月8日20:42:18
	 */
	public List<User> searchUserForManage(User user);
	
	/**
	 * 获取供应商列表
	 * @param supplier
	 * @return list
	 * @author haq
	 * @time 2018年5月10日21:03:07
	 */
	public List<Supplier> getListForSupplier(Supplier supplier);
	
	public Supplier getDTOForSupplier(Supplier supplier);
	
	/**
	 * 供应商信息修改-点击保存按钮 修改用户信息
	 * @param user
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	public boolean doSupplierModify(Supplier supplier);
	
	/**
	 * 供应商信息删除
	 * @param user
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	public boolean deleteSupplierById(Supplier supplier);
	
	/**
	 * 供应商信息新增
	 * @param user
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	public boolean addSupplier(Supplier supplier);
	
	/**
	 * TODO 供应商订货信息	
	 * @param supplierOrder
	 * @return list
	 * @time 2018年5月13日21:38:22
	 */
	public List<SupplierOrder> getListForSupplierOrder(SupplierOrder supplierOrder);
	
	public SupplierOrder getDTOFotSupplierOrder(SupplierOrder supplierOrder);
	
	public boolean doSupplierOrderModify(SupplierOrder supplierOrder);
	
	/**
	 * 供应商信息删除
	 * @param user
	 * @return boolean
	 * @author haq
	 * @time 2018年5月6日18:55:54
	 */
	public boolean deleteSupplierOrderById(SupplierOrder supplierOrder);
	
	public List<Pro> getListForPro();
	
	public boolean addSupplierOrder(SupplierOrder supplierOrder);

}
