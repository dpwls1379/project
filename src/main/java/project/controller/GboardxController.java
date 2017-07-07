package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.service.GboardxService;
import project.service.PagingPgm;
import project.model.Gboardx;

@Controller
public class GboardxController {
	@Autowired
	private GboardxService gs;

	@RequestMapping("GboardxList")
	public String GboardxList(String pageNum, Gboardx gbx, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = gs.getTotalRecordBoardx(); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		gbx.setStartRow(startRow);
		gbx.setEndRow(endRow);
		int no = total - startRow + 1;
		List<Gboardx> list = gs.list(gbx);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "/Gboardx/GboardxList";
	}

	@RequestMapping("GboardxList2")
	public String GproductList(String pageNum, Gboardx gbx, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = gs.getTotalRecordBoardx(); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		gbx.setStartRow(startRow);
		gbx.setEndRow(endRow);
		int no = total - startRow + 1;
		List<Gboardx> list2 = gs.list2(gbx);
		model.addAttribute("list2", list2);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "/Gboardx/GboardxList2";
	}

	/*
	 * @RequestMapping("GboardxList") public String GboardxList(Model model) {
	 * List<Gboardx> list = gs.list(); model.addAttribute("list",list); return
	 * "Gboardx/GboardxList"; }
	 * 
	 * @RequestMapping("GboardxList2") public String GboardxList2(Model model) {
	 * List<Gboardx> list = gs.list2(); model.addAttribute("list",list); return
	 * "Gboardx/GboardxList2"; }
	 */
	@RequestMapping("GboardxContent")
	public String GboardxContent(Model model, int bx_num) {
		gs.readcount(bx_num);
		Gboardx gb = gs.content(bx_num);
		model.addAttribute("content", gb);
		return "Gboardx/GboardxContent";
	}

	@RequestMapping("GboardxForm")
	public String GboardxForm() {
		return "Gboardx/GboardxForm";
	}

	@RequestMapping("GboardxForm2")
	public String GboardxForm2() {
		return "Gboardx/GboardxForm2";
	}

	@RequestMapping("Gboardx")
	public String Gboardx(Model model, Gboardx gboardx,HttpSession session) {
		String id=(String)session.getAttribute("id");
		
		gboardx.setId(id);
		
		int result = gs.insert(gboardx);
		model.addAttribute("result", result);
		model.addAttribute("bx_categ", gboardx.getBx_categ());
		return "Gboardx/Gboardx";
	}

	@RequestMapping("Gboardx2")
	public String Gboardx2(Model model, Gboardx gboardx, HttpSession session) {
		
		String id=(String)session.getAttribute("id");
		gboardx.setId(id);
		int result = gs.insert2(gboardx);
		model.addAttribute("result", result);
		return "Gboardx/Gboardx2";
	}

	@RequestMapping("GboardxUpdateForm")
	public String GboardxUpdateForm(Model model, int bx_num, String id) {
		Gboardx gbx = gs.content(bx_num);
		model.addAttribute("gbx", gbx);
		model.addAttribute("bx_num", bx_num);
		model.addAttribute("id", id);
		return "Gboardx/GboardxUpdateForm";
	}

	@RequestMapping("GboardxUpdate")
	public String GboardxUpdate(Model model, Gboardx gboardx) {
		int result = gs.update(gboardx);
		model.addAttribute("bx_num", gboardx.getBx_num());
		model.addAttribute("result", result);
		return "Gboardx/GboardxUpdate";
	}

	@RequestMapping("GboardxDelete")
	public String GboardxDelete(Model model, int bx_num, String bx_categ) {
		int result = gs.delete(bx_num);
		model.addAttribute("bx_categ", bx_categ);
		model.addAttribute("result", result);
		return "Gboardx/GboardxDelete";
	}

	@RequestMapping("search")
	public String search(Model model, String serc, String serct) {
		List<Gboardx> list = gs.search(serct, serc);
		model.addAttribute("list", list);
		model.addAttribute("serc", serc);
		model.addAttribute("serct", serct);
		return "Gboardx/GboardxList";
	}

	@RequestMapping("search2")
	public String search2(Model model, String serc, String serct) {
		List<Gboardx> list = gs.search2(serct, serc);
		model.addAttribute("list", list);
		model.addAttribute("serc", serc);
		model.addAttribute("serct", serct);
		return "Gboardx/GboardxList2";
	}

	@RequestMapping("Gcenter")
	public String Gcenter(Model model) {
		List<Gboardx> listn = gs.listn();
		List<Gboardx> listq = gs.listq();
		model.addAttribute("listn", listn);
		model.addAttribute("listq", listq);
		return "Gboardx/Gcenter";
	}
	
	@RequestMapping("GboardxMyList")
	public String GboardxMyList(String pageNum, Gboardx gbx, Model model,HttpSession session){
		
		String id=(String) session.getAttribute("id");
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = gs.getTotalRecordBoardx(); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		gbx.setStartRow(startRow);
		gbx.setEndRow(endRow);
		int no = total - startRow + 1;
		gbx.setId(id);
		List<Gboardx> list = gs.mylist(gbx);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "Gboardx/GboardxMyList";
	}
}
