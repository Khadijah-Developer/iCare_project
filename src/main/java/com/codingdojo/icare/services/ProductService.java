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

	public List<Product> findAllProduct() {
		return productRepo.findAll();
	}
	
	public Product findProduct(Long id) {
		Optional<Product> product = productRepo.findById(id); 
		return product.isPresent()? product.get(): null;
	}
	
	public Product addProduct(Product p) {
		return productRepo.save(p);
	}
	
	public Product createProduct(Product product) {
		return  productRepo.save(product);
	    }
	public void delete(Long id) {
		this.productRepo.deleteById(id);
	}
}
