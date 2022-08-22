package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.icare.models.Product;

@Repository
public interface ProductRepo  extends CrudRepository<Product, Long >, PagingAndSortingRepository<Product, Long>{
	
	List<Product> findAll();
	Page<Product> findByNameContainingOrBrandContaining(String searchKey , String brand,Pageable pageable);
	// return products match category  \\
	Page<Product> findByCategoryContaining(String category,Pageable pageable);
	List<Product> findTop3ByOrderByCountOrder();
	@Query("SELECT e FROM Product e")
	Page<Product> findAllProducts(Pageable pageable);

}
