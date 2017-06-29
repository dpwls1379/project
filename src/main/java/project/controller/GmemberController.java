package project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gmember;
import project.service.GmemberService;

@Controller
public class GmemberController {
	@Autowired
	private GmemberService gs;
	
//	@RequestMapping("mainlogin")
//	public String mainlogin(){
//		return "Gmember/mainlogin";
//	}
	
	@RequestMapping("joinForm")
	public String joinForm(String id, Model model) {
		model.addAttribute("id",id);
		return "Gmember/joinForm";
	}
	@RequestMapping("join")
	public String join(Gmember gm, Model model) {
		int result = gs.insert(gm);
		model.addAttribute("result", result);
		return "Gmember/join";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "Gmember/loginForm";
	}
	@RequestMapping("login")
	public String login(Gmember gm, Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int result = gs.login(id,pass);
		HttpSession session = request.getSession();
		if (result > 0) {
			model.addAttribute("result",result);
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			return "Gmember/login";
		} else {
			model.addAttribute("result",result);
			return "Gmember/login";
		}
	}
	@RequestMapping("logout")
	public String logout() {
		return "Gmember/logout";
	}
	// 가상메인 수정필요
	@RequestMapping("main")
	public String main() {
		return "Gmember/loginForm";
	}
	@RequestMapping("updateFormGmem")
	public String updateFormGmem(Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		Gmember gmember = gs.select(id);
		model.addAttribute("gmember",gmember);
		return "Gmember/updateFormGmem";
	}
	@RequestMapping("updateGmem")
	public String updateGmem(Gmember gm, Model model, HttpServletRequest request) {
		int result = gs.update(gm);
		model.addAttribute("result",result );
		return "Gmember/updateGmem";
	}
	@RequestMapping("gmemberLeave")
	public String gmemberLeave(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		int gmem = gs.delete(id);
		model.addAttribute("gmem",gmem);
		return "Gmember/gmemberLeave";
	}
	@RequestMapping("confirm")
	public String confirm(String id, Model model) {
		int result = gs.confirm(id);
		model.addAttribute("result",result);
		model.addAttribute("id",id);
		return "Gmember/confirm";
	}
	
	@RequestMapping("gmMypage")
	public String gmMypage(HttpSession session){
		String id=(String) session.getAttribute("id");
		System.out.println("sessionChk="+id);
		if(id.equals("master")){
			return "Gadmin/adminList";
		}
		return "Gmember/memMypage";
	}
	
}
