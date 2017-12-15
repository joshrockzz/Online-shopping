package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Supplier;

@Repository("supplierDao")
@Transactional
public class SupplierDaoImp implements SupplierDao

{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Supplier> listSupplier() {

		return (List<Supplier>) sessionFactory.getCurrentSession().createCriteria(Supplier.class).list();
	}

	@Override
	public void addSupplier(Supplier supplier) {

		sessionFactory.getCurrentSession().save(supplier);

	}

	@Override
	public Supplier getSupplierById(int id) {

		return sessionFactory.getCurrentSession().get(Supplier.class, id);
	}

	@Override
	public void updateSupplier(Supplier supplier) {

		sessionFactory.getCurrentSession().update(supplier);

	}

	@Override
	public void deleteSupplie(int id) {
		Query query = sessionFactory.getCurrentSession().createQuery("delete from Supplier where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();

	}

}
