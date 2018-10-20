package model;

import java.util.Date;

/*
 *`pid` varchar(255) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pdate` date DEFAULT NULL
 */
public class Product {

	private Long pid;
	private String pname;
	private Double price;
	private String pdate;
	
	
	public Long getPid() {
		return pid;
	}
	public void setPid(Long pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	
	
}
