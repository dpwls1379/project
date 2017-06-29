package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gcart;
import project.model.Gproduct;
import project.service.GcartService;

@Controller
public class GcartController {
	@Autowired
	private GcartService gs;
	
	@RequestMapping("Gcart")
	public String GproductCart(Model model, Gcart gcart) {
		int result;
		String chkId = gs.selectId(gcart);
		if(chkId==null) {
			result = gs.insert(gcart);			
		} else {
			result = gs.update(gcart);
		}
		model.addAttribute("id",gcart.getId());
		model.addAttribute("result",result);
		return "Gcart/Gcart";
	}
	@RequestMapping("GcartList")
	public String GcartList(Model model, String id) {
		List<Gcart> gcart = gs.list(id);
		model.addAttribute("gcart",gcart);
		return "Gcart/GcartList";
	}

	
}
