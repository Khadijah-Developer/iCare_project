package com.codingdojo.icare.services;

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
}
