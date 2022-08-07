package com.codingdojo.icare.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.User;
import com.codingdojo.icare.services.OrderService;
import com.codingdojo.icare.services.ProductService;
import com.codingdojo.icare.services.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/admin")
	public String adminHome(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		if( !session.getAttribute("role").equals("admin")) {
			redirectAttributes.addFlashAttribute("error", "Must be authorized first");
			return "redirect:/";
		}
		List<Product> products = productService.findAllProduct();
		List<Order> orders = orderService.findAllOrder();
		Long id= (Long) session.getAttribute("user_id");
		User user = userService.findUser(id);
		model.addAttribute("user",user);
		model.addAttribute("products",products);
		model.addAttribute("orders",orders);
		
		return "adminHome.jsp";
	}
	
	@GetMapping("/product/new")
	public String addProductForm(@ModelAttribute("product") Product product,Model model) {
		model.addAttribute("", model);
		return"adminNewProduct.jsp";
	}

}
