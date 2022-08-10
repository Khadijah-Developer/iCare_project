package com.codingdojo.icare.controllers;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.models.User;
import com.codingdojo.icare.requests.FileUploadUtil;
import com.codingdojo.icare.services.OrderService;
import com.codingdojo.icare.services.ProductService;
import com.codingdojo.icare.services.ReviewService;
import com.codingdojo.icare.services.UserService;


@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ReviewService reviewServ;
	
	@GetMapping("/admin")
	public String adminHome(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		if( !session.getAttribute("role").equals("admin") && session.getAttribute("user_id").equals("null")) {
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
	
	// product create product form
	@GetMapping("/product/new")
	public String addProductForm(Model model) {
		if(!model.containsAttribute("product")) {
			model.addAttribute("product", new Product());
		}
		
		return"adminNewProduct.jsp";
	}
	
	// create a product
	@PostMapping(value="/product")
	public String add(Model model, @Valid @ModelAttribute("product") Product product, 
			BindingResult result, 
			RedirectAttributes redirectAttributes,
			HttpSession session
			) throws IOException {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("product",product);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.product",result);
			return "redirect:/product/new";
        } 

		// list to store full paths
		List<String> pathImgs = new ArrayList<String>();

		product = productService.createProduct(product);

		// loop on the list of imgs
		for (MultipartFile img: product.getProductImg()) {
			
			//store filename
			String fileName = StringUtils.cleanPath(img.getOriginalFilename());
			
			//add filename to list of paths which will be stored in db
			pathImgs.add(fileName);
			
			// create a path 
			String uploadDir = "photos/" + product.getId();
			
			// save the img on the above path
			FileUploadUtil.saveFile(uploadDir, fileName, img);
		}
		
		// save the paths in db
		product.setPhotos(pathImgs);
		productService.addProduct(product);

    	redirectAttributes.addFlashAttribute("success", "product was created successfully");
        return "redirect:/admin";
	}
	
	@GetMapping("products/{id}/{pageNumber}")
	public String product(@PathVariable(value="id") Long id, Model model, HttpSession session, 
			RedirectAttributes redirectAttributes , 
			@ModelAttribute("review") Review review,
			@PathVariable("pageNumber") int pageNumber) throws URISyntaxException {
		
		// if user did not register or logged in 
		if (!(session.getAttribute("user_id") == null)) {
			model.addAttribute("user",userService.findUser((Long) session.getAttribute("user_id")));
		}
		

		if (!model.containsAttribute("review")) {
			model.addAttribute("review", new Review());
		}
		
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		 System.out.println(1);
	    Page<Review> reviews = reviewServ.reviewsPerPage(pageNumber - 1,product);
	   
	    // total number of pages that we have
	    int totalPages = reviews.getTotalPages();
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("reviews", reviews);
		return "/view_product.jsp";
		}
	
	@DeleteMapping("/products/{id}/delete")
	public String Delete(@PathVariable("id") Long id,RedirectAttributes redirectAttributes) {
		this.productService.delete(id);
		redirectAttributes.addFlashAttribute("success", "product was deleted successfully");
		return "redirect:/admin";
	}
	
	// product edit product form
		@GetMapping("/products/{id}/edit")
		public String editProduct(Model model,@PathVariable("id") Long id) {
			if(!model.containsAttribute("product")) {
				Product product =productService.findProduct(id);
				model.addAttribute("product",product);
			}
			
			return"adminEditProduct.jsp";
		}
		
		// update a product
		@PutMapping(value="/products/{id}")
		public String update(Model model, @Valid @ModelAttribute("product") Product product, 
				BindingResult result, 
				@PathVariable("id") Long id,
				RedirectAttributes redirectAttributes,
				HttpSession session
				) throws IOException {
			if (result.hasErrors()) {
				redirectAttributes.addFlashAttribute("product",product);
				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.product",result);
				return "redirect:/admin";
	        } 
			// list to store full paths
			List<String> pathImgs = new ArrayList<String>();

			product = productService.updateProduct(id,product);
			// loop on the list of imgs
			for (MultipartFile img: product.getProductImg()) {
				
				//store filename
				String fileName = StringUtils.cleanPath(img.getOriginalFilename());
				
				//add filename to list of paths which will be stored in db
				pathImgs.add(fileName);
				
				// create a path 
				String uploadDir = "photos/" + id;
				
				// save the img on the above path
				FileUploadUtil.saveFile(uploadDir, fileName, img);
			}
			
			// save the paths in db
			product.setPhotos(pathImgs);
			productService.addProduct(product);

	    	redirectAttributes.addFlashAttribute("success", "product was updated successfully");
	        return "redirect:/admin";
		}
}
