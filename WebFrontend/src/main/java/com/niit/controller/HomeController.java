package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;

import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;


@Controller
public class HomeController {

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private SupplierDao supplierDao;
	
	
	
	public void sessionInitialization(HttpSession hs)
	{
		 List<Category> categorylist=categoryDao.listCategory();
		 hs.setAttribute("categoryList", categorylist);
		 List<Supplier> supplierlist=supplierDao.listSupplier();
		 hs.setAttribute("supplierList", supplierlist);
		 List<Product> productlist=productDao.listProduct();
		 hs.setAttribute("productList", productlist);
	}

	@RequestMapping(value = { "/", "/home"})
	public ModelAndView home(HttpSession hs) {
		ModelAndView mv=new ModelAndView("home");
		sessionInitialization(hs);
		mv.addObject("title", "Home");
		return mv;
	}

	/* To display all Products */

	@RequestMapping(value = { "/allproduct" })
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("listproducts");
		mv.addObject("title", "All Products");
		mv.addObject("userClickAllProducts", true);
		/* passing list of categoey */
		
		mv.addObject("productList", productDao.listProduct());

		return mv;

	}

	@RequestMapping(value = { "/categoryproduct{id}" })
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("listproducts");

		/* categoryDao to fetch a single category */

		Category category =  categoryDao.getCategoryById(id);

		mv.addObject("title", category.getName());

		/* passing the single category object */
		mv.addObject("category", category);
		mv.addObject("userClickCategoryProducts", true);
		/* passing list of categoey */
		mv.addObject("categoryList", categoryDao.listCategory());
		mv.addObject("productList", productDao.listProductByCategory(id));
		return mv;
	}
	
	@RequestMapping(value={"/admincontrol"})
	public ModelAndView adminControl() {
		ModelAndView mv = new ModelAndView("admincontrol");
		mv.addObject("title", "Admin Control");
		mv.addObject("category",new Category());
		mv.addObject("supplier", new Supplier());
		mv.addObject("product", new Product());
		return mv;
	}
	
	@RequestMapping(value = { "/login" })
	public ModelAndView login(@RequestParam(name="error",required=false) String error) {
		ModelAndView mv = new ModelAndView("login");
		if(error!=null)
		{
			mv.addObject("message", "Invalid Username or password,please try again");
		}
		mv.addObject("title", "Login");
		return mv;
	}
	

		@RequestMapping(value = { "/logout" })
		public String logOutOpreation(HttpServletRequest request,HttpServletResponse response) {
			
			Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
			
			if(authentication!=null){
				
				new SecurityContextLogoutHandler().logout(request, response, authentication);
			}
		
			return "redirect:/home";
			
		
	
}
}