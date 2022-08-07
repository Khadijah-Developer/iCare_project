package com.codingdojo.icare.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "addresses")
public class Address {

 	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
 	@NotEmpty(message="City is required!")
	@Size(min=3, max=45, message="City must be between 3 and 30 characters")
 	private String city;
 	
 	@NotEmpty(message="Country is required!")
	@Size(min=3, max=45, message="Country must be between 3 and 30 characters")
 	private String country;
 	
 	@NotEmpty(message="State is required!")
	@Size(min=3, max=45, message="State must be between 3 and 30 characters")
 	private String state;
 	
 	@NotEmpty(message="District is required!")
	@Size(min=3, max=45, message="District must be between 3 and 30 characters")
 	private String district;
 	
 	@NotEmpty(message="Street is required!")
	@Size(min=3, max=45, message="Street must be between 3 and 30 characters")
 	private String street;
 	
 	@NotNull
 	@Digits(integer=5,fraction=0)
 	private Integer postalCode;
 	
 	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    
	 //  Relationships   \\
	
	// address belong to 1 user
	@ManyToOne
	@JoinColumn(name="user_id")
    private User userAddress;
	
	public Address() {
		// TODO Auto-generated constructor stub
	}
	
    // Getter and Setter \\
	
	public Long getId() {
		return id;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getDistrict() {
		return district;
	}


	public void setDistrict(String district) {
		this.district = district;
	}


	public String getStreet() {
		return street;
	}


	public void setStreet(String street) {
		this.street = street;
	}


	public Integer getPostalCode() {
		return postalCode;
	}


	public void setPostalCode(Integer postalCode) {
		this.postalCode = postalCode;
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


	public User getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(User userAddress) {
		this.userAddress = userAddress;
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
