package com.codingdojo.icare.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.models.Address;
import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.models.User;
import com.codingdojo.icare.services.AddressService;
import com.codingdojo.icare.services.OrderService;
import com.codingdojo.icare.services.ProductService;
import com.codingdojo.icare.services.ReviewService;
import com.codingdojo.icare.services.UserService;

@Controller
public class CustomerController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AddressService addressService;
	@Autowired
	private ReviewService reviewServ;
	
  @GetMapping("/home")
  public String userHome(Model model , HttpSession session) {
	model.addAttribute("products",productService.findAllProduct());
	if (!session.getAttribute("user_id").equals(null)) {
	model.addAttribute("user",userService.findUser((Long) session.getAttribute("user_id")));
	}
		return "home.jsp";
  }
  @GetMapping("/addCart/{id}")
  public String addToCart(@PathVariable(value="id") Long id,Model model,HttpSession session, RedirectAttributes redirectAttributes) {
		Product product = productService.findProduct(id);
		
	  if( session.getAttribute("cart") == null) {
		  List<Product> cart = new ArrayList<Product>();
		    cart.add(product);
		  session.setAttribute("cart", cart);
	  }
	  else {
		  
		  List<Product> cart = (List<Product>) session.getAttribute("cart");
		    cart.add(product);
		  session.setAttribute("cart", cart);
	  }
	  return "redirect:/home";
  }
  @GetMapping("/cart")
  public String Cart(HttpSession session) {
	  if(session.getAttribute("totalPrice") == null) {
		  session.setAttribute("totalPrice", 0.0);
	  }
	 List<Product> cart = (List<Product>) session.getAttribute("cart");
	 Double totalPrice=0.0;
		for(Product product :cart) {
			totalPrice+=product.getPrice();
		}
		session.setAttribute("totalPrice", totalPrice);
	  return "cart.jsp";
  }
	//  create address & Payment form
  @GetMapping("/cart/checkout")
  public String checkout(Model model,HttpSession session, RedirectAttributes redirectAttributes){
	  System.out.print(session.getAttribute("user_id"));
	  if(session.getAttribute("user_id") == null) {
		redirectAttributes.addFlashAttribute("error", "you need to login/register first");
		return "redirect:/";
	}
	if(!model.containsAttribute("address")) {
		model.addAttribute("address", new Address());
  }
	if(!model.containsAttribute("order")) {
		model.addAttribute("order", new Order());
  }
	  return "checkout.jsp";
 }
	//  create address 
  @PostMapping("/cart/checkout")
  public String addAddress(@Valid @ModelAttribute("address") Address address,BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
	  if(result.hasErrors()) {
			redirectAttributes.addFlashAttribute("address", address);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.address", result);
		  return "redirect:/cart/checkout";
	  }
	  User user = userService.findUser((Long) session.getAttribute("user_id"));
	  address.setUserAddress(user);
	  addressService.createAddress(address);
	  return "redirect:/home";
  }
  //create payment  
  @PostMapping("/cart/payment")
  public String addpayment(@Valid @ModelAttribute("order") Order order,BindingResult result,
		  RedirectAttributes redirectAttributes, HttpSession session) {
	  if(result.hasErrors()) {
			redirectAttributes.addFlashAttribute("order", order);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.order", result);
		  return "redirect:/cart/checkout";
	  }
	  orderService.createOrder((Long) session.getAttribute("user_id"),(List<Product>) session.getAttribute("cart"));
	  return "redirect:/home";
  }
	
	
@PostMapping("/search" )
public String search( Model model , HttpServletRequest request) {
	String searchKey = request.getParameter("searchKey");
	List<Product> searchResult = productService.searchByNameOrBrand(searchKey);
	
	model.addAttribute("result",searchResult); 
	model.addAttribute("searchKey", searchKey);
	
	
    return "search.jsp";
    }

@GetMapping("/new")
public String newE() {
		return "new.jsp";
}

@PostMapping("/addReview/{id}" )
public String addReview(@Valid @ModelAttribute("review") Review review,BindingResult result ,
		HttpSession session , @PathVariable(value="id") Long product_id ,  HttpServletRequest request) {
	User customer = userService.findUser((Long) session.getAttribute("user_id"));
	String rate = request.getParameter("rate");
	Double rateD = Double.parseDouble(rate);
	review.setRating(rateD);
	review.setCustReview(customer);
	review.setProduct(productService.findProduct(product_id));
	reviewServ.addReview(review);
	return "redirect:/products/"+product_id;
    }





}
  


