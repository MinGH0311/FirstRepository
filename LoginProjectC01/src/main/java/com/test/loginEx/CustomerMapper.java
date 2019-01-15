package com.test.loginEx;

public interface CustomerMapper {

	Customer selectCustomer(String searchId);

	int insertCustomer(Customer customer);

	int updateCustomer(Customer customer);
	
}
