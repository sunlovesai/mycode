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
	private String userPhone;
	private String password;
	private String registerDate;
	private String status;// 状态
	private String message;// 返回的消息

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone + ", password=" + password
				+ ", registerDate=" + registerDate + ", status=" + status + ", message=" + message + "]";
	}

	/*
	 * @Override public String toString() { // TODO Auto-generated method stub
	 * return super.toString(); }
	 */

}
