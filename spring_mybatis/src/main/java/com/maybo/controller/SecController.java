package com.maybo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maybo.model.Person;
import com.maybo.model.Sec;
import com.maybo.service.ISecService;
import com.maybo.validation.SecValidator;

@Controller
@RequestMapping("/sec")
public class SecController {
	// 日志记录
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	@Autowired
	private ISecService secService;

	@InitBinder
	public void initBinder(DataBinder binder) {
		binder.setValidator(new SecValidator());
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	@ResponseBody
	// 获取sec信息
	public Sec find(@RequestParam(value = "id") int id) {
		Sec sec = null;
		sec = secService.findById(id);
		if (null == sec) {
			return new Sec();
		}
		logger.debug(sec.toString());
		return sec;
	}

	@RequestMapping(value = "/findAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Sec> findAll() {
		List<Sec> secs = null;
		secs = secService.findAllSec();
		if (null == secs) {
			return new ArrayList<Sec>();
		}
		logger.debug(secs.toString());
		return secs;
	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	@ResponseBody
	// 删除sec信息
	public int del(@RequestParam(value = "id") int id) {
		int status = 0;
		try {
			secService.deById(id);
			status = -1;
		} catch (Exception e) {
			status = -2;
		}
		return status;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseBody
	// 修改
	public int update(@Validated Sec sec, BindingResult result) {
		int status = 0;
		if (result.hasErrors()) {
			return -3;
		}
		sec.setUpdate_time(new Date());
		logger.debug(sec.toString());
		try {
			secService.updateSec(sec);
			status = -1;
		} catch (Exception e) {
			status = -2;
		}
		return status;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	// 添加sec信息
	public int add(@Validated Sec sec, BindingResult result) {
		int status = 0;
		sec.setUpdate_time(new Date());
		if (result.hasErrors()) {
			return -3;
		}
		try {
			secService.addSec(sec);
			status = -1;
		} catch (Exception e) {
			status = -2;
		}
		return status;
	}
}
