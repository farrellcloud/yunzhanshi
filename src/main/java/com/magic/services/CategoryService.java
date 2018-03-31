package com.magic.services;

import java.util.List;

import com.magic.domain.Category;

public interface CategoryService {
	public void saveOrUpdate(Category category);
	public boolean delete(Integer cateId);
	public List<Category> getAll();
	public Category getById(Integer cateId);
}
