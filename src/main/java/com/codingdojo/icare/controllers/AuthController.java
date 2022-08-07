package com.codingdojo.icare.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.models.User;
import com.codingdojo.icare.requests.UserLogin;
import com.codingdojo.icare.services.UserService;




@Controller
public class AuthController {
	
	 @Autowired
	 private  UserService userService;
	 
		@GetMapping("/")
		public String ShowRegisterLogin(Model model) {
			if(!model.containsAttribute("newUser")) {
				model.addAttribute("newUser",new User());
			}
			if(!model.containsAttribute("loginUser")) {
				model.addAttribute("loginUser", new UserLogin());
			}
			return "index.jsp";
			
		}
		
		@PostMapping("/register")
		public String createUser(
				@Valid @ModelAttribute("newUser") User newUser,
				BindingResult result,
				RedirectAttributes redirectAttributes,
				HttpSession session) {
			User user = userService.createUser(newUser, result);
			if (user== null) {
				redirectAttributes.addFlashAttribute("newUser", newUser);
				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.newUser", result);
				return "redirect:/";
			}
			else {
				session.setAttribute("user_id", user.getId());
				session.setAttribute("role", user.getRole());
				return "redirect:/home";
			}
			
		}
		
		@PostMapping("/login")
		public String userLogin(
				@Valid @ModelAttribute("loginUser") UserLogin user,
				BindingResult result,
				RedirectAttributes redirectAttributes,
				HttpSession session) {
			if(result.hasErrors()) {
				redirectAttributes.addFlashAttribute("loginUser", user);
				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", result);
				return "redirect:/";
			}

			User userLogged = userService.loginUser(user, result);
			if (userLogged== null) {
				redirectAttributes.addFlashAttribute("loginUser", user);
				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", result);
				return "redirect:/";
			}
			else {
		
				session.setAttribute("user_id", userLogged.getId());
				session.setAttribute("role", userLogged.getRole());
				//redirect to the user dashboard
				if(userLogged.getRole().equals("admin")){
					return "redirect:/admin";
				}
				return "redirect:/home";
			}
			
		}
		
		
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.removeAttribute("user_id");
			return "redirect:/";
		}

}
