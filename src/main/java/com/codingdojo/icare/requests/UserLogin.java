package com.codingdojo.icare.requests;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class UserLogin {
	
	@Email
	@NotEmpty
    private String email;
    @NotNull
    @NotEmpty
    private String password;
    
    public UserLogin() {
    	
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    

}
