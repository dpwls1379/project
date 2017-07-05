package project.model;

public class Gcart {
	//실제 DB
	private int ct_num;
	private String ct_del; //ct_del 추가
	private int pro_num;
	private String id;
	private int ct_count;
	
	
	private String pro_name;
	private int pro_sale;
	private int pro_price;
	private String pro_image;
	private String name;
	private String addr;
	private int tel;
	private String email;	
	
	
	
	
	public String getCt_del() {
		return ct_del;
	}
	public void setCt_del(String ct_del) {
		this.ct_del = ct_del;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_sale() {
		return pro_sale;
	}
	public void setPro_sale(int pro_sale) {
		this.pro_sale = pro_sale;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public int getCt_count() {
		return ct_count;
	}
	public void setCt_count(int ct_count) {
		this.ct_count = ct_count;
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
