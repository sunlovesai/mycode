package com.maybo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maybo.dao.PersonDao;
import com.maybo.model.Person;
import com.maybo.service.IPersonService;
@Service("personService")
public class PersonServiceImpl implements IPersonService {
	@Autowired
	private PersonDao personDao;
	@Transactional
public void add(Person p1,Person p2){
	personDao.addPerson(p1);
	personDao.addPerson(p2);
	
}
	public Person find(int id){
		return personDao.findPerson(id);
	}
}
