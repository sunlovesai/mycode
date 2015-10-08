package com.maybo.service.impl;
/**
 * @author 赛
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.maybo.dao.UserInfor;
import com.maybo.model.User;
import com.maybo.service.IUserService;

public class UserServiceImpl implements IUserService {

	@Autowired
	private UserInfor userInfor;
	
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			user = userInfor.findUserById(userId);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("--userserviceimpl--异常--"+e.toString());
		}
		return user;
	}

	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		List<User> users = null;
		try {
			users = userInfor.findAllUser();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}

	@Transactional
	public void deleteUserById(int userId) {
		// TODO Auto-generated method stub
		userInfor.deleteUserById(userId);
	}

	@Transactional
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userInfor.addUser(user);
	}

	@Transactional
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userInfor.updateUser(user);
	}

}
