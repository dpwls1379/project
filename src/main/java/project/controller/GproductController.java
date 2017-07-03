package project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.service.GproductService;
import project.service.PagingPgm;
import project.model.Gproduct;

@Controller
public class GproductController {
	@Autowired
	private GproductService gps;
	
	@RequestMapping("GproductList")
	public String GproductList(String pageNum, Gproduct gp, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = gps.getTotalRecordProduct(); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		gp.setStartRow(startRow);
		gp.setEndRow(endRow);
		int no = total - startRow + 1;
		List<Gproduct> list = gps.list(gp);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "/Gproduct/GproductList";
	}
	@RequestMapping("GproductForm")
	public String GproductForm(Model model) {
		
		List<String> category = new ArrayList<String>();

		category.add("화장품"); 
		category.add("의류"); 
		category.add("가전제품");
		category.add("식료품");
		category.add("핸드폰");
		category.add("농수산물");
		category.add("스포츠용품");
		category.add("기타");
		
		System.out.println(category.stream());
		model.addAttribute("cate", category);
		
		return "Gproduct/GproductForm";
	}
//	@RequestMapping("Gproduct")
//	public String Gproduct(Model model, Gproduct gproduct) {
//		int result = gps.insert(gproduct);
//		model.addAttribute("result",result);
//		return "Gproduct/Gproduct";
//	}
	@RequestMapping("GproductList")
	public String GproductList(Model model, Gproduct gp) {
		List<Gproduct> list = gps.list(gp);
		model.addAttribute("list",list);
		return "Gproduct/GproductList";
	}
	@RequestMapping("GproductDelete")
	public String GproductDelete(Model model, int pro_num) {
		int result = gps.delete(pro_num);
		model.addAttribute("result",result);
		return "Gproduct/GproductDelete";
	}
	@RequestMapping("GproductUpdateForm")
	public String GproductUpdateForm(Model model, int pro_num) {
		Gproduct gproduct = gps.pdContent(pro_num);
		model.addAttribute("list",gproduct);
		model.addAttribute("pro_num",pro_num);
		return "Gproduct/GproductUpdateForm";
	}
	@RequestMapping("GproductUpdate")
	public String GproductUpdate(Model model, Gproduct gproduct) {
		if(gproduct.getPro_info() == ""){
			gproduct.setPro_info("nothing.jpg");
		}
		int result = gps.update(gproduct);
		model.addAttribute("result",result);
		return "Gproduct/GproductUpdate";
	}
	@RequestMapping("GproductMain")
	public String GproductMain(Model model) {
		List<Gproduct> list = gps.pdList();
		List<Gproduct> list2 = gps.pdList2();
		List<Gproduct> list3 = gps.pdList3();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		return "Gproduct/GproductMain";
	}
	@RequestMapping("GproductInfo")
	public String productList(Model model, int pro_num) {
		gps.readcount(pro_num);
		Gproduct gproduct = gps.pdContent(pro_num);
		model.addAttribute("list",gproduct);
		return "Gproduct/GproductInfo";
	}
	@RequestMapping("GproductSearch")
	public String GproductSearch(Model model, String search) {
		List<Gproduct> list = gps.search(search);
		model.addAttribute("list",list);
		return "Gproduct/GproductSearch";
	}
	@RequestMapping("GproductImage")
	public String GproductImage(Model model, String pro_image) {
		model.addAttribute("pro_image",pro_image);
		return "Gproduct/GproductImage";
	}

}
