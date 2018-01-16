package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.RegistrationFormDao;
import com.niit.model.RegistrationForm;

@Controller
public class SignupController {

	@Autowired
	RegistrationFormDao registrationFormDao;

	@RequestMapping(value = "/signup")
	public String formpage(Model m) {
		m.addAttribute("registrationForm", new RegistrationForm());
		m.addAttribute("title", "Signup");
		return "signup";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerOperation(@ModelAttribute("registrationForm") RegistrationForm registrationForm, Model m) {
		if ((registrationForm.getPassword()).equals(registrationForm.getConfirmPassword())) {
			registrationForm.setRole("USER");
			registrationForm.setEnabled("TRUE");
			registrationFormDao.createUser(registrationForm);
			m.addAttribute("registrationForm", new RegistrationForm());
			m.addAttribute(registrationForm.getName());
			m.addAttribute("success", "You have sucessfully register,kindly try your credential");
			return "login";
		} else {
			m.addAttribute("match", "noperfectmatch");
			m.addAttribute("registrationForm", new RegistrationForm());
			return "signup";

		}

	}

}
