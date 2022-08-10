package com.codingdojo.icare.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "reviews")
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	private String comment;
	
	private Double rating = 0.0;
	
	// save imgs temporary 
	@Transient
	MultipartFile[] imgs;
		
	// imgs names 
	@ElementCollection
	private List<String> photos;
	
//	@ElementCollection
//	private List<String> ProductImg = new ArrayList<String>();
	
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
	 //  Relationships   \\
	
	// reviews belong to 1 customer
	@ManyToOne
	@JoinColumn(name="user_id")
    private User custReview;
	
	// reviews belong to 1 product
	@ManyToOne
	@JoinColumn(name="product_id")
    private Product product;
	
    
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
    // Getter and Setter \\

   public Long getId() {
		return id;
	}


	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}



	public Double getRating() {
		return rating;
	}



	public void setRating(Double rating) {
		this.rating = rating;
	}




//	public List<String> getProductImg() {
//		return ProductImg;
//	}
//
//	public void setProductImg(List<String> productImg) {
//		ProductImg = productImg;
//	}
	
	

	public Date getCreatedAt() {
		return createdAt;
	}



	public MultipartFile[] getImgs() {
		return imgs;
	}

	public void setImgs(MultipartFile[] img) {
		imgs = img;
	}

	// return paths for each img
	@Transient
	public List<String> getPhotosImagePath() {
		if (photos == null || id == null) return null;
	    List<String> paths= new ArrayList<String>();
	    for (String photo : photos) {
	      	paths.add("/reviews/" + id + "/" + photo);
	        }
	    return paths;
	    }
	
	public List<String> getPhotos() {
		return photos;
	}

	public void setPhotos(List<String> photos) {
		this.photos = photos;
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



	public User getCustReview() {
		return custReview;
	}



	public void setCustReview(User custReview) {
		this.custReview = custReview;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	//other setter
	@PrePersist
   protected void onCreate(){
       this.createdAt = new Date();
   }
   @PreUpdate
   protected void onUpdate(){
       this.updatedAt = new Date();
   }
	

}
