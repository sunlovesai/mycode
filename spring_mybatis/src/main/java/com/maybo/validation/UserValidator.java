package com.maybo.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.maybo.model.User;

/**
 * 
 * @author xueshusai
 * @date   2015年10月2日
 */
public class UserValidator implements Validator{

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return User.class.equals(arg0);
	}

	public void validate(Object arg0, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "username", null, "username is empty.");
		User user = (User)arg0;
		if(null == user.getUserName() || "".equals(user.getUserName())){
			errors.rejectValue("username", null, "username is empty.");
		}
		if(null == user.getPassword() || "".equals(user.getPassword())){
			errors.rejectValue("password", null, "password is empty");
		}
	}

}
