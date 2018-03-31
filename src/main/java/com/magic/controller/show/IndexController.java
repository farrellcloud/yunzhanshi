package com.magic.controller.show;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.magic.domain.Category;
import com.magic.domain.Product;
import com.magic.services.CategoryService;
import com.magic.services.ProductService;
import com.magic.util.PropertiesUtil;

@Controller
public class IndexController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/")
	public String index(Model model){
		List<Category> categorys = categoryService.getAll();
		model.addAttribute("categorys", categorys);
		PropertiesUtil props;
		try {
			props = new PropertiesUtil("settings.properties");
			String imageURL = props.getProperty("imageURL", "");
			model.addAttribute("imageURL", imageURL);
			model.addAttribute("index", 0);
			model.addAttribute("catename", "精品展示");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping("/category/{cateId}")
	public String categoryShow(@PathVariable Integer cateId,Model model){
		model.addAttribute("cateId",cateId);
		String pageUrl =  this.index(model);
		Map<String,Object> modelMap = model.asMap();
		List<Category> categorys = (List<Category>)modelMap.get("categorys");
		if (categorys!=null ) {
			Category category=categoryService.getById(cateId);
			model.addAttribute("catename", category.getCateName());
			
		}
		model.addAttribute("index", this.indexOf(categorys, cateId));
		return pageUrl;
	}
	
	@RequestMapping("/show/{productName}")
	public String show(@PathVariable String productName,Model model){
		Product product = productService.getByProductName(productName);
		if(product != null){
			model.addAttribute("product", product);
		}
		return "show";
	}
	
	private Integer indexOf(List<Category> categorys,Integer cateId){
		for(int i=0;i < categorys.size();i++){
			if(categorys.get(i).getId().equals(cateId)){
				return i;
			}
		}
		return 0;
	}
}
