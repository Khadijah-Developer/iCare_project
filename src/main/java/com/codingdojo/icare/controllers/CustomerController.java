package com.codingdojo.icare.controllers;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.models.Address;
import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.models.User;
import com.codingdojo.icare.requests.FileUploadUtil;
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
	public String userHome(Model model , HttpSession session , HttpServletRequest request) {
		
		if (session.getAttribute("searchKey") == null) { // if searchKey null so thats mean the user didnt search so display all products !
			model.addAttribute("products",productService.findAllProduct());
			}else {
				List<Product> searchResult = productService.searchByNameOrBrand((String)session.getAttribute("searchKey"));
				model.addAttribute("products",searchResult);
				request.getSession().removeAttribute("searchKey"); // remove searchKey from the session to display all products when user refresh the page ! 
			}
		
		if (!(session.getAttribute("user_id") == null)) { // if the user in the session send user object to home page (to print the name there )
			model.addAttribute("user",userService.findUser((Long) session.getAttribute("user_id")));
	    }
		
		
		if (!(session.getAttribute("cart") == null)) { // if  cart exist
			List<Product> cart = (List<Product>) session.getAttribute("cart");
			session.setAttribute("productCount" , cart.size());
	    }else {
	    	session.setAttribute("productCount" , 0);
	    }
		return "home.jsp";
	}
	
	// add to cart from home
	@GetMapping("/addCart/{id}")
	public String addToCart(@PathVariable(value="id") Long id,HttpSession session) {
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
		if(product.getCountInStock()<=0) {
			redirectAttributes.addFlashAttribute("error", "Stocks are not enough");
			return "redirect:/cart";
		}
		List<Product> cart= productService.addProduct(product,(List<Product>) session.getAttribute("cart"));
		//session.setAttribute("cart", cart);	
		return "redirect:/cart";
	}
		
	// Remove all items of specific product  
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
		}else{
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
		}
		return "cart.jsp";
	}
	

	// show order before confirm it and choose address and payment
	@GetMapping("/cart/checkout")
	public String checkout(Model model,HttpSession session, RedirectAttributes redirectAttributes){
		  if(session.getAttribute("user_id") == null) {
			  redirectAttributes.addFlashAttribute("error", "you need to login/register first");
			  return "redirect:/";
		  }
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
	
	
	 
    @PostMapping("/search" )
	public String search( Model model , HttpServletRequest request ,HttpSession session) {
		String searchKey = request.getParameter("searchKey");
		session.setAttribute("searchKey", searchKey);
		
	    return "redirect:/home";
	    }
	
        
	// discount function -- need to edit + add table to save codes and amount of dicsount and expired date
	@PostMapping("/applyDiscount")
	public String applyDiscount(@RequestParam(value="discount") String discount ,	HttpSession session) {
		// if discount in database apply it 
		System.out.print("disc");
		Double amount = (Double) session.getAttribute("totalPrice") *10 /100;
		session.setAttribute("discount",amount);
		return "redirect:/cart/checkout";
	}
	//   Display the summary of order placed by customer  \\
	@GetMapping("/summary/{id}")
	public String summary(Model model,@PathVariable("id") Long id ) {

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
		if (order.getAddress() == null ) { // if the customer didint enter or choose the address show error 
			redirectAttributes.addFlashAttribute("error", "please add your address ");
			System.out.println("add address");}
			if(!model.containsAttribute("user")) {
				  model.addAttribute("user", userService.findUser((Long) session.getAttribute("user_id")));
			  }
		order=orderService.createOrder((Long) session.getAttribute("user_id"),
				(List<Product>) session.getAttribute("cart"),
				(Double) session.getAttribute("discount"),order);
		model.addAttribute(order);
		session.setAttribute("cart",new ArrayList<Product>());
		session.setAttribute("totalPrice", 0.0);
		return "redirect:/summary/"+order.getId();
	}
	
	//   Display customer's profile   \\
	@GetMapping("/profile")
	public String customerProfile(Model model, HttpSession session) {
		
		
		//  return id for logined customer 
		Long userId  = (Long)session.getAttribute("user_id");
		//  return logined customer info
		User user = userService.findUser(userId);
		model.addAttribute("customer", user);
		
		//    return  all customer's orders   \\
		List<Order> orders = orderService.findAllOrder();
		//     pass all customer's orders     \\
		model.addAttribute("orders", orders);
			
		return "profileCustomer.jsp";
	}
	
	   //      Delete specific order     \\
	
	@DeleteMapping("/order/delete/{id}")
	public String deleteOrder(@PathVariable("id") Long id) {
		orderService.deleteOrder(id);
		return "redirect:/profile";
	}


	//     filter products via  category   \\
	@GetMapping("/filter" )
	public String filterCategory( Model model , HttpServletRequest request) {
		String filterKey = request.getParameter("filterKey");
		List<Product> filterResult = productService.filterByCategory(filterKey);
		
		model.addAttribute("filter",filterResult); 
		model.addAttribute("filterKey", filterKey);
	    return "redirect:/home";
	}

	@PostMapping("/{id}/addReview" )
	public String addReview(@Valid @ModelAttribute("review") Review review,BindingResult result ,
			HttpSession session , @PathVariable(value="id") Long product_id ,  HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws IOException {
		User customer = userService.findUser((Long) session.getAttribute("user_id"));
		if (result.hasErrors()) {
			System.out.println(result);
			redirectAttributes.addFlashAttribute("review",review);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.product",result);
			return "redirect:/products/"+product_id+"/1";
        } 
		String rate = request.getParameter("rate");
		Double rateD = Double.parseDouble(rate);
		Product product =productService.findProduct(product_id);
		review.setRating(rateD);
		review.setCustReview(customer);
		review.setProduct(product);
		review = reviewServ.addReview(review);
		
		// list to store full paths
		List<String> pathImgs = new ArrayList<String>();
		System.out.println(review.getImgs()+" here");
		// loop on the list of imgs
		for (MultipartFile img: review.getImgs()) {
			System.out.println(2);
			//store filename
			String fileName = StringUtils.cleanPath(img.getOriginalFilename());
			
			//add filename to list of paths which will be stored in db
			pathImgs.add(fileName);
					
			// create a path 
			String uploadDir = "reviews/"+ review.getId();
					
			// save the img on the above path
			FileUploadUtil.saveFile(uploadDir, fileName, img);
			}
				
		// save the paths in db
		review.setPhotos(pathImgs);
		reviewServ.addReview(review);
		
		product.setAvgRating(getRatAvg(product)); 
		productService.updateProduct(product_id, product);
		return "redirect:/products/"+product_id+"/1";
	    }


	public Double getRatAvg(Product p) {
		Double total = 0.0, avrg =0.0;
		List<Review> reviews = p.getReviews();
		
		for (int i=0; i<reviews.size(); i++) {
			total += reviews.get(i).getRating();	
		}
		if (reviews.size() == 0) { /// to prevent divide by zero (total / 0 )
			return 0.0;
		}
		return avrg = total / reviews.size();
	}

}
  


