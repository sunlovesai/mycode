package com.maybo.service;

import java.util.List;

import com.maybo.model.User;

/**
 * 
 * @author xueshusai
 * @date   2015年10月2日
 */
public interface IUserService {

	public abstract User findUserById(int userId);
	public abstract List<User> findAllUser();
	public abstract void deleteUserById(int userId);
	public abstract void addUser(User user);
	public abstract void updateUser(User user);
}
