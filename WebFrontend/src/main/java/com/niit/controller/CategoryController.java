package com.niit.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class CategoryController 
{
	@Autowired
	CategoryDao categroyDao;
	
	public void refreshCategorySession(HttpSession hs,Model m)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		hs.removeAttribute("categoryList");
		List<Category> list=categroyDao.listCategory();
		hs.setAttribute("categoryList", list);
	}
	
	@RequestMapping(value="/addcategory")
	public String addCategoryOpreation(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.addCategory(category);
		refreshCategorySession(hs,m);
	return "admincontrol";
	}
	@RequestMapping(value="/deleteCategory{id}")
	public String deleteCategoryOpreation(@PathVariable("id") int id,Model m,HttpSession hs)
	{
		categroyDao.deleteCategory(id);
		refreshCategorySession(hs,m);
	return "admincontrol";
	}
	

@RequestMapping(value="/updateCategory{id}",method=RequestMethod.GET)
public String updateCategoryOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	refreshCategorySession(hs,m);
	Category category=categroyDao.getCategoryById(id);
	return "admincontrol";
}

	@RequestMapping(value="/updateCategoryData")
	public String updateCategoryData(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.updateCategory(category);
		refreshCategorySession(hs,m);
		return "admincontrol";
	}
	
}

