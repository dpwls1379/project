package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gproduct;
import project.service.GbuyService;
import project.service.GproductService;

@Controller
public class GbuyController {

	@Autowired
	private GbuyService gs;

	
	@RequestMapping("Gbuy")
	public String Gbuy(Model model) {
		
		return "Gbuy/Gbuy";
	}
	
	
	
	
	
	
	
}
