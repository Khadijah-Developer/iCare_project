package com.codingdojo.icare.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.User;
import com.codingdojo.icare.services.ProductService;
import com.codingdojo.icare.services.UserService;

@Controller
public class CustomerController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
@GetMapping("/home")
public String userHome(Model model) {
	model.addAttribute("products",productService.findAllProduct());
	
		return "home.jsp";
}
}