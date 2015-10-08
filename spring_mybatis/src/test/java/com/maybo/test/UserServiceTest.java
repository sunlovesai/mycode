package com.maybo.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.maybo.model.User;
import com.maybo.service.IUserService;

/**
 * 
 * @author xueshusai
 * @date 2015年10月2日
 */
public class UserServiceTest {

	private static ClassPathXmlApplicationContext ctx;
	private static IUserService userService;

	static {
		ctx = new ClassPathXmlApplicationContext("classpath:conf/beans.xml");
		userService = (IUserService) ctx.getBean("userService");
		System.out.println("--ctx--" + ctx);
		System.out.println("--userService--" + userService);
	}

	@Test
	public void test() {
		System.out.println("--ceshi--");
	}

	@Test
	public void findUserByIdTest() {
		User user = userService.findUserById(1);
		System.out.println("---user---" + user.toString());
	}
	
	@Test
	public void findAllUserTest(){
		List<User> users = userService.findAllUser();
		for(int i = 0; i < users.size(); i++){
			User user = users.get(i);
			System.out.println("--i--"+user.toString());
		}
	}
	
	@Test
	public void addUserTest(){
		User user = new User();
	//	user.setUserId(4);
		user.setUserName("ixue105");
		user.setPassword("654321");
		userService.addUser(user);
	}
	
	@Test
	public void deleteUserTest(){
		userService.deleteUserById(9);
	}
	
	@Test
	public void updateUserTest(){
		User user = new User();
		user.setUserId(10);
		user.setUserName("ixuess");
		user.setPassword("15507526881");
		userService.updateUser(user);
	}
}
