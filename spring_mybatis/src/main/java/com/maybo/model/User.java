package com.maybo.model;

/**
 * 
 * @author xueshusai
 * @date   2015年10月2日
 */
import java.util.Date;

public class User {

	/**
	 * id: userId 自增 username:用户名 password:用户密码 registerDate:注册时间
	 */
	private int userId;
	private String userName;
	private String password;
	private String registerDate;

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", registerDate="
				+ registerDate + "]";
	}

	/*
	 * @Override public String toString() { // TODO Auto-generated method stub
	 * return super.toString(); }
	 */

}
