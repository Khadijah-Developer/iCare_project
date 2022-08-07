package com.codingdojo.icare.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.repos.ProductRepo;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo productRepo;
	
	public List<Product> findAllProduct() {
		return productRepo.findAll();
	}
	
	public Product addProduct(Product p) {
		return productRepo.save(p);
	}

}
