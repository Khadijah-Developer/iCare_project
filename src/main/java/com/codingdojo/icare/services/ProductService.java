package com.codingdojo.icare.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Product;
import com.codingdojo.icare.models.Review;
import com.codingdojo.icare.repos.ProductRepo;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo productRepo;
	
	public Product save(Product product) {
		return productRepo.save(product);
	}
	
	//        all Products        \\
	public List<Product> findAllProduct() {
		return productRepo.findAll();
	}
	//     find a Product by ID     \\
	public Product findProduct(Long id) {
		Optional<Product> product = productRepo.findById(id); 
		return product.isPresent()? product.get(): null;
	}
	//     add a Product      \\
	public Product addProduct(Product p) {
		return productRepo.save(p);
	}
	//    create new Product     \\
	public Product createProduct(Product product) {
		return  productRepo.save(product);
	    }
	public Product updateProduct(Long id,Product productUpdate) {
		Product product = findProduct(id);
		product.setName(productUpdate.getName());
		product.setDescription(productUpdate.getDescription());
		product.setBrand(productUpdate.getBrand());
		product.setCountInStock(productUpdate.getCountInStock());
		product.setPrice(productUpdate.getPrice());
		product.setProductImg(productUpdate.getProductImg());
		return productRepo.save(product);
		
	}
	//    Delete a Product   \\
	public void delete(Long id) {
		this.productRepo.deleteById(id);
	}
	
	public List<Product> searchByNameOrBrand(String searchKey){
		return productRepo.findByNameContainingOrBrandContaining(searchKey, searchKey);
	}

	//    filter products by category  \\
	public List<Product>  filterByCategory(String filterCategory){
		return productRepo.findByCategory(filterCategory);
	}
	
	public void reduceQuantity(Product product) {	
		product.setCountInStock(product.getCountInStock()-1);	
		productRepo.save(product);
	}
	public void addToQuantity(Product product) {	
		product.setCountInStock(product.getCountInStock()+1);	
		productRepo.save(product);
	}
	
	public List<Product> addProduct(Product product, List<Product> cart) {
		List<Product> newCart ;
		if( cart == null) {
			newCart = new ArrayList<Product>();
			newCart.add(product);
		    reduceQuantity(product);
		}
		else {  
			newCart = cart;
			newCart.add(product);
			reduceQuantity(product);
		}
		return newCart;
	}
	public List<Product> removeProduct(Product product, List<Product> cart)  {
		for (Product product2 : cart) {
			if(product2.getId().equals(product.getId())){
				boolean removed=cart.remove(product2);
				break;
			}
		}
		addToQuantity(product);
		return cart;
	}
	
	public List<Product> removeAllProduct(Product product, List<Product> cart)  {
		List<Product> newCart= new ArrayList<Product>();
		for (int i=0 ; i<cart.size(); i++) {
			if(!cart.get(i).getName().equals(product.getName())){
					newCart.add(cart.get(i));
					addToQuantity(cart.get(i));	
			}
		}
		return newCart;

	}
	
	private static final int PAGE_SIZE = 3;
    public Page<Product> productsPerPage(int pageNumber) {
    	Pageable pageable = PageRequest.of(pageNumber, PAGE_SIZE, Sort.Direction.DESC, "createdAt");
        Page<Product> products = productRepo.findAllProducts(pageable);
        return productRepo.findAllProducts(pageable);
    }
}
