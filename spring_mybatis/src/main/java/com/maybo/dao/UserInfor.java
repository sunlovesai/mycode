package com.maybo.dao;

import java.util.List;

import com.maybo.model.User;

/**
 * 
 * @author xueshusai
 * @date 2015年10月2日
 */
public interface UserInfor {

	public User findUserById(int userId);

	public List<User> findAllUser();

	public void deleteUserById(int userId);

	public void addUser(User user);

	public void updateUser(User user);

}
