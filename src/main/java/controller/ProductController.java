package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import model.Product;
import service.IProductService;

@Controller
public class ProductController {

	@Autowired
	IProductService service;
	
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		return "index";
	}
	
	@RequestMapping(value="/showPageProducts",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object showPageProduct(@RequestBody JSONObject jsonobj) throws Exception{
		jsonobj = service.findByPage(jsonobj);
		return jsonobj;
	}
	
	@RequestMapping("/addProduct.do")
	@ResponseBody
	public String addProduct(Product product){
		try {
			service.save(product);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	@RequestMapping("/deleteProduct.do")
	@ResponseBody
	public String deleteProduct(Product product){
		try {
			service.remove(product);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	@RequestMapping("/editProduct.do")
	@ResponseBody
	public String editProduct(Product product){
		try {
			service.modify(product);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	/*
	 * 
	 */
	@RequestMapping("/deleteProducts.do")
	@ResponseBody
	public String deleteProducts(String ids){
		String[] pids = ids.split(",");
		
		try {
			service.removeProducts(pids);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	/*
	 * 
	 */
	@RequestMapping("/deleteProducts2.do")
	@ResponseBody
	public String deleteProducts2(String ids){
		String[] pids = ids.split(",");
		
		try {
			service.removeProducts(pids);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	
}
