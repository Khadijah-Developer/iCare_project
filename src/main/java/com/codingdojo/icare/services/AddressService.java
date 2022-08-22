package com.codingdojo.icare.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.icare.models.Address;
import com.codingdojo.icare.repos.AddressRepo;

@Service
public class AddressService {
	@Autowired
	private AddressRepo addressRepo;
	
	//create new Address
	public Address createAddress(Address address) {
		return addressRepo.save(address);
	    }
	
	//    return  specific address    \\
	public Address findAddress(Long id) {
		Optional<Address> addOptional = addressRepo.findById(id);
		if(addOptional.isPresent()) {
			return addOptional.get(); 
		}
		return null;
	}
	
	
	//  update address   \\
	public Address updateAddress(Address address, Long id) {
		Address add = findAddress(id);
		add.setCity(address.getCity());
		add.setCountry(address.getCountry());
		add.setState(address.getState());
		add.setStreet(address.getStreet());
		add.setDistrict(address.getDistrict());
		add.setPostalCode(address.getPostalCode());
		return addressRepo.save(add);		
		
	}
}
