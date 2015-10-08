package com.maybo.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.maybo.model.Sec;

public class SecValidator implements Validator {

	//是否支持sec这个类
	public boolean supports(Class<?> arg0) {
		return Sec.class.equals(arg0);
	}

	public void validate(Object obj, Errors errors) {
		// 如果为空，则拒绝
		ValidationUtils.rejectIfEmpty(errors, "sec_name", null, "sec_name is empty.");

		Sec sec = (Sec) obj;
		/**
		 * 对象调用方法写在后面避免空指针异常
		 */
		if (null == sec.getSec_code() || "".equals(sec.getSec_code())) {
			errors.rejectValue("sec_code", null, "sec_code is empty.");
		}
		if (null == sec.getSec_name() || "".equals(sec.getSec_name())) {
			errors.rejectValue("sec_name", null, "sec_name is empty.");
		}
	}

}
