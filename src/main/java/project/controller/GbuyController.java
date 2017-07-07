package project.controller;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import project.model.Gproduct;
import project.service.GboardoService;
import project.service.GbuyService;
import project.service.GcartService;
import project.service.GproductService;
import project.model.Gboardo;
import project.model.Gbuy;

@Controller
public class GbuyController {

	@Autowired
	private GbuyService gs;
	
	@Autowired
	private GproductService gps;
	
	@Autowired
	private GcartService gsv;
	
	@Autowired
	private GboardoService gbs;
	
	@RequestMapping("GbuyChk")
	public String GbuyChk(Model model, HttpSession session, Gbuy gbuy, int tot, String userid) {
		int result = 0;
		int pro_num=0;
		String id=(String) session.getAttribute("id");
		gbuy.setId(id);
		String[] ct_string = userid.split("-");
		int [] ct_num = new int[ct_string.length];		
		for(int i=0; i<ct_string.length; i++) {
		    ct_num[i] = Integer.parseInt(ct_string[i]);
		}
		for(int j=0; j<ct_num.length; j++) {
			gsv.updateCart(ct_num[j]);
			// 카트의 장바구니 여부를 y로 업데이트해서 장바구니에서 안보이게 만든다
			// update Gcart set ct_del='y' where ct_num=#{ct_num}
			int ct_count = gsv.ct_count(ct_num[j]);
			// ct_num에 있는 상품의 구입개수 count를 리스트로 저장한다
			// select ct_count from Gcart where ct_num=#{ct_num}
			pro_num = gsv.pro_num(ct_num[j]);
			// ct_num에 있는 상품넘버 pro_num을 리스트로 저장한다
			// select pro_num from Gcart where ct_num=#{ct_num}		
			gps.updateCount(ct_count, pro_num);
			// product에 있는 pro_num의 상품의 보유개수 pro_count에 ct_count를 빼줘 수량을 조절한다
			// update Gproduct set pro_count = pro_count-#{ct_count} where pro_num=#{pro_num}
			gps.updateSell(ct_count,pro_num);
			// Sell을 증가시킨다			
			gbuy.setCt_num(ct_num[j]);
			gbuy.setPro_num(pro_num);
			result = gs.insert(gbuy);
		}
		model.addAttribute("result",result);
		model.addAttribute("userid",userid);
		model.addAttribute("tot",tot);
		return "Gbuy/GbuyChk";
	}

	@RequestMapping("Gbuy")
	public String Gbuy(Model model, HttpSession session) {	
		String id=(String) session.getAttribute("id");		
		/*String[] ct_string = userid.split("-");
		int [] ct_num = new int[ct_string.length];
		for(int i=0; i<ct_string.length; i++) {
		    ct_num[i] = Integer.parseInt(ct_string[i]);
		}	*/
		List<Gbuy> gbuy = gs.select(id);
		// 세개 테이블을 조인해서 원하는 컬럼을 출력, 저장된 순간 구매완료이기 때문에 id로 검색을 해줘도 된다
		// select * from Gbuy natural join (select * from Gproduct natural join Gcart) where id=#{id};
		model.addAttribute("gbuy",gbuy);
		return "Gbuy/Gbuy";
	}
	
	@RequestMapping("GbuyRefund")
	public String GbuyRefund(Model model, Gbuy gbuy) {
		int ct_count = gbuy.getCt_count(); 
		int pro_num = gbuy.getPro_num();
		int buy_num = gbuy.getBuy_num();
		gps.updateCount2(ct_count,pro_num);
		// pro_num의 count값에 ct_count를 더한다
		gps.updateSell2(ct_count,pro_num);
		// pro_num의 sell값에 ct_count를 뺀다
		int result = gs.delete(buy_num);
		// 선택한 buy_num에 deli값을 환불완료로 수정
		model.addAttribute("result",result);
		return "Gbuy/GbuyRefund";
	}
	
	@RequestMapping("GdeliList")
	public String GdeliList(Model model){
		
		List<Gbuy> gbuylist= new ArrayList<>();
		gbuylist= gs.gbuylist();
		
		model.addAttribute("gbuylist",gbuylist);
		
		return "Gadmin/GdeliList";
	}
	
	@RequestMapping("Gbuycomplete")
	public String Gbuycomplete(Model model, int buy_num){
		
		int result=gs.delicomplete(buy_num);
		String msg=null;
		if(result>0){
			msg="성공적으로 배송을 완료하였습니다";
		}else{
			msg="배송을 완료하지 못했습니다. \n 다시 시도해 주십시오";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("result",result);
		
		return "Gadmin/Gbuycomplete";
	}
	
	@RequestMapping("Gbuying")
	public String Gbuying(Model model, int buy_num){
		
		int result=gs.deliIng(buy_num);
		String msg=null;
		if(result>0){
			msg="성공적으로 업데이트 되었습니다.";
		}else{
			msg="배송중으로 업데이트하지 못했습니다. \n 다시 시도해 주십시오";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("result",result);
		return "Gadmin/Gbuycomplete";
	}
	
	@RequestMapping("GbuyCompList")
	public String GbuyCompList(Model model, HttpSession session){
		
		String id=(String) session.getAttribute("id");
		List<Gbuy> gbuylist= new ArrayList<>();
		gbuylist= gs.gbuylist();
		List<Gboardo> gboardoMy = gbs.myList(id);
		
		model.addAttribute("gboardoMy",gboardoMy);
		model.addAttribute("gbuylist",gbuylist);
		
		return "Gmember/GbuyCompList";
	}
	
	@RequestMapping("GbuyReview")
	public String GbuyReview(Model model, int buy_num){
		
		Gbuy gbuy=gs.contents(buy_num);
		Gproduct gproduct=gps.pdContent(gbuy.getPro_num());
		String pro_cate=gproduct.getPro_cate();
		
		List<Gproduct> rlist=gps.rlist(gbuy.getPro_num());
		
		model.addAttribute("gproduct",gproduct);
		model.addAttribute("rlist",rlist);
		model.addAttribute("pro_cate", pro_cate);	
		
		return "Gproduct/GproductInfo";
	}
	
	
}
