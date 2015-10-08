package com.maybo.test;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.maybo.dao.SecDao;
import com.maybo.model.Sec;

public class SecDaoTest {
	private static SecDao secDao;
	private static ClassPathXmlApplicationContext ctx;

	static {
		// 加载spring配置文件
		ctx = new ClassPathXmlApplicationContext("classpath:conf/beans.xml");
		secDao = (SecDao) ctx.getBean("secDao");// 得到secDao层
	}

	@Test
	public void test() {
		System.out.println("Hello world!");
	}

	@Test // 查找测试
	public void findByIdTest() {
		Sec sec = secDao.findSecById(6);
		System.out.println(sec.toString());
	}

	@Test // 添加测试
	public void addSecDao() {
		Sec sec = new Sec();
		sec.setSec_name("sec_name");
		sec.setSec_code("sec_code");
		sec.setUpdate_time(new Date());
		sec.setPrice(120);
		secDao.addSec(sec);
	}

	// 更新测试
	@Test
	public void updateSecDao() {
		Sec sec = new Sec();
		sec.setSec_name("sec_name1");
		sec.setSec_code("sec_code1");
		sec.setUpdate_time(new Date());
		sec.setPrice(120);
		sec.setId(6);
		secDao.updateSec(sec);
	}

	// 删除
	@Test
	public void delSecDao() {
		secDao.delSecById(6);
	}
}
