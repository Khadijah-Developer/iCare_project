package com.codingdojo.icare.models;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	private String name;
	
	// save imgs temporary 
	@Transient
	MultipartFile[] ProductImg;
	
	// imgs names 
	@ElementCollection
	private List<String> photos;
	
	@NotEmpty
	private String description;
	
	@NotEmpty
	private String category;
	
	@NotEmpty
	private String brand;
	
	@NotNull
	private Double price;
	
	private Double avgRating = 0.0;
	
	
	private Integer countInStock = 0;
	
	
	   
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
	 //  Relationships   \\
	
	//products belong to 1 order
	@ManyToOne
	@JoinColumn(name="order_id")
    private Order order;
	
	
	//1:M product has reviews
    @OneToMany(mappedBy="product" ,fetch=FetchType.LAZY , cascade = CascadeType.ALL)
    private List<Review> reviews;
    
    // constructor \\
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	
	
    // Getter and Setter \\

	public Long getId() {
		return id;
	}




	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public MultipartFile[] getProductImg() {
		return ProductImg;
	}



	public void setProductImg(MultipartFile[] productImg) {
		ProductImg = productImg;
	}
	
	

	public List<String> getPhotos() {
		return photos;
	}



	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}


	// return paths for each img
	@Transient
    public List<String> getPhotosImagePath() {
        if (photos == null || id == null) return null;
        List<String> paths= new ArrayList<String>();
        for (String photo : photos) {
        	paths.add("/photos/" + id + "/" + photo);
        }
        return paths;
    }
	
	public void setDescription(String description) {
		this.description = description;
	}





	public String getCategory() {
		return category;
	}





	public void setCategory(String category) {
		this.category = category;
	}





	public String getBrand() {
		return brand;
	}





	public void setBrand(String brand) {
		this.brand = brand;
	}





	public Double getPrice() {
		return price;
	}





	public void setPrice(Double price) {
		this.price = price;
	}





	public Double getAvgRating() {
		return avgRating;
	}





	public void setAvgRating(Double avgRating) {
		this.avgRating = avgRating;
	}





	public Integer getCountInStock() {
		return countInStock;
	}





	public void setCountInStock(Integer countInStock) {
		this.countInStock = countInStock;
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





	public Order getOrder() {
		return order;
	}





	public void setOrder(Order order) {
		this.order = order;
	}





	public List<Review> getReviews() {
		return reviews;
	}





	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
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
