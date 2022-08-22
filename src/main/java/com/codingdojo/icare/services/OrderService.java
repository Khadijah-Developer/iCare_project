package com.codingdojo.icare.services;

import java.security.KeyStore.Entry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Order;
import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.repos.OrderRepo;
import com.codingdojo.icare.repos.ProductRepo;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepo orderRepo;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductRepo pRepo;
	
	
	//all Orders
	public List<Order> findAllOrder(){
		return orderRepo.findAll();
	}
	
	
	
	
	//create new Order
	public Order createOrder(Long id,HashMap<Product,Integer>cartMap,Double discount,Order currentOrder) {
		Order order = new Order();
		order.setAddress(currentOrder.getAddress());
		order.setPaymentMethod(currentOrder.getPaymentMethod());
		order.setCustomer(userService.findUser(id));
		List<Product> productList = new ArrayList<Product>( cartMap.keySet());
		order.setProducts(productList);
		Double totalPrice=0.0;
		
		// cartMap contains each product and its quantity in the cart
		// loop over cart items
		for(Map.Entry<Product,Integer> entry : cartMap.entrySet()) {
			Product product=entry.getKey();
			
			System.out.println(product.getName());
			
			// increase the count order of that product => count the most sold items
			product.setCountOrder(product.getCountOrder()+entry.getValue()); 
			
			// reduce the stock of product in db
			product.setCountInStock(product.getCountInStock()-entry.getValue());
			pRepo.save(product);
			totalPrice+=product.getPrice();
		}
		
		// shipping =0 if total is more than 200, 17 if less
		if(totalPrice>200){
		order.setShippingPrice(0.0);
		}
		else {
			order.setShippingPrice(17.0);
		}
		// apply discount if there is any 
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
	
	//   update order    \\\
	public Order updateOrder(Long id, Order userOrder) {
		Order order = findOrder(id);
		order.setOrderStatus(userOrder.getOrderStatus());
		
		return orderRepo.save(order);
		
	}
     //      Delete specific order     \\
	public void deleteOrder(Long id){
			orderRepo.deleteById(id);
	}

}
