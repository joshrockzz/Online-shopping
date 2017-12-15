package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDao;
import com.niit.dao.ProductDao;
import com.niit.model.Cart;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class CartController {

	@Autowired
	HttpSession session;
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDao productDao;
	
	public void cartinitialize(Model m)
	{
		SecurityContextHolder.getContext().getAuthentication();
		User user=(User) session.getAttribute("usermodel"); 
		List<Cart> list=cartDao.retrieveCart(user.getEmail());
		m.addAttribute("usercartlist", list);
	}
	
	@RequestMapping(value="/cartpage")
	public String cartoperation(Model m)
	{
		cartinitialize(m);
		return "cart";
	}
	
	@RequestMapping(value="/cartadd{id}")
	public String cartadd(@PathVariable("id")int id,Model m,HttpServletRequest request)
	{
		User user=(User) session.getAttribute("usermodel");
		Product product=productDao.getProductById(id);
		
		int quantity=Integer.parseInt(request.getParameter("quant"));
		System.out.println(quantity);
		Cart cartexist=cartDao.getCartExistItem(product.getId(), user.getEmail());
		
		if(cartexist==null)
		{
		Cart cart=new Cart();
		cart.setProductId(product.getId());
		cart.setPrice(product.getPrice());
		cart.setUsername(user.getEmail());
		cart.setQuantity(quantity);
		cartDao.addCart(cart);
		}
		else if(cartexist!=null)
		{
			Cart cart=new Cart();
			cart.setCartItemId(cartexist.getCartItemId());
			cart.setProductId(product.getId());
			cart.setPrice(product.getPrice());
			cart.setUsername(user.getEmail());
			cart.setQuantity(quantity);
			cartDao.updateCart(cart);
		}
		cartinitialize(m);
		return "cart";
	}
	
	@RequestMapping(value="/cartremove{cartItemId}")
	public String cartdelete(@PathVariable("cartItemId")int cartItemId,Model m,HttpServletRequest request)
	{
		User user=(User) session.getAttribute("usermodel");
		cartDao.deleteCart(cartItemId);
		cartinitialize(m);
		return "cart";
	}
	
	
	@RequestMapping(value="/checkout")
	public String checkout(HttpServletRequest request,Model m)
	{	
		String total=request.getParameter("total");
		m.addAttribute("total", total);
		return "checkout";
	}
	
	@RequestMapping(value="/invoice")
	public String invoice(HttpServletRequest request,Model m)
	{
		User user=(User) session.getAttribute("usermodel");
		cartDao.deleteUserCart(user.getEmail());
		String total=request.getParameter("total");
		m.addAttribute("total", total);
		return "invoice";
	}
	
	
	
	
}
