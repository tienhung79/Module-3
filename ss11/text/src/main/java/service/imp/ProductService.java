package service.imp;

import model.Product;
import repository.IProductRepository;
import repository.imp.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
   private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> disPlay() {
        return productRepository.getAll();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.create(product);
    }

    @Override
    public void update(int idUpdate, Product productUpdate) {
        List<Product> productList = productRepository.getAll();
        for (int i = 0; i <productList.size() ; i++) {
            if (productList.get(i).getId()==idUpdate){
                productRepository.update(i,productUpdate);
                break;
            }
        }
    }

    @Override
    public void delete(int idDelete) {
        List<Product> productList = productRepository.getAll();
        for (int i = 0; i <productList.size() ; i++) {
            if (productList.get(i).getId()==idDelete){
                productRepository.delete(i);
                break;
            }
        }
    }

    @Override
    public List<Product> find(String nameFind) {
        List<Product> productList = productRepository.getAll();
        List<Product> productListByName = productRepository.find(nameFind);
        return productListByName;
    }

    @Override
    public List<Product> detail(int idDetail) {
        List<Product> productList = productRepository.getAll();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==idDetail){
                return productRepository.detail(i);
            }
        }
        return null;
    }

}
