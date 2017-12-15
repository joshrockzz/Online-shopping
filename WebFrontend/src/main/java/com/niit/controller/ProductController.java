package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDao productDao;

	
	public void refreshProductSession(HttpSession hs,Model m)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		hs.removeAttribute("ProductList");
		List<Product> list=productDao.listProduct();
		hs.setAttribute("productList", list);
	}
	
	@RequestMapping(value="/addproduct")
	public String addProduct(@ModelAttribute("product") Product product,Model m,HttpSession hs)
	{
		MultipartFile file=product.getMimage();
		productDao.addProduct(product);
		String path = "E:\\Rahul\\Eclipse project\\WebFrontend\\src\\main\\webapp\\assets\\images\\products\\"+product.getId()+".jpg";
		
		File fileupload= new File(path);
		
		if(!file.isEmpty())
		{
			try {
				byte[] arr = file.getBytes();
				FileOutputStream fos = new FileOutputStream(fileupload);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(arr);
				bos.close();
			} catch (IOException e) {
				System.out.println("File not uploaded");
			}
		}
		else{
			System.out.println("File not found");
		}
		System.out.println("File uploaded successfully");

		refreshProductSession(hs, m);
		
		return "admincontrol";
	}
	
	
	@RequestMapping(value="/deleteproduct{id}")
	public String deleteProduct(@PathVariable("id") int id,Model m,HttpSession hs)
	{
		productDao.deleteProduct(id);;
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "deleted");
		refreshProductSession(hs,m);
	return "admincontrol";
	}
	

@RequestMapping(value="/updateproduct{id}",method=RequestMethod.GET)
public String updateProduct(@PathVariable("id") int id,Model m,HttpSession hs)
{
	refreshProductSession(hs,m);
	Product product=productDao.getProductById(id);
	m.addAttribute("product",product);
	m.addAttribute("status", "update");
	return "admincontrol";
}

	@RequestMapping(value="/updateproductdata")
	public String updateProductData(@ModelAttribute("product") Product product,Model m,HttpSession hs)
	{
		productDao.updateProduct(product);;
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "updated");
		refreshProductSession(hs,m);
		return "admincontrol";
	}
	

	@RequestMapping(value={"/singleproduct{id}"})
	public ModelAndView singleProduct(@PathVariable int id){
		ModelAndView mv=new ModelAndView("singleproduct");
		Product product=productDao.getProductById(id);
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		return mv;
	}
	
}
