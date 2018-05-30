package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

import entity.User;
import service.UserService;
import util.CreateMD5;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao ud;
	public boolean addUser(User user) {
		//添加用户时 给密码进行加密
		user.setPassword(CreateMD5.getMd5(user.getPassword()));
		return ud.addUser(user);
	}
	public User doLogin(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(CreateMD5.getMd5(password));
		return ud.doLogin(user);
	}
	public List<User> selectAllUser() {
		
		return ud.selectAllUser();
	}
	public boolean updateUser(User user) {
		user.setPassword(CreateMD5.getMd5(user.getPassword()));
		return ud.updateUser(user);
	}

}
