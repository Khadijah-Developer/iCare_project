package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.codingdojo.icare.models.Review;

@Repository
public interface ReviewRepo extends CrudRepository<Review, Long>{
	
	List<Review> findAll();

}
