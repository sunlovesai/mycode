package com.maybo.model;
/**
 * 定义sec的属性和setter  and  getter 方法
 */
import java.util.Date;

public class Sec {
	/*
	 * id:编号，自增 sec_code:证券号码 sec_name:证券名称 price:证券价格 update_time:最后更新时间
	 */
	private int id;
	private String sec_code;
	private String sec_name;
	private float price;
	private Date update_time;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSec_code() {
		return sec_code;
	}

	public void setSec_code(String sec_code) {
		this.sec_code = sec_code;
	}

	public String getSec_name() {
		return sec_name;
	}

	public void setSec_name(String sec_name) {
		this.sec_name = sec_name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	@Override
	public String toString() {
		return "Sec [id=" + id + ", sec_code=" + sec_code + ", sec_name=" + sec_name + ", price=" + price
				+ ", update_time=" + update_time + "]";
	}

}
