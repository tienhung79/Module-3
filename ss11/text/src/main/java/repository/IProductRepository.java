package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    public List<Product> getAll();

    void create(Product product);

    void update(int i, Product productUpdate);

    void delete(int i);

    List<Product> find(String nameFind);


    List<Product> detail(int i);

    Product findId(int i);
}
