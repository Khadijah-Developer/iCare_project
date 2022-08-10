package com.codingdojo.icare.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.repos.ReviewRepo;
import org.springframework.data.domain.Sort;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepo reviewRepo;
	
	public Review addReview (Review review) {
		return reviewRepo.save(review);
	}
	
	private static final int PAGE_SIZE = 10;
    public Page<Review> reviewsPerPage(int pageNumber, Product product) {
        PageRequest pageRequest = PageRequest.of(pageNumber, PAGE_SIZE, Sort.Direction.DESC, "createdAt");
        Page<Review> reviews = reviewRepo.findAllByProduct(pageRequest,product);
        return reviewRepo.findAllByProduct(pageRequest,product);
    }
}
