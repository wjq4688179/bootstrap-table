package mapper;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

import model.Product;

public interface ProductMapper {

	public void insert(Product product)throws Exception;
	
	public void delete(Product product)throws Exception;
	
	public void deleteProducts(String[] pids)throws Exception;
	
	public void update(Product product)throws Exception;
	
	public Long selectMaxId()throws Exception;
	
	public List<Product> selectByPage(JSONObject jsonobj)throws Exception;
	
	public Long selectCount(JSONObject jsonobj)throws Exception;
}
