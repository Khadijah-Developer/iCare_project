package com.codingdojo.icare.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.icare.models.Address;


@Repository
public interface AddressRepo  extends CrudRepository<Address, Long>{
	
	List<Address> findAll();

}