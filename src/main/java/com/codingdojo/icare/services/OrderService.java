package com.codingdojo.icare.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.repos.OrderRepo;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepo orderRepo;
	
	public List<Order> findAllOrder(){
		return orderRepo.findAll();
	}

}
