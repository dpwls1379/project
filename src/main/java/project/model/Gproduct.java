package project.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Gproduct {
	private int pro_num;
	private String pro_cate;
	private String pro_name;
	private int pro_price;
	private int pro_sale;
	private String pro_info;
	private String pro_image;
	private Date pro_date;
	private int pro_count;
	private int pro_sell;
	private int pro_read;
	//페이징 작업
	private int startRow;
	private int endRow;
	
	
	//이미지 업로드 작업
	private MultipartFile file1;//상품 이미지 
	private MultipartFile file2;//상품 상세 이미지
	
	
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPro_read() {
		return pro_read;
	}
	public void setPro_read(int pro_read) {
		this.pro_read = pro_read;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(String pro_cate) {
		this.pro_cate = pro_cate;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_sale() {
		return pro_sale;
	}
	public void setPro_sale(int pro_sale) {
		this.pro_sale = pro_sale;
	}
	public String getPro_info() {
		return pro_info;
	}
	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}
	public int getPro_count() {
		return pro_count;
	}
	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}
	public int getPro_sell() {
		return pro_sell;
	}
	public void setPro_sell(int pro_sell) {
		this.pro_sell = pro_sell;
	}	
}
