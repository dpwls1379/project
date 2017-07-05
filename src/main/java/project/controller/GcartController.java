package project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gcart;
import project.service.GcartService;

@Controller
public class GcartController {
	@Autowired
	private GcartService gs;
	
	@RequestMapping("Gcart")
	public String GproductCart(Model model, Gcart gcart, HttpSession session) {
		int result = 0;
		String id=(String) session.getAttribute("id");
		//gcart.setId(id);
		//System.out.println("pro_num = "+gcart.getPro_num());
		//System.out.println("controller.id = "+id);
		//System.out.println("controller.name =" + gcart.getPro_name());
		gcart.setId(id);
		String chkId = gs.selectId(gcart);
		if(chkId==null) {
			result = gs.insert(gcart);
			//System.out.println("result   i  = "+result);
		} else {
			result = gs.update(gcart);
			//System.out.println("result u = "+result);
		}
		model.addAttribute("gcart",gcart);
		model.addAttribute("result",result);
		return "Gcart/Gcart";
	}
	@RequestMapping("GcartList")
	public String GcartList(Model model,HttpSession session) {
		String id=(String) session.getAttribute("id");
		List<Gcart> gcart = gs.list(id);
		model.addAttribute("gcart",gcart);
		//model.addAttribute("id",id);
		return "Gcart/GcartList";
	}
	@RequestMapping("GcartDelete")
	public String GcartDelete(Model model, String userid, HttpSession session) {
		int result=0;
		String[] ct_string = userid.split("-");
		int [] ct_num = new int[ct_string.length];
		for(int i=0; i<ct_string.length; i++) {
		    ct_num[i] = Integer.parseInt(ct_string[i]);
		}
		try {
		    for(int j=0; j<ct_num.length; j++) {
		    	result = gs.delete(ct_num[j]);	    	
		    }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	    model.addAttribute("result",result);
	    //model.addAttribute("id",id);
	    return "Gcart/GcartDelete";
	}
	@RequestMapping("GbuyForm")
	public String GbuyForm(Model model,String userid, HttpSession session, Gcart gcart ,int tot) {
		//int totprice = Integer.parseInt(tot);
		String id=(String) session.getAttribute("id");
		List<Gcart> info = new ArrayList<Gcart>();
		String[] ct_string = userid.split("-");
		int [] ct_num = new int[ct_string.length];		
		for(int i=0; i<ct_string.length; i++) {
		    ct_num[i] = Integer.parseInt(ct_string[i]);
		}
		try {
		    for(int j=0; j<ct_num.length; j++) {
		    	info.add(gs.info(ct_num[j]));
		    	//info = gs.info(ct_num[j]);	    	
		    }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		Gcart member = gs.member(id);
		model.addAttribute("member",member);
		model.addAttribute("tot",tot);
		model.addAttribute("info",info);
		return "Gbuy/GbuyForm";
	}
}
