package service;

import model.Product;

import java.util.List;

public interface IProductService {
    public List<Product> disPlay();

    void addProduct(Product product);

    void update(int idUpdate, Product productUpdate);

    void delete(int idDelete);

    List<Product> find(String nameFind);

    List<Product> detail(int idDetail);
}
