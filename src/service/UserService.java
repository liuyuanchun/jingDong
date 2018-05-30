package service;


import java.util.List;

import entity.User;

public interface UserService {
	public boolean addUser(User user);
	
	public User doLogin(String username,String password);
	
	public List<User> selectAllUser(); 
	
	public boolean updateUser(User user);
}
