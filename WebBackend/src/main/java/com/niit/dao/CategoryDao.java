package com.niit.dao;

import java.util.List;

import com.niit.model.Category;



public interface CategoryDao {

	
	public List<Category> listCategory();
	
	public void addCategory(Category category);
	
	public Category getCategoryById(int id);
	
	public void deleteCategory(int id);
	
	public void updateCategory(Category category);
	
	
}
