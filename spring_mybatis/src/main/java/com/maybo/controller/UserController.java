package com.maybo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maybo.model.User;
import com.maybo.service.IUserService;
import com.maybo.validation.UserValidator;
import com.xuess.util.DateHelper;

/**
 * 
 * @author xueshusai
 * @date 2015年10月2日
 */

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private IUserService mIUserService;

	@InitBinder
	public void initBinder(DataBinder binder) {
		binder.setValidator(new UserValidator());
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	@ResponseBody
	public User findUserById(@RequestParam(value = "userId") int id) {
		User user = null;
		try {
			user = mIUserService.findUserById(id);
			if (null == user) {
				user = new User();
				System.out.println("---find--user1--"+user.toString());
				user.setMessage("用户不存在");
				user.setStatus("0");
				System.out.println("---find--user2--"+user.toString());
			}else{
				user.setMessage("用户存在");
				user.setStatus("1");
				System.out.println("---find--user3--"+user.toString());
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user = new User();
			user.setMessage("用户不存在");
			user.setStatus("0");
			System.out.println("---find--user4--"+user.toString());
		}
		return user;
	}

	@RequestMapping(value = "/findAll", method = RequestMethod.GET)
	@ResponseBody
	public List<User> findAllUser() {
		List<User> users = null;
		try {
			users = mIUserService.findAllUser();
			if(null == users){
				
			}else{
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (null == users) {
			return new ArrayList<User>();
		}
		return users;
	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	@ResponseBody
	public User deleteUserById(@RequestParam(value = "userId") int id) {
		User user = new User();
		try {
			mIUserService.deleteUserById(id);
			user.setMessage("删除成功");
			user.setStatus("1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user.setMessage("删除失败");
			user.setStatus("0");
		}

		return user;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public User deleteUserPhoneByPhone(@RequestParam(value = "userPhone") String userPhone) {
		// String jsonStr1 = "{\"status\":\"1\",\"message\":\"删除成功\"}";
		// String jsonStr2 = "{\"status\":\"0\",\"message\":\"删除失败\"}";
		User user = new User();
		try {
			mIUserService.deleteUserByPhone(userPhone);
			user.setMessage("删除成功");
			user.setStatus("1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user.setMessage("删除失败");
			user.setStatus("0");
		}
		return user;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseBody
	public User updateUser(@Validated User user, BindingResult result) {
		User user1 = new User();
		if (result.hasErrors()) {
			user1.setMessage("更新失败");
			user1.setStatus("0");
			return user1;
		}
		// user.setRegisterDate(new Date());
		user.setRegisterDate(DateHelper.getCurrentDate());
		try {
			mIUserService.updateUser(user);
			user1.setMessage("更新成功");
			user1.setStatus("1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user1.setMessage("更新失败");
			user1.setStatus("0");
		}
		return user1;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public User addUser(@Validated User user, BindingResult result) {
		User user1 = new User();
		// user.setRegisterDate(new Date());
		user.setRegisterDate(DateHelper.getCurrentDate());
		if (result.hasErrors()) {
			user1.setMessage("添加失败");
			user1.setStatus("0");
			return user1;
		}
		try {
			mIUserService.addUser(user);
			user1.setMessage("添加成功");
			user1.setStatus("1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user1.setMessage("添加失败");
			user1.setStatus("0");
		}
		return user1;
	}
}
