package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.RegistrationForm;

@Repository("registrationFormDaoImpl")
@Transactional
public class RegistrationFormDaoImp  implements RegistrationFormDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void createUser(RegistrationForm registrationForm) 
	{
		sessionFactory.getCurrentSession().save(registrationForm);
	}
	public void updateUser(RegistrationForm registrationForm) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(registrationForm);
	}
	public void deleteUser(String email) 
	{
		Query query=sessionFactory.getCurrentSession().createQuery("delete from RegistrationForm where email= :email");
		query.setString("email", email);
		query.executeUpdate();
	}
	public RegistrationForm getUser(String email)
	{
		RegistrationForm registrationForm=sessionFactory.getCurrentSession().get(RegistrationForm.class,email);
		return registrationForm;
	}
	public List<RegistrationForm> retrieveUser() {
		Query query=sessionFactory.getCurrentSession().createQuery("from RegistrationForm");
		List<RegistrationForm> list=query.list();
		return list;
	}
}
