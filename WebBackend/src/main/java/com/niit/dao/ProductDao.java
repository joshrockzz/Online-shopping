package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {

	public void addProduct(Product product);
	
	public List<Product> listProduct();
	
	public Product getProductById(int id);
	
	public void deleteProduct(int id);
	
	public void updateProduct(Product product);
	
	public List<Product> listProductByCategory(int id);

}
