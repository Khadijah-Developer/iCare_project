package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;

@Repository
public interface ReviewRepo extends CrudRepository<Review, Long>,PagingAndSortingRepository<Review, Long>{
	
	List<Review> findAll();
	
	Page<Review> findAllByProduct(PageRequest pageRequest,Product product);
	

}
