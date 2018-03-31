package com.magic.VO;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProductVO {
	
	private Integer productId;
	
	@NotEmpty(message="项目名称不能为空")
	private String productName;
	@NotEmpty(message="背景颜色不能为空")
	private String backgroundColor;
	@NotEmpty(message="标题不能为空")
	private String title;
	@NotEmpty(message="关键字不能为空")
	private String keywords;
	@NotEmpty(message="描述不能为空")
	private String description;
	private CommonsMultipartFile compressedFile;
	@NotEmpty(message="类别不能为空")
	private String cateId;
	private CommonsMultipartFile thumbFile;
	@NotEmpty(message="显示类型不能为空")
	private String showType;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public CommonsMultipartFile getCompressedFile() {
		return compressedFile;
	}
	public void setCompressedFile(CommonsMultipartFile compressedFile) {
		this.compressedFile = compressedFile;
	}
	public String getCateId() {
		return cateId;
	}
	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	public CommonsMultipartFile getThumbFile() {
		return thumbFile;
	}
	public void setThumbFile(CommonsMultipartFile thumbFile) {
		this.thumbFile = thumbFile;
	}
	public String getShowType() {
		return showType;
	}
	public void setShowType(String showType) {
		this.showType = showType;
	}
	
	
}
