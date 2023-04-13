package repository.imp;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1,"Car",23000,"Vehical","Da Nang"));
        productList.add(new Product(2,"Motor",33000,"Vehical","Quang Tri"));
        productList.add(new Product(3,"Plane",43000,"Vehical","Quang Nam"));
        productList.add(new Product(4,"Plane",43000,"Vehical","Quang Nam"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }
    @Override
    public void update(int i, Product productUpdate) {
        productList.set(i,productUpdate);
    }

    @Override
    public void delete(int i) {
        productList.remove(i);
    }

    @Override
    public List<Product> find(String nameFind) {
        List<Product> productListByName = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().equals(nameFind)){
                productListByName.add(productList.get(i));
            }
        }
        return productListByName;
    }

    @Override
    public List<Product> detail(int i) {
        List<Product> productsDetail = new ArrayList<>();
        productsDetail.add(productList.get(i));
        return productsDetail ;
    }

    @Override
    public Product findId(int i) {
        return productList.get(i);
    }


}
