package com.codingdojo.icare.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
	
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    
	 	@Pattern(regexp="(^$|[0-9]{10})", message = "Must be number and exact 10 numbers.")
//	 	@Range(min = 10, max= 10, message = "Phone No should be exact 10 numbers." )
	 	private String phoneNo;
	 	
	    @NotEmpty(message="First Name is required!")
	    @Size(min=3, max=30, message="First Name must be between 3 and 30 characters")
	    private String fName; 
	    
	    @NotEmpty(message="Last Name is required!")
	    @Size(min=3, max=30, message="Last Name must be between 3 and 30 characters")
	    private String lName;
	    
	
	    private String role = "customer";
	    
	    @NotEmpty(message = "Email is required!")
	    @Email(message = "Please enter a valid email!")
	    private String email;
	    
	    @NotEmpty(message = "Password is required!")
	    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
	    private String password;
	    
	    //Not save in DB
	    @Transient
	    @NotEmpty(message = "Confirm Password is required!")
	    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
		private String confirmPassword;
	    
	    @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date createdAt;
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;
	    
	    
	    
	    
	    //  Relationships   \\
	    
	    
	    //1:M customer requests orders
	    @OneToMany(mappedBy="customer" ,fetch=FetchType.LAZY , cascade = CascadeType.ALL)
	    private List<Order> orders; 
	    
	    //1:M users's addresses
	    @OneToMany(mappedBy="userAddress" ,fetch=FetchType.LAZY , cascade = CascadeType.ALL)
	    private List<Address> addresses;
	    
	    //1:M customer add reviews 
	    @OneToMany(mappedBy="custReview" ,fetch=FetchType.LAZY , cascade = CascadeType.ALL)
	    private List<Review> reviews; 
	    

	    
	    // constructor \\
	    
	    public User() {
			// TODO Auto-generated constructor stub
		}


	    
	    // Getter and Setter \\
	    
		public Long getId() {
			return id;
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


		public String getConfirmPassword() {
			return confirmPassword;
		}


		public void setConfirmPassword(String confirmPassword) {
			this.confirmPassword = confirmPassword;
		}


		public Date getCreatedAt() {
			return createdAt;
		}


		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}


		public Date getUpdatedAt() {
			return updatedAt;
		}


		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}




		public String getPhoneNo() {
			return phoneNo;
		}



		public void setPhoneNo(String phoneNo) {
			this.phoneNo = phoneNo;
		}



		public String getfName() {
			return fName;
		}



		public void setfName(String fName) {
			this.fName = fName;
		}



		public String getlName() {
			return lName;
		}



		public void setlName(String lName) {
			this.lName = lName;
		}



		public String getRole() {
			return role;
		}



		public void setRole(String role) {
			this.role = role;
		}



		public List<Order> getOrders() {
			return orders;
		}



		public void setOrders(List<Order> orders) {
			this.orders = orders;
		}



		public List<Address> getAddresses() {
			return addresses;
		}



		public void setAddresses(List<Address> addresses) {
			this.addresses = addresses;
		}



		public List<Review> getReviews() {
			return reviews;
		}



		public void setReviews(List<Review> reviews) {
			this.reviews = reviews;
		}


		//other Method
		@PrePersist
		protected void onCreate(){
		       this.createdAt = new Date();
		   }
	   @PreUpdate
	   protected void onUpdate(){
	       this.updatedAt = new Date();
	   }
		
	    
	    

}
