package com.magic.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magic.domain.Category;
import com.magic.domain.Product;
import com.magic.repository.CategoryRepository;
import com.magic.repository.ProductRepository;
import com.magic.services.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	public void saveOrUpdate(Category category) {
		categoryRepository.save(category);
	}

	public boolean delete(Integer cateId) {
		List<Product> products = productRepository.getByCateId(cateId);
		if(products != null && products.size() > 0)
			return false;
		categoryRepository.delete(cateId);
		return true;
	}

	public List<Category> getAll() {
		List<Category> list = categoryRepository.getAll();
		if(list != null){
			for(Category category : list){
				category.setProducts(productRepository.getByCateId(category.getId()));
			}
		}
		return list;
	}

	public Category getById(Integer cateId) {
		return categoryRepository.findOne(cateId);
	}
	
}
