package com.codingdojo.icare.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.icare.models.User;
import com.codingdojo.icare.repos.UserRepo;
import com.codingdojo.icare.requests.UserLogin;

@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	//Register new user
		public User createUser(User user, BindingResult result) {
			Optional<User> userOptional =  userRepo.findByEmail(user.getEmail());
			if(userOptional.isPresent()) {
				result.rejectValue("email", "unique", "Email address already exist");
			}
			if(!user.getPassword().equals(user.getConfirmPassword())) {
				result.rejectValue("password", "matches", "Passwords do not match");
			}
			
			if(result.hasErrors()) {
				return null; 
			}
			else {
				String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
				user.setPassword(hashed);
				return userRepo.save(user);
			}
		}
		
		//Login User
		public User loginUser(UserLogin userLogin, BindingResult result) {
			Optional<User> optionalUser = userRepo.findByEmail(userLogin.getEmail());
			if(!optionalUser.isPresent()) {
				result.rejectValue("email", "exists", "Email address does not exist.");
			}
			else {
				User user = optionalUser.get();
				if(BCrypt.checkpw(userLogin.getPassword(), user.getPassword())) {
					return user;
				}
				else {
					result.rejectValue("password", "Invalid", "Invalid password.");
				}	
			}
			return null;
		}
		
		public User findUser(Long id) {
			Optional<User> optionalUser =  userRepo.findById(id);
		    return optionalUser.isPresent()?  optionalUser.get() : null;
		    }
		

		public void deleteUser (Long id) {
			userRepo.deleteById(id);
		}
		

}
