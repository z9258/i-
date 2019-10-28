package com.db;

public class GoodsBean {
	//景区
	private int goods_id;//景区id
	private String goods_type;//景区类型
	private String goods_name;//景区名称
	private String goods_intro;//景区信息介绍
	private String goods_img;//景区图片
	private String goods_food;//特色美食
	private Double goods_price;//景区价格,成人
	private Double goods_stuPrice;//学生票价
	private Double goods_chPrice;//儿童票价
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(String goods_type) {
		this.goods_type = goods_type;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_intro() {
		return goods_intro;
	}
	public void setGoods_intro(String goods_intro) {
		this.goods_intro = goods_intro;
	}
	
	
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public String getGoods_food() {
		return goods_food;
	}
	public void setGoods_food(String goods_food) {
		this.goods_food = goods_food;
	}
	public Double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}
	public Double getGoods_stuPrice() {
		return goods_stuPrice;
	}
	public void setGoods_stuPrice(Double goods_stuPrice) {
		this.goods_stuPrice = goods_stuPrice;
	}
	public Double getGoods_chPrice() {
		return goods_chPrice;
	}
	public void setGoods_chPrice(Double goods_chPrice) {
		this.goods_chPrice = goods_chPrice;
	}
	
	
	
	
}
