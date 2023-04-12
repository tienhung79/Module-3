package com.example.text1.repository.impl;

import com.example.text1.Model.Customer;
import com.example.text1.repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1,"hung","07092000","Da Nang","https://vcdn1-dulich.vnecdn.net/2021/07/16/8-1626444967.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=GfgGn4dNuKZexy1BGkAUNA"));
        customerList.add(new Customer(2,"Hoang","08092000","Nghe An","https://vcdn1-dulich.vnecdn.net/2021/07/16/8-1626444967.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=GfgGn4dNuKZexy1BGkAUNA"));
        customerList.add(new Customer(3,"Danh","09092000","Da Nang","https://vcdn1-dulich.vnecdn.net/2021/07/16/8-1626444967.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=GfgGn4dNuKZexy1BGkAUNA"));
    }

    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void addCustomer(Customer customer) {
        customerList.add(customer);
    }


}
