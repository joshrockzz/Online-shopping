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

	public void cartinitialize(Model m) {
		SecurityContextHolder.getContext().getAuthentication();
		User user = (User) session.getAttribute("usermodel");
		List<Cart> list = cartDao.retrieveCart(user.getEmail());
		m.addAttribute("usercartlist", list);
	}

	@RequestMapping(value = "/cartpage")
	public ModelAndView cartoperation(Model m) {
		ModelAndView mv=new ModelAndView("index");
		cartinitialize(m);
		mv.addObject("title", "Cart");
		mv.addObject("userClickCart", true);
		return mv;
	}

	@RequestMapping(value = "/cartadd{id}")
	public String cartadd(@PathVariable("id") int id, Model m, HttpServletRequest request) {
		
		User user = (User) session.getAttribute("usermodel");
		Product product = productDao.getProductById(id);

		int quantity = Integer.parseInt(request.getParameter("quant"));
		System.out.println(quantity);
		Cart cartexist = cartDao.getCartExistItem(product.getId(), user.getEmail());

		if (cartexist == null) {
			Cart cart = new Cart();
			cart.setProductId(product.getId());
			cart.setPrice(product.getPrice());
			cart.setUsername(user.getEmail());
			cart.setQuantity(quantity);
			cartDao.addCart(cart);
		} else if (cartexist != null) {
			Cart cart = new Cart();
			cart.setCartItemId(cartexist.getCartItemId());
			cart.setProductId(product.getId());
			cart.setPrice(product.getPrice());
			cart.setUsername(user.getEmail());
			cart.setQuantity(quantity);
			cartDao.updateCart(cart);
		}
		cartinitialize(m);
		return "redirect:cartpage";
	}

	@RequestMapping(value = "/cartremove{cartItemId}")
	public String cartdelete(@PathVariable("cartItemId") int cartItemId, Model m, HttpServletRequest request) {
		User user = (User) session.getAttribute("usermodel");
		cartDao.deleteCart(cartItemId);
		cartinitialize(m);
		return "redirect:cartpage";
	}

	@RequestMapping(value = "/checkout")
	public ModelAndView checkout(HttpServletRequest request, Model m) {
		ModelAndView mv=new ModelAndView("index");
		String total = request.getParameter("total");
		m.addAttribute("total", total);
		mv.addObject("userClickCheckout", true);
		mv.addObject("title", "Checkout");
		return mv;
	}

	@RequestMapping(value = "/invoice")
	public ModelAndView invoice(HttpServletRequest request, Model m) {
		ModelAndView mv=new ModelAndView("index");
		User user = (User) session.getAttribute("usermodel");
		cartinitialize(m);
		String total = request.getParameter("total");
		m.addAttribute("total", total);
		mv.addObject("userClickInvoice", true);
		mv.addObject("title", "Invoice");
		cartDao.deleteUserCart(user.getEmail());
		return mv;
	}

}
