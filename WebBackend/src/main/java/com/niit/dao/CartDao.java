package com.niit.dao;

import java.util.List;

import com.niit.model.Cart;

public interface CartDao {

	public void addCart(Cart cart);
	 public void updateCart(Cart cart);
	 public void deleteCart(int cartItemId);
	 public Cart getSingleCartItem(int cartItemId);
	 public List<Cart> retrieveCart(String user);
	 public Cart getCartExistItem(int productid,String name);
	 public void deleteUserCart(String user);
}
