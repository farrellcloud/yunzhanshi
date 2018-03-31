package com.magic.VO;


import org.hibernate.validator.constraints.NotEmpty;

public class CategoryVO {

	private Integer cateId;
	
	@NotEmpty(message="类别名称不能为空")
	private String cateName;

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	

	
	
	
}
