package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Product;

@Repository("productDao")
@Transactional
public class ProductDaoImp implements ProductDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addProduct(Product product) {

		sessionFactory.getCurrentSession().save(product);
	}

	@Override
	public List<Product> listProduct() {

		return (List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class).list();
	}

	@Override
	public Product getProductById(int id) {

		return sessionFactory.getCurrentSession().get(Product.class, id);
	}

	@Override
	public void deleteProduct(int id) {

		Query query = sessionFactory.getCurrentSession().createQuery("delete from Product where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();

	}

	@Override
	public void updateProduct(Product product) {

		sessionFactory.getCurrentSession().update(product);

	}

	@Override
	public List<Product> listProductByCategory(int id) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Product where categoryId= :catid");
		query.setInteger("catid", id);
		List<Product> list = query.list();
		return list;

	}

}
