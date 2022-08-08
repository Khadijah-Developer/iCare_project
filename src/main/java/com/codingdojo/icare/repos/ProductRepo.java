package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.icare.models.Product;

@Repository
public interface ProductRepo  extends CrudRepository<Product, Long>{
	
	List<Product> findAll();
	List<Product> findByNameContainingOrBrandContaining(String searchKey , String brand);
	

}
