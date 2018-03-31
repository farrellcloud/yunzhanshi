package com.magic.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.magic.domain.Product;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {
	public List<Product> getByCateId(Integer cateId);
	public Product getByProductName(String productName);
}
