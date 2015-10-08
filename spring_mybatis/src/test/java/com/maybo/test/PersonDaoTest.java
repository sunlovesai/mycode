package com.maybo.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.maybo.dao.PersonDao;
import com.maybo.model.Person;
import com.maybo.service.IPersonService;

public class PersonDaoTest {

	@Test
	public void test() {
		   ApplicationContext ctx=null;
		           ctx=new ClassPathXmlApplicationContext("classpath:conf/beans.xml");
		           PersonDao personDao=(PersonDao) ctx.getBean("personDao");
		         System.out.println(personDao.findPerson(1).toString());
		      /*  IPersonService personService=(IPersonService)ctx.getBean("personService");
		           Person p1=new Person();
		           p1.setAge(12);
		           p1.setId(3);
		           p1.setUserName("gfhh");
		           Person p2=new Person();
		           p2.setAge(12);
		           p2.setId(4);
		           p2.setUserName("sdgh");
		           personService.add(p1, p2);*/
	}

}
