package project.model;

public class Gbuy {
	private int buy_num;
	private String buy_addr;
	private String buy_memo;
	private String buy_date;
	private int buy_price;
	private String buy_deli;
	private int ct_num;
	private int pro_num;
	private String id;
	
	

	public String getBuy_deli() {
		return buy_deli;
	}

	public void setBuy_deli(String buy_deli) {
		this.buy_deli = buy_deli;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
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

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
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
