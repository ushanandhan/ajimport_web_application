package com.ushan.controller;

import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ushan.bean.Product;
import com.ushan.dao.impl.ProductDAO;

@Controller
@RequestMapping("/productRegistration")
public class ProductController {

	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/productRegistration")
	public String redirect()
	{
		return "productRegistration";
	}
	
	/*@RequestMapping(value="/productRegistration.htm",method=RequestMethod.POST)
	public @ResponseBody String addProduct(@RequestParam String productName,@RequestParam int productQuantity, @RequestParam int productPricePerEach){
		JSONArray mainArray = new JSONArray();
		try {
			Product product = new Product();
			product.setProductName(productName);
			product.setProductQuantity(productQuantity);
			product.setProductPrice(productPricePerEach);
			product.setDate(new Date());
			productDAO.add(product);
			List<Product> list = productDAO.getAllProducts();
			for (Product product2 : list) {
				JSONArray objectArray = new JSONArray();
				objectArray.put(product2.getProductQuantity());
				objectArray.put(product2.getProductName());
				objectArray.put(product2.getProductPrice());
				mainArray.put(objectArray);
			}
		} catch (Exception e) {
			return "Exception msg"+e.getMessage();
		}
		return mainArray.toString();
	}*/
	
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public @ResponseBody List<Product> addProduct(@RequestBody Product product){
		List<Product> list = null;
		try {
			product.setDate(new Date());
			productDAO.add(product);
			list = productDAO.getAllProducts();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	@RequestMapping(value="/getAllProducts",method=RequestMethod.GET)
	public @ResponseBody List<Product> getAllProducts(){
		List<Product> list = null;
		try {
			list = productDAO.getAllProducts();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}
