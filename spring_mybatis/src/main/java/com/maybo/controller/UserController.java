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
		user = mIUserService.findUserById(id);
		if (null == user) {
			return new User();
		}
		System.out.println("-UserController--");
		return user;
	}
	
	@RequestMapping(value = "/findAll", method = RequestMethod.GET)
	@ResponseBody
	public List<User> findAllUser(){
		List<User> users = null;
		users = mIUserService.findAllUser();
		if(null == users){
			return new ArrayList<User>();
		}
		return users;
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	@ResponseBody
	public int deleteUserById(@RequestParam(value = "userId")int id){
		int status = 0;
		try {
			mIUserService.deleteUserById(id);
			status = -1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = -2;
		}
		
		return status;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseBody
	public int updateUser(@Validated User user, BindingResult result){
		int status = 0;
		if(result.hasErrors()){
			return -3;
		}
//		user.setRegisterDate(new Date());
		user.setRegisterDate(DateHelper.getCurrentDate());
		try {
			mIUserService.updateUser(user);
			status = 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = -1;
		}
		return status;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public int addUser(@Validated User user, BindingResult result){
		int status = 0;
//		user.setRegisterDate(new Date());
		user.setRegisterDate(DateHelper.getCurrentDate());
		if(result.hasErrors()){
			 return -1;
		}
		try {
			mIUserService.addUser(user);
			status = 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = 2;
		}
		return status;
	}
}
