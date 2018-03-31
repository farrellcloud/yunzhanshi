package com.magic.controller.admin;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.magic.VO.CategoryVO;
import com.magic.VO.ProductVO;
import com.magic.VO.UserVO;
import com.magic.domain.Category;
import com.magic.domain.Product;
import com.magic.domain.User;
import com.magic.interceptor.Token;
import com.magic.services.CategoryService;
import com.magic.services.ProductService;
import com.magic.services.UserService;
import com.magic.util.Constant;
import com.magic.util.ImageUtil;
import com.magic.util.PropertiesUtil;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	private void loadData(Object o){
		List<Category> categorys = categoryService.getAll();
		if(categorys != null){
			if(o instanceof RedirectAttributes){
				RedirectAttributes attr = (RedirectAttributes)o;
				attr.addFlashAttribute("categorys", categorys);
			}else if(o instanceof Model){
				Model model = (Model)o;
				model.addAttribute("categorys", categorys);
			} 
		}
	}

	@RequestMapping(value = "/login")
	@Token(save = true)
	public String login(@ModelAttribute @Valid User user, BindingResult result, HttpSession session,HttpServletRequest request) {
		return "/admin/login";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	@Token(remove = true)
	public ModelAndView doLogin(@ModelAttribute @Valid UserVO userVO, BindingResult result, HttpSession session,
			RedirectAttributes attr) {
		if (result.hasErrors()) {
			ModelAndView view = new ModelAndView("redirect:/admin/login");
			attr.addFlashAttribute("org.springframework.validation.BindingResult.userVO", result);
			return view;
		}

		User user = userService.getUser(userVO.getUsername(), userVO.getPassword());
		if (user != null && user.getId() != null) {
			session.setAttribute(Constant.ADMINUSER, user);
			return new ModelAndView("redirect:/admin/index");
		} else {
			result.addError(new FieldError("userVO", "password", "用户名或密码不正确"));
			ModelAndView view = new ModelAndView("redirect:/admin/login");
			attr.addFlashAttribute("org.springframework.validation.BindingResult.userVO", result);
			return view;
		}
	}

	@RequestMapping("/exit")
	public String exit(HttpSession session, Model model) {
		session.removeAttribute(Constant.ADMINUSER);
		return "redirect:/admin/login";
	}

	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		this.loadData(model);
		return "/admin/index";
	}

	@RequestMapping("/account")
	@Token(save = true)
	public String account(HttpSession session, Model model) {
		this.loadData(model);
		return "/admin/account";
	}

	@RequestMapping(value = "/setAccount", method = RequestMethod.POST)
	@Token(remove = true)
	public ModelAndView setAccount(@ModelAttribute @Valid UserVO userVO, BindingResult result, HttpSession session,
			RedirectAttributes attr) {
		ModelAndView view = new ModelAndView("redirect:/admin/account");
		if (result.hasErrors()) {
			attr.addFlashAttribute("org.springframework.validation.BindingResult.userVO", result);
			return view;
		}
		User user = (User) session.getAttribute(Constant.ADMINUSER);
		boolean returnValue = userService.modifyPassword(user.getId(), userVO.getPassword());
		if (returnValue) {
			result.addError(new FieldError("userVO", "password", "密码修改成功，请记住新密码！"));
		} else {
			result.addError(new FieldError("userVO", "password", "修改密码失败"));
		}
		attr.addFlashAttribute("org.springframework.validation.BindingResult.userVO", result);
		return view;
	}
	
	@RequestMapping("/category/{cateId}")
	@Token(save = true)
	public String category(HttpServletRequest request,@PathVariable Integer cateId,Model model) {
		Category category = categoryService.getById(cateId);
		if(category != null){
			model.addAttribute("category", category);
		}
		loadData(model);
		return "/admin/category";
	}
	
	@RequestMapping("/category")
	@Token(save = true)
	public String category(HttpServletRequest request,Model model) {
		loadData(model);
		return "/admin/category";
	}
	
	@RequestMapping(value = "/doCategory", method = RequestMethod.POST)
	@Token(remove = true)
	public ModelAndView doCategory(@ModelAttribute @Valid CategoryVO categoryVO, BindingResult result, HttpSession session,RedirectAttributes attr) {
		ModelAndView view = null;
		if (result.hasErrors()) {
			if(categoryVO.getCateId() != null){
				view = new ModelAndView("redirect:/admin/category/" + categoryVO.getCateId());
			}else{
				view = new ModelAndView("redirect:/admin/category");
			}
			attr.addFlashAttribute("org.springframework.validation.BindingResult.categoryVO", result);
			return view;
		}
		Category category = null;
		if(categoryVO.getCateId() != null){
			category = categoryService.getById(categoryVO.getCateId());
			category.setUpdateTime(Long.toString(new Date().getTime()));
		}else{
			category = new Category();
			String time = Long.toString(new Date().getTime());
			category.setCreateTime(time);
			category.setUpdateTime(time);
		}
		try {
			BeanUtils.copyProperties(category, categoryVO);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		categoryService.saveOrUpdate(category);
		view = new ModelAndView("redirect:/admin/index");
		return view;
	}
	
	@RequestMapping(value = "/removeCategory/{cateId}", method = RequestMethod.POST)
	@ResponseBody
	public String removeCategory(@PathVariable Integer cateId) {
		boolean returnValue = categoryService.delete(cateId);
		JSONObject json = new JSONObject();
		json.put("returnValue", returnValue);
		return json.toJSONString();
	}
	
	@RequestMapping("/product/{productId}")
	@Token(save = true)
	public String product(HttpServletRequest request,@PathVariable Integer productId,Model model) {
		loadData(model);
		Product product = productService.getById(productId);
		if(product != null){
			model.addAttribute("product", product);
			String url = request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf("admin")) + "show/" + product.getProductName();
			model.addAttribute("url",url);
		}
		return "/admin/product";
	}
	
	@RequestMapping("/product")
	@Token(save = true)
	public String product(HttpServletRequest request,Model model) {
		String cateId = request.getParameter("cateId");
		if(StringUtils.isNotBlank(cateId)){
			Category category = categoryService.getById(NumberUtils.toInt(cateId));
			if(category != null){
				model.addAttribute("category", category);
			}
		}
		loadData(model);
		return "/admin/product";
	}
	
	@RequestMapping("/validatePN")
	@ResponseBody
	public String validatePN(@RequestParam String productName,@RequestParam Integer productId){
		return Boolean.toString(productService.validatePN(productName,productId));
	}
	
	@RequestMapping(value = "/doProduct", method = RequestMethod.POST)
	@Token(remove = true)
	public ModelAndView doProduct(@ModelAttribute @Valid ProductVO productVO,BindingResult result, HttpSession session,RedirectAttributes attr,HttpServletRequest request) {
		ModelAndView view = null;
		Product product = null;
		try {
			PropertiesUtil props = new PropertiesUtil("settings.properties");
			String fileSuffix = props.getProperty("fileSuffix", ".zip");
			String filePath = ImageUtil.getFilePath(props,"filePath",request.getSession().getServletContext().getRealPath("/") + "magic");
			String imageFilePath = ImageUtil.getFilePath(props,"imagePath",request.getSession().getServletContext().getRealPath("/") + "magic/images");
			if(productVO.getProductId() != null){
				view = new ModelAndView("redirect:/admin/product/" + productVO.getProductId());
			}else{
				view = new ModelAndView("redirect:/admin/product");
			}
			if(productVO.getProductId() == null && (productVO.getCompressedFile().getSize() == 0 || productVO.getCompressedFile() == null)){
				result.addError(new FieldError("productVO", "compressedFile", "上传文件不能为空"));
			}else if(StringUtils.isNotBlank(productVO.getCompressedFile().getOriginalFilename()) && !(productVO.getCompressedFile().getOriginalFilename().contains(fileSuffix))){
				result.addError(new FieldError("productVO", "compressedFile", "文件必须是zip"));
			}
			if(productVO.getProductId() == null && (productVO.getThumbFile().getSize() == 0 || productVO.getThumbFile() == null)){
				result.addError(new FieldError("productVO", "thumbFile", "缩略图不能为空"));
			}
			Product productTmp =  productService.getByProductName(productVO.getProductName());
			if(productTmp != null && !productTmp.getId().equals(productVO.getProductId())){
				result.addError(new FieldError("productVO", "productName", "项目名称已注册"));
			}
			if (result.hasErrors()) {
				attr.addFlashAttribute("org.springframework.validation.BindingResult.productVO", result);
				return view;
			}
			String fileName = null;
			if(productVO.getCompressedFile() != null && productVO.getCompressedFile().getSize() != 0){
				fileName = productVO.getCompressedFile().getOriginalFilename();
				fileName = new Date().getTime() + fileName;
				File outputFile = new File(filePath, fileName);
				productVO.getCompressedFile().transferTo(outputFile);
			}
			String imageName = null;
			if(productVO.getThumbFile() != null && productVO.getThumbFile().getSize() != 0){
				imageName = productVO.getThumbFile().getOriginalFilename();
				imageName = new Date().getTime() + imageName.substring(imageName.lastIndexOf("."));
				File outputFile = new File(imageFilePath, imageName);
				productVO.getThumbFile().transferTo(outputFile);
			}
			if(productVO.getProductId() != null){
				product = productService.getById(productVO.getProductId());
				product.setUpdateTime(Long.toString(new Date().getTime()));
			}else{
				product = new Product();
				String time = Long.toString(new Date().getTime());
				product.setCreateTime(time);
				product.setUpdateTime(time);
				product.setStartX("0");
				product.setStartY("0");
			}
			BeanUtils.copyProperties(product, productVO);
			if(fileName != null){
				if(productVO.getProductId() != null){
					File file = new File(filePath,product.getFileName() + fileSuffix);
					if(file.canWrite()){
						file.deleteOnExit();
					}
				}
				product.setFileName(fileName.substring(0, fileName.lastIndexOf(fileSuffix)));
			}
			if(imageName != null){
				if(productVO.getProductId() != null){
					File file = new File(imageFilePath,product.getThumbImage() + fileSuffix);
					if(file.canWrite()){
						file.deleteOnExit();
					}
				}
				product.setThumbImage(imageName);
			}
			productService.savaOrUpdate(product);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		loadData(attr);
		request.getSession(false).setAttribute("token", UUID.randomUUID().toString());
		view = new ModelAndView("redirect:/admin/product/" + product.getId());
		attr.addFlashAttribute("product_step", "1");
		return view;
	}
	
	@RequestMapping(value = "/removeProduct/{productId}")
	public String removeProduct(@PathVariable Integer productId,HttpServletRequest request,RedirectAttributes attr) {
		String cateId = request.getParameter("cateId");
		if(StringUtils.isNotBlank(cateId)){
			Category category = categoryService.getById(NumberUtils.toInt(cateId));
			if(category != null){
				attr.addFlashAttribute("category", category);
			}
		}
		productService.delete(productId);
		return "redirect:/admin/index";
	}
	
	@RequestMapping("/rehearse/{productId}")
	public String rehearse(@PathVariable Integer productId,HttpServletRequest request,Model model) {
		Product product = productService.getById(productId);
		if(product != null){
			model.addAttribute("product", product);
		}
		return "/admin/rehearse";
	}
	
	@RequestMapping(value = "/setStartXY", method = RequestMethod.POST)
	@Token(remove = true)
	public ModelAndView setStartXY(@RequestParam String startX,@RequestParam String startY,@RequestParam Integer productId,RedirectAttributes attr){
		startX = startX.substring(2);
		startY = startY.substring(2);
		productService.setStartXY(productId, startX, startY);
		ModelAndView view = new ModelAndView("redirect:/admin/product/" + productId);
		attr.addFlashAttribute("product_step", "2");
		loadData(attr);
		return view;
	}
}
