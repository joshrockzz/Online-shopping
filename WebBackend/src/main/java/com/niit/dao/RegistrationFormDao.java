package com.niit.dao;

import java.util.List;

import com.niit.model.RegistrationForm;

public interface RegistrationFormDao {

	public void createUser(RegistrationForm registrationForm);

	public void updateUser(RegistrationForm registrationForm);

	public void deleteUser(String email);

	public RegistrationForm getUser(String email);

	public List<RegistrationForm> retrieveUser();

}
