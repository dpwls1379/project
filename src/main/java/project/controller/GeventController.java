package project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gevent;
import project.service.GeventService;
import project.service.PagingPgm;

@Controller
public class GeventController {
	@Autowired
	private GeventService ge;
	
	@RequestMapping("GeventForm")
	public String GeventForm() {
		return "Gevent/GeventForm";
	}
	
	@RequestMapping("Gevent")
	public String Gevent (Model model, Gevent gevent) {
		int result = ge.insert(gevent);
		model.addAttribute("result", result);
		return "Gevent/Gevent";
	}
	
	/*@RequestMapping("GeventList")
	public String GeventList(Model model) {
		List<Gevent> list = ge.list();
		model.addAttribute("list", list);
		return "Gevent/GeventList";
	}*/
	
	@RequestMapping("GeventList")
	public String GeventList(String pageNum, Gevent gevent, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = ge.getTotalEvent(); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		gevent.setStartRow(startRow);
		gevent.setEndRow(endRow);
		int no = total - startRow + 1;
		List<Gevent> list = ge.list(gevent);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "Gevent/GeventList";
	}
	
	@RequestMapping("GeventContent")
	public String GeventContent(Model model, int ev_num) {
		ge.readcount(ev_num);
		Gevent gevent = ge.content(ev_num);
		model.addAttribute("content", gevent);
		model.addAttribute("ev_num", ev_num);
		return "Gevent/GeventContent";
	}
	
	@RequestMapping("GeventUpdateForm")
	public String GeventUpdateForm(Model model, int ev_num) {
		Gevent gevent = ge.content(ev_num);
		model.addAttribute("list", gevent);
		model.addAttribute("ev_num", ev_num);
		return "Gevent/GeventUpdateForm";
	}
	
	@RequestMapping("GeventUpdate")
	public String GeventUpdate(Model model, Gevent gevent) {
		if(gevent.getEv_image() == "") {
			gevent.setEv_image("nothing.jpg");
		}
		int result = ge.update(gevent);
		model.addAttribute("result", result);
		model.addAttribute("ev_num", gevent.getEv_num());
		return "Gevent/GeventUpdate";
	}
	
	@RequestMapping("GeventDelete")
	public String GeventDelete(Model model, int ev_num) {
		int result = ge.delete(ev_num);
		model.addAttribute("result", result);
		return "Gevent/GeventDelete";
	}
	
	@RequestMapping("GeventSearch")
	public String GeventSearch(Model model, String search) {
		List<Gevent> list = ge.search(search);
		model.addAttribute("list",list);
		return "Gevent/GeventSearch";
	}
	
	@RequestMapping("GeventImage")
	public String GeventImage(Model model, String ev_image) {
		model.addAttribute("ev_image",ev_image);
		return "Gevent/GeventImage";
	}
	
	@RequestMapping("GeventMain")
	public String GeventMain(Model model) {
		List<Gevent> list = ge.evList();
		//ArrayList<Integer> list = new ArrayList<Integer>(); 
			/*for(int i=0; i<10; i++) { 
				list.add(i); 
			}*/
		model.addAttribute("list",list);
		return "Gevent/GeventMain";
	}
}

