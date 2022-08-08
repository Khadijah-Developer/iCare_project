package com.codingdojo.icare.controllers;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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

@PostMapping(value="/search" )
public String searchByArtistName( Model model , HttpServletRequest request) {
	String searchKey = request.getParameter("searchKey");
	List<Product> searchResult = productService.searchByNameOrBrand(searchKey);
	
	model.addAttribute("result",searchResult); 
	model.addAttribute("searchKey", searchKey);
	
	
    return "search.jsp";
    }
}