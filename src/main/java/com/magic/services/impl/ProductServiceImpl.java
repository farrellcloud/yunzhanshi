package com.magic.services.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magic.domain.Product;
import com.magic.repository.ProductRepository;
import com.magic.services.ProductService;
import com.magic.util.ImageUtil;
import com.magic.util.PropertiesUtil;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	public void savaOrUpdate(Product product) {
		productRepository.save(product);
	}

	public boolean delete(Integer productId) {
		PropertiesUtil props;
		try {
			props = new PropertiesUtil("settings.properties");
			String filePath = ImageUtil.getFilePath(props,"filePath","");
			String fileSuffix = props.getProperty("fileSuffix", ".zip");
			Product product = this.getById(productId);
			if(product != null){
				File file = new File(filePath,product.getFileName() + fileSuffix);
				if(file.exists() && file.canWrite()){
					file.deleteOnExit();
				}
				productRepository.delete(productId);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public Product getByProductName(String productName) {
		return productRepository.getByProductName(productName);
	}

	public Product getById(Integer productId) {
		return productRepository.findOne(productId);
	}

	public void setStartXY(Integer productId, String startX, String startY) {
		Product product = this.getById(productId);
		if(product != null){
			product.setStartX(startX);
			product.setStartY(startY);
			productRepository.save(product);
		}
	}

	public boolean validatePN(String productName,Integer productId) {
		Product product = this.getByProductName(productName);
		if(product != null && product.getId() != null && !product.getId().equals(productId)){
			return false;
		}
		return true;
	}
}
