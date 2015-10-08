package com.maybo.dao;

import com.maybo.model.Person;

public interface PersonDao {
public Person findPerson(int id);
public void addPerson(Person p);
}
