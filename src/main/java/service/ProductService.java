package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

import mapper.ProductMapper;
import model.Product;

@Service
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
public class ProductService implements IProductService{
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public void save(Product product) throws Exception {
		//完善数据
		Long maxId = mapper.selectMaxId();
		product.setPid(maxId+1L);
		mapper.insert(product);
	}

	@Override
	public void remove(Product product) throws Exception {
		mapper.delete(product);
	}

	@Override
	public void modify(Product product) throws Exception {
		mapper.update(product);
	}


	@Override
	@Transactional(readOnly=true)
	public JSONObject findByPage(JSONObject jsonobj) throws Exception {
		List<Product> list = mapper.selectByPage(jsonobj);
		Product[] products = list.toArray(new Product[list.size()]);
		
		Long count = mapper.selectCount(jsonobj);
		
		//封装格式为{total:98,rows:[{},{}]}的 JSONObject 并返回
		JSONObject jo = new JSONObject();
		jo.put("total", count);
		jo.put("rows", products);
		return jo;
	}

	@Override
	public void removeProducts(String[] pids) throws Exception {
		mapper.deleteProducts(pids);
	}
}
