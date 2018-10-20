package service;

import com.alibaba.fastjson.JSONObject;

import model.Product;

public interface IProductService {

	public void save(Product product)throws Exception;
	
	public void remove(Product product)throws Exception;
	
	public void removeProducts(String[] pids)throws Exception;
	
	public void modify(Product product)throws Exception;
	
	public JSONObject findByPage(JSONObject jsonobj)throws Exception;
	
}
