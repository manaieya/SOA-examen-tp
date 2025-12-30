package com.projet.service;


import java.util.Map;

import com.projet.entity.Person;

public interface PersonService {
	  public Map<String, Object> addPerson(Person p);
	  public boolean deletePerson(long id);
	  public Map<String, Object> updatePerson(Person p);
	  public Map<String, Object> getPersonById(long id);
	  public Map<String, Object> getAllPersons();
}
