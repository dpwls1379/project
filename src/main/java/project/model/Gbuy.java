package project.model;

import java.sql.Date;

public class Gbuy {
	private int buy_num;
	private String buy_addr;
	private String buy_memo;
	private String buy_deli;
	private Date buy_date;
	private int ct_num;
	private int pro_num;
	private String id;
	private String pro_name;
	private String pro_image;
	private int pro_price;
	private int ct_count;
	private int pro_sale;	
	
	public int getPro_sale() {
		return pro_sale;
	}

	public void setPro_sale(int pro_sale) {
		this.pro_sale = pro_sale;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_image() {
		return pro_image;
	}

	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public int getCt_count() {
		return ct_count;
	}

	public void setCt_count(int ct_count) {
		this.ct_count = ct_count;
	}

	public String getBuy_deli() {
		return buy_deli;
	}

	public void setBuy_deli(String buy_deli) {
		this.buy_deli = buy_deli;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public String getBuy_addr() {
		return buy_addr;
	}

	public void setBuy_addr(String buy_addr) {
		this.buy_addr = buy_addr;
	}

	public String getBuy_memo() {
		return buy_memo;
	}

	public void setBuy_memo(String buy_memo) {
		this.buy_memo = buy_memo;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public int getCt_num() {
		return ct_num;
	}

	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
