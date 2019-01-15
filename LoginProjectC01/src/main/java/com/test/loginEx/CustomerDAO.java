package com.test.loginEx;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO {
	@Autowired
	SqlSession sqlSession;

	public Customer get(String searchId) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		Customer customer = mapper.selectCustomer(searchId);
		return customer;
	}

	public int insert(Customer customer) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = mapper.insertCustomer(customer);
		return result;
	}

	public int update(Customer customer) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = mapper.updateCustomer(customer);
		return result;
	}
	
}
