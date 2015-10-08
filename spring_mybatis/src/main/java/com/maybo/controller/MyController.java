package com.maybo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maybo.model.Person;
import com.maybo.service.IPersonService;

@Controller
@RequestMapping("/demo")
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	@Autowired
	private IPersonService personService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(@RequestParam(value = "id") int id, Model model) {
		Person p = personService.find(id);
		logger.debug(p.toString());
		model.addAttribute("p", p);
		return "test";
	}

	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	@ResponseBody
	public Person test1(@RequestParam(value = "id") int id, Model model) {
		Person p = personService.find(id);
		logger.debug(p.toString());
		return p;
	}
}
