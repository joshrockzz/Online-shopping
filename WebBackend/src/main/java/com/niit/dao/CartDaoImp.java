package com.niit.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Cart;

@Repository("cartDao")
@Transactional
public class CartDaoImp implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addCart(Cart cart) {
		sessionFactory.getCurrentSession().save(cart);

	}

	public void updateCart(Cart cart) {

		sessionFactory.getCurrentSession().saveOrUpdate(cart);
	}

	public void deleteCart(int cartItemId) {

		Query query = sessionFactory.getCurrentSession().createQuery("delete from Cart where cartItemId= :cartItemId");
		query.setInteger("cartItemId", cartItemId);
		query.executeUpdate();
	}

	public Cart getSingleCartItem(int cartItemId) {

		Cart cart = sessionFactory.getCurrentSession().get(Cart.class, cartItemId);
		return cart;
	}

	public List<Cart> retrieveCart(String user) {

		Query query = sessionFactory.getCurrentSession().createQuery("from Cart where username=:user");
		query.setString("user", user);
		List<Cart> list = query.list();
		return list;
	}

	public Cart getCartExistItem(int productid, String name) {

		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Cart.class);
		criteria.add(Restrictions.eq("productId", productid));
		criteria.add(Restrictions.eq("username", name));
		Cart cart = (Cart) criteria.uniqueResult();

		return cart;
	}

	@Override
	public void deleteUserCart(String user) {
		Query query = sessionFactory.getCurrentSession().createQuery("delete from Cart where username= :user");
		query.setString("user", user);
		query.executeUpdate();
		
	}

}
