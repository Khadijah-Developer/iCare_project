package com.codingdojo.icare.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.repos.ReviewRepo;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepo reviewRepo;
	
	public Review addReview (Review review) {
		return reviewRepo.save(review);
	}
}
