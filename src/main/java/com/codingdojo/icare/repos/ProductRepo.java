package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;

@Repository
public interface ProductRepo  extends CrudRepository<Product, Long>,PagingAndSortingRepository<Product, Long>{
	
	@Query("SELECT e FROM Product e")
	Page<Product> findAllProducts(Pageable pageable);
	
	List<Product> findAll();
	List<Product> findByNameContainingOrBrandContaining(String searchKey , String brand);
	// return products match category  \\
	List<Product> findByCategory(String category);
	
	 

}
