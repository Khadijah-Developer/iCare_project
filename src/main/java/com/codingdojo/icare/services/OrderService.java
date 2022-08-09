package com.codingdojo.icare.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.repos.OrderRepo;
import com.codingdojo.icare.repos.UserRepo;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepo orderRepo;
	
	@Autowired
	private UserService userService;
	
	//all Orders
	public List<Order> findAllOrder(){
		return orderRepo.findAll();
	}
	//create new Order
	public Order createOrder(Long id,List<Product>products,Double discount,Order currentOrder) {
		Order order = new Order();
		order.setAddress(currentOrder.getAddress());
		order.setPaymentMethod(currentOrder.getPaymentMethod());
		order.setCustomer(userService.findUser(id));
		order.setProducts(products);
		System.out.println(order.getProducts());
		Double totalPrice=0.0;
		for(Product product :products) {
			totalPrice+=product.getPrice();
		}
		if(totalPrice>200){
		order.setShippingPrice(0.0);
		}
		else {
			order.setShippingPrice(17.0);
		}
		if (discount != null) {
			totalPrice-=discount;
		}
		totalPrice+=order.getShippingPrice();
		order.setTotalPrice(totalPrice);
		return orderRepo.save(order);
	}
	public Order findOrder(Long id) {
		Optional<Order> order= orderRepo.findById(id);
		return order.isPresent()? order.get():null ;
	}

}
