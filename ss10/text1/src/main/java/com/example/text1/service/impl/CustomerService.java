package com.example.text1.service.impl;

import com.example.text1.Model.Customer;
import com.example.text1.repository.ICustomerRepository;
import com.example.text1.repository.impl.CustomerRepository;
import com.example.text1.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> disPlay() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        List<Customer> customerList = customerRepository.findAll();
        customerRepository.addCustomer(customer);
    }


}
