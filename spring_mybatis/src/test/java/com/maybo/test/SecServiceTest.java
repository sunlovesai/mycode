package com.maybo.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.maybo.dao.SecDao;
import com.maybo.model.Sec;
import com.maybo.service.ISecService;

public class SecServiceTest {
	private static ClassPathXmlApplicationContext ctx;
	private static ISecService secService;

	static {
		// 加载spring配置文件
		ctx = new ClassPathXmlApplicationContext("classpath:conf/beans.xml");
		System.out.println("--ctx--"+ctx);
		secService = (ISecService) ctx.getBean("secService");// 得到secDao层
	}

	@Test
	public void test() {
		System.out.println("--测试--Hello world!");
	}

	@Test // 查找测试
	public void findByIdTest() {
		Sec sec = secService.findById(1);
	//	System.out.println(sec.toString());
		System.out.println("--"+sec.getId());
	}

	@Test // 添加测试
	public void add() {
		Sec sec = new Sec();
		sec.setSec_name("sec_name");
		sec.setSec_code("sec_code");
		sec.setUpdate_time(new Date());
		sec.setPrice(120);
	//	secService.addSec(sec);
	}

	// 更新
	@Test
	public void updateSecDao() {
		Sec sec = new Sec();
		sec.setSec_name("sec_name2");
		sec.setSec_code("sec_code2");
		sec.setUpdate_time(new Date());
		sec.setPrice(150);
		sec.setId(6);
	//	secService.updateSec(sec);
	}

	// 查找所有
	@Test
	public void findAll() {

		List<Sec> secs = secService.findAllSec();
	//	System.out.println(secs.toString());
	}
}
