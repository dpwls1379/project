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
	
	@Autowired
	private GproductService gps;
	
/*	@RequestMapping("buyNow")
	public String buyNow(int pro_num, int buy_count, Model model){
		
		Gproduct gpro=gps.pdContent(pro_num);
		int totalprice = (1 - gpro.getPro_sale()/100) * gpro.getPro_price() * buy_count;
		int totalsale = gpro.getPro_price() - totalprice ;
		
		model.addAttribute("buy_count",buy_count); // 상품 구매 수량
		model.addAttribute("gproduct",gpro); //상품정보
		model.addAttribute("totalsale",totalsale);//총 할인값
		model.addAttribute("buy_price",totalprice); //총 합계
		
		return "Gbuy/buyNowForm";
	}*/
	
	@RequestMapping("Gbuy")
	public String Gbuy(Model model) {
		
		return "Gbuy/Gbuy";
	}
	
	
	
	
	
}
