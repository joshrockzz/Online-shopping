package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Category;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImp implements CategoryDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addCategory(Category category) {

		sessionFactory.getCurrentSession().persist(category);

	}

	@Override
	public Category getCategoryById(int id) {

		return sessionFactory.getCurrentSession().get(Category.class, id);
	}

	@Override
	public void updateCategory(Category category) {

		sessionFactory.getCurrentSession().update(category);

	}

	@Override
	public List<Category> listCategory() {

		return (List<Category>) sessionFactory.getCurrentSession().createCriteria(Category.class).list();

	}

	@Override
	public void deleteCategory(int id) {

		Query query = sessionFactory.getCurrentSession().createQuery("delete from Category where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
	}

}
