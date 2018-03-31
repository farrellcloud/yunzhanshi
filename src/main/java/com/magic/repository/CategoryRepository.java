package com.magic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.magic.domain.Category;

@Repository("categoryRepository")
public interface CategoryRepository extends CrudRepository<Category, Integer>{
	@Query("from Category order by createTime desc")
	public List<Category> getAll();
}
