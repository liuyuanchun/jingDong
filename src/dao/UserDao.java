package dao;

import java.util.List;


import entity.User;

public interface UserDao {
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public boolean addUser(User user);
	/**
	 * 通过用户名和密码查询用户信息
	 * @param username
	 * @param password
	 * @return
	 */
	public User doLogin(User user);
	/**
	 * 查询所有用户的信息
	 * @return
	 */
	public List<User> selectAllUser(); 
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);
}
