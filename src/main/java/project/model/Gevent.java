package project.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Gevent {
	private int ev_num;
	private String ev_subject;
	private String ev_content;
	private String ev_image;
	private Date ev_date;
	private int ev_read;
	private String ev_del;
	
//페이징 작업	
	private int startRow;
	private int endRow;
	
//이미지 업로드 작업
	private MultipartFile file1;//이벤트 이미지 
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
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
	public int getEv_num() {
		return ev_num;
	}
	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}
	public String getEv_subject() {
		return ev_subject;
	}
	public void setEv_subject(String ev_subject) {
		this.ev_subject = ev_subject;
	}
	public String getEv_content() {
		return ev_content;
	}
	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}
	public String getEv_image() {
		return ev_image;
	}
	public void setEv_image(String ev_image) {
		this.ev_image = ev_image;
	}
	public Date getEv_date() {
		return ev_date;
	}
	public void setEv_date(Date ev_date) {
		this.ev_date = ev_date;
	}
	public int getEv_read() {
		return ev_read;
	}
	public void setEv_read(int ev_read) {
		this.ev_read = ev_read;
	}
	public String getEv_del() {
		return ev_del;
	}
	public void setEv_del(String ev_del) {
		this.ev_del = ev_del;
	}
	
}