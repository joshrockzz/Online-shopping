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
import com.niit.dao.SupplierDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierDao supplierDao;

	
	public void refreshSupplierSession(HttpSession hs,Model m)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		hs.removeAttribute("supplierList");
		List<Supplier> list=supplierDao.listSupplier();
		hs.setAttribute("supplierList", list);
	}
	
	@RequestMapping(value="/addsupplier")
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier,Model m,HttpSession hs)
	{
		supplierDao.addSupplier(supplier);;
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "added");
		refreshSupplierSession(hs,m);
	return "admincontrol";
	}
	@RequestMapping(value="/deletesupplier{id}")
	public String deleteSupplier(@PathVariable("id") int id,Model m,HttpSession hs)
	{
		supplierDao.deleteSupplie(id);;
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "deleted");
		refreshSupplierSession(hs,m);
	return "admincontrol";
	}
	

@RequestMapping(value="/updatesupplier{id}",method=RequestMethod.GET)
public String updateSupplier(@PathVariable("id") int id,Model m,HttpSession hs)
{
	refreshSupplierSession(hs,m);
	Supplier supplier=supplierDao.getSupplierById(id);
	m.addAttribute("supplier", supplier);
	m.addAttribute("status", "update");
	return "admincontrol";
}

	@RequestMapping(value="/updatesupplierdata")
	public String updateCategoryData(@ModelAttribute("supplier") Supplier supplier,Model m,HttpSession hs)
	{
		supplierDao.updateSupplier(supplier);
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "updated");
		refreshSupplierSession(hs,m);
		return "admincontrol";
	}
	
}
