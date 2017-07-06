package project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gbuy;
import project.model.Gcart;
import project.model.Gmember;
import project.model.Gproduct;
import project.service.GcartService;
import project.service.GmemberService;
import project.service.GproductService;

@Controller
public class GcartController {
	@Autowired
	private GcartService gs;
	
	@Autowired
	private GmemberService gms;
	
	@Autowired
	private GproductService gps;
	
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
		// id, pro_num으로 검색시, id값이 있나 없나 체크 여러개 있어도 dinstinct 사용해서 하나만 받아도 된다
		String ct_del = gs.selectDel(gcart);
		// id, pro_num으로 검색시, ct_del값이 y인지 n인지 체크하는 메소드, 단 ct_del이 여러값일때가 문제
		System.out.println(ct_del);
		if(chkId==null || chkId.equals("")) {
			result = gs.insert(gcart);
			//System.out.println("result   i  = "+result);
		} else if(/*ct_del=="y"*/ct_del.equals("y")) {
			result = gs.insert(gcart);
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
		System.out.println("gbuyForm userId="+userid);
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
		//Gcart member = gs.member(id);
		Gmember member = gms.select(id);
		model.addAttribute("userid",userid);
		model.addAttribute("member",member);
		model.addAttribute("tot",tot);
		model.addAttribute("info",info);
		return "Gbuy/GbuyForm";
	}
	
	@RequestMapping("GbuyNowForm")
	public String GbuyNowForm(Model model ,Gcart gcart, HttpSession session, int tot){		
		String id=(String)session.getAttribute("id");
		gcart.setId(id);		
		int result=gs.insert(gcart);
		System.out.println("gcart 등록 성공 했냐 안했냐"+result);
		Gcart gc=gs.content(gcart);
		Gcart gc2=gs.info(gc.getCt_num());		
		List<Gcart> info=new ArrayList<>();
		info.add(gc2);
		Gmember member=gms.select(id);
		String userid = gc2.getCt_num()+"-";
		
		model.addAttribute("userid",userid);
		model.addAttribute("tot",tot);
		model.addAttribute("member",member);
		model.addAttribute("info",info);
		return "Gbuy/GbuyForm";
	}
	
	@RequestMapping("buyNow")
	public String buyNow(int pro_num, int buy_count, Model model){
		
		Gproduct gpro=gps.pdContent(pro_num);
		int totalprice = (1 - gpro.getPro_sale()/100) * gpro.getPro_price() * buy_count;
		int totalsale = gpro.getPro_price() - totalprice ;
		
		model.addAttribute("buy_count",buy_count); // 상품 구매 수량
		model.addAttribute("gproduct",gpro); //상품정보
		model.addAttribute("totalsale",totalsale);//총 할인값
		model.addAttribute("buy_price",totalprice); //총 합계
		
		return "Gbuy/buyNowForm";
	}
	
	
	
}
