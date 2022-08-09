package com.codingdojo.icare.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.icare.Responses.GenericResponse;
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
		@ResponseBody
		public GenericResponse createUser(
				@Valid @ModelAttribute("newUser") User newUser,
				BindingResult result,
				RedirectAttributes redirectAttributes,
				HttpSession session) {
			User user = userService.createUser(newUser, result);
			if (user== null) {
				List<FieldError> fieldErrors = result.getFieldErrors();
				GenericResponse response = new GenericResponse();
				response.setFieldErrors(fieldErrors);
				return response;
			}
			else {
				session.setAttribute("user_id", user.getId());
				session.setAttribute("role", user.getRole());
				String pathString = "/home";
				GenericResponse response = new GenericResponse();
				response.setSuccess(true);
				response.setData(pathString);
				return response;
			}
			
		}
		
//		@PostMapping("/register")
//		public String createUser(
//				@Valid @ModelAttribute("newUser") User newUser,
//				BindingResult result,
//				RedirectAttributes redirectAttributes,
//				HttpSession session) {
//			User user = userService.createUser(newUser, result);
//			if (user== null) {
//				redirectAttributes.addFlashAttribute("newUser", newUser);
//				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.newUser", result);
//				return "redirect:/";
//			}
//			else {
//				session.setAttribute("user_id", user.getId());
//				session.setAttribute("role", user.getRole());
//				return "redirect:/home";
//			}
//			
//		}
		
//		@PostMapping("/login")
//		public String userLogin(
//				@Valid @ModelAttribute("loginUser") UserLogin user,
//				BindingResult result,
//				RedirectAttributes redirectAttributes,
//				HttpSession session) {
//			if(result.hasErrors()) {
//				redirectAttributes.addFlashAttribute("loginUser", user);
//				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", result);
//				return "redirect:/";
//			}
//
//			User userLogged = userService.loginUser(user, result);
//			if (userLogged== null) {
//				redirectAttributes.addFlashAttribute("loginUser", user);
//				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", result);
//				return "redirect:/";
//			}
//			else {
//		
//				session.setAttribute("user_id", userLogged.getId());
//				session.setAttribute("role", userLogged.getRole());
//				//redirect to the user dashboard
//				if(userLogged.getRole().equals("admin")){
//					return "redirect:/admin";
//				}
//				return "redirect:/home";
//			}
//			
//		}
		@PostMapping("/login")
		@ResponseBody
		public GenericResponse userLogin(
				@Valid @ModelAttribute("loginUser") UserLogin user,
				BindingResult result,
				RedirectAttributes redirectAttributes,
				HttpSession session) {
			User userLogged = userService.loginUser(user, result);
			if (userLogged== null) {
				List<FieldError> fieldErrors = result.getFieldErrors();
				GenericResponse response = new GenericResponse();
				response.setFieldErrors(fieldErrors);
				return response;
			}
			else {
				session.setAttribute("user_id", userLogged.getId());
     			session.setAttribute("role", userLogged.getRole());
     			
				String pathString = "/home";
				if(userLogged.getRole().equals("admin")){
					pathString = "/admin";
				}
     			
     			GenericResponse response = new GenericResponse();
				response.setSuccess(true);
				response.setData(pathString);
				return response;
			}
//	
		}
		
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}

}
