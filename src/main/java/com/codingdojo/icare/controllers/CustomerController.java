package com.codingdojo.icare.controllers;


import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
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
		if (!(session.getAttribute("user_id") == null)) {
			model.addAttribute("user",userService.findUser((Long) session.getAttribute("user_id")));
	}
		return "home.jsp";
	}
	
	// add to cart from home
	@GetMapping("/addCart/{id}")
	public String addToCart(@PathVariable(value="id") Long id,Model model,HttpSession session, RedirectAttributes redirectAttributes) {
		Product product = productService.findProduct(id);
		List<Product> cart= productService.addProduct(product,(List<Product>) session.getAttribute("cart"));
		session.setAttribute("cart", cart);	
	    return "redirect:/home";
	}
	
	// romove from cart at cart 
	@GetMapping("/removeCart/{id}")
	public String removeFromCart(@PathVariable(value="id") Long id,Model model,
			HttpSession session, RedirectAttributes redirectAttributes) {
		Product product = productService.findProduct(id);
		List<Product> cart= productService.removeProduct(product,(List<Product>) session.getAttribute("cart"));

		return "redirect:/cart";
	}
	
	// add to cart from cart
	@GetMapping("cart/addCart/{id}")
	public String addAtCart(@PathVariable(value="id") Long id,Model model,HttpSession session, RedirectAttributes redirectAttributes) {
		Product product = productService.findProduct(id);
		List<Product> cart= productService.addProduct(product,(List<Product>) session.getAttribute("cart"));
		//session.setAttribute("cart", cart);	
		return "redirect:/cart";
	}
		
	// romove all items of specifc product  
	@GetMapping("/removeCart/{id}/all")
	public String removeAtCart(@PathVariable(value="id") Long id,Model model,
			HttpSession session, RedirectAttributes redirectAttributes) {
		Product product = productService.findProduct(id);
		List<Product> cart= productService.removeAllProduct(product,(List<Product>) session.getAttribute("cart"));
		session.setAttribute("cart", cart);	

		return "redirect:/cart";
	}
	
	
	
	//show cart
	@GetMapping("/cart")
	public String Cart(HttpSession session,Model model) {
		if(session.getAttribute("totalPrice") == null) {
			session.setAttribute("totalPrice", 0.0);
		}
		if (session.getAttribute("cart") == null) {
			session.setAttribute("cart", new ArrayList<Product>());
		}
		List<Product> cart = (List<Product>) session.getAttribute("cart");
		HashMap<Product,Integer> cartMap = new HashMap<Product,Integer>();
		for (Product product: cart) {
			boolean flag =false;
			for (Product p: cartMap.keySet()) {
				if (p.getName().equals(product.getName())) {
					flag=true;
					cartMap.put(p,cartMap.get(p)+1);
				}
			}
			if(flag == false) {
				cartMap.put(product,1);
			}
		}
		Double totalPrice=0.0;
		for(Product product :cart) {
			totalPrice+=product.getPrice();
		}
		model.addAttribute("cartMap",cartMap);
		session.setAttribute("totalPrice", totalPrice);
		return "cart.jsp";
	}
	

	
	// show order before confirm it and choose address and payment
	@GetMapping("/cart/checkout")
	public String checkout(Model model,HttpSession session, RedirectAttributes redirectAttributes){
		  //System.out.print(session.getAttribute("user_id"));
		  if(session.getAttribute("user_id") == null) {
			  redirectAttributes.addFlashAttribute("error", "you need to login/register first");
			  return "redirect:/";
		  }
//		  if(!model.containsAttribute("address")) {
//			  model.addAttribute("address", new Address());
//		  }
		  if(!model.containsAttribute("order")) {
			  model.addAttribute("order", new Order());
		  }
	
		  if(!model.containsAttribute("user")) {
			  model.addAttribute("user", userService.findUser((Long) session.getAttribute("user_id")));
		  }
		  return "checkout.jsp";
	}
	
	// show address form
	@GetMapping("/user/address/new")
	public String createAddress(Model model,HttpSession session, RedirectAttributes redirectAttributes){
		  //System.out.print(session.getAttribute("user_id"));
		  if(session.getAttribute("user_id") == null) {
			  redirectAttributes.addFlashAttribute("error", "you need to login/register first");
			  return "redirect:/";
		  }
		  if(!model.containsAttribute("address")) {
			  model.addAttribute("address", new Address());
		  }
	
//		  if(!model.containsAttribute("user")) {
//			  model.addAttribute("user", userService.findUser((Long) session.getAttribute("user_id")));
//		  }
		  return "create_address.jsp";
	}
	
	
	//  create address 
	@PostMapping("/user/address")
	public String addAddress(@Valid @ModelAttribute("address") Address address,BindingResult result, 
			RedirectAttributes redirectAttributes, HttpSession session) {
		if(result.hasErrors()) {
			redirectAttributes.addFlashAttribute("address", address);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.address", result);
			return "redirect:/user/address/new";
		}
		User user = userService.findUser((Long) session.getAttribute("user_id"));
		address.setUserAddress(user);
		addressService.createAddress(address);
		return "redirect:/cart/checkout";
	}
	
	//choose payment  
//	@PostMapping("/user/payment")
//	public String addpayment(@RequestParam("payment") String payment,BindingResult result,
//		  RedirectAttributes redirectAttributes, HttpSession session) {
//		if(result.hasErrors()) {
//			redirectAttributes.addFlashAttribute("v", payment);
//			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.payment", result);
//			return "redirect:/cart/checkout";
//		}
//		//session.setAttribute("payment",payment);
//		orderService.createOrder((Long) session.getAttribute("user_id"),(List<Product>) session.getAttribute("cart"));
//		return "redirect:/cart/checkout";
//	}
	
	
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

	@PostMapping("/applyDiscount")
	public String applyDiscount(@RequestParam(value="discount") String discount ,	HttpSession session) {
		// if discount in database apply it 
		System.out.print("disc");
		Double amount = (Double) session.getAttribute("totalPrice") *10 /100;
		session.setAttribute("discount",amount);
		return "redirect:/cart/checkout";
	}
	
	@GetMapping("/summary/{id}")
	public String summary(Model model,@PathVariable("id") Long id) {
		Order order= orderService.findOrder(id);
		model.addAttribute("order",order);
		return "summary.jsp";
	}
	
	@PostMapping("/order")
	public String placeOrder(@Valid @ModelAttribute("order") Order order,BindingResult result ,
	HttpSession session,RedirectAttributes redirectAttributes , Model model) {
		if(result.hasErrors()) {
			redirectAttributes.addFlashAttribute("order", order);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.order", result);
			return "redirect:/cart/checkout";
		}
		System.out.println(order.getPaymentMethod());
		System.out.println(order.getAddress());
		System.out.println((List<Product>) session.getAttribute("cart"));
		order=orderService.createOrder((Long) session.getAttribute("user_id"),
				(List<Product>) session.getAttribute("cart"),
				(Double) session.getAttribute("discount"),order);
		model.addAttribute(order);
		return "redirect:/summary/"+order.getId();
	}
	
	
}
  


