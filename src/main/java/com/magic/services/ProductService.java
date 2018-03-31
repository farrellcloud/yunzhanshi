package com.magic.services;

import com.magic.domain.Product;

public interface ProductService {
	
	public void savaOrUpdate(Product product);
	
	public boolean delete(Integer productId);
	
	public Product getByProductName(String productName); 
	
	public Product getById(Integer productId); 
	
	public void setStartXY(Integer productId,String startX,String Y);
	
	public boolean validatePN(String productName,Integer productId);
}
