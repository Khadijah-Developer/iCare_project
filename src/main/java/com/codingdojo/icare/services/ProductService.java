package com.codingdojo.icare.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.repos.ProductRepo;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo productRepo;
	
	public Product save(Product product) {
		return productRepo.save(product);
	}
	
	//all Products
	public List<Product> findAllProduct() {
		return productRepo.findAll();
	}
	//find a Product by ID
	public Product findProduct(Long id) {
		Optional<Product> product = productRepo.findById(id); 
		return product.isPresent()? product.get(): null;
	}
	//add a Product
	public Product addProduct(Product p) {
		return productRepo.save(p);
	}
	//create new Product
	public Product createProduct(Product product) {
		return  productRepo.save(product);
	    }
	public Product updateProduct(Long id,Product productUpdate) {
		Product product = findProduct(id);
		product.setName(productUpdate.getName());
		product.setDescription(productUpdate.getDescription());
		product.setBrand(productUpdate.getBrand());
		product.setCountInStock(productUpdate.getCountInStock());
		product.setPrice(productUpdate.getPrice());
		product.setProductImg(productUpdate.getProductImg());
		return productRepo.save(product);
		
	}
	//Delete a Product
	public void delete(Long id) {
		this.productRepo.deleteById(id);
	}
}
