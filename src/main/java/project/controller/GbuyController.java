package project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.fabric.xmlrpc.base.Array;

import project.model.Gproduct;
import project.service.GbuyService;
import project.service.GcartService;
import project.service.GproductService;
import project.model.Gbuy;
import project.model.Gcart;

@Controller
public class GbuyController {

	@Autowired
	private GbuyService gs;
	
	@Autowired
	private GproductService gps;
	
	@Autowired
	private GcartService gsv;
	
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
			gbuy.setCt_num(ct_num[j]);
			pro_num = gsv.pronum(ct_num[j]);
			gbuy.setPro_num(pro_num);
			result = gs.insert(gbuy);
		}
		model.addAttribute("result",result);
		model.addAttribute("userid",userid);
		model.addAttribute("tot",tot);
		return "Gbuy/GbuyChk";
	}

	@RequestMapping("Gbuy")
	public String Gbuy(Model model, HttpSession session, int tot, String userid) {		
		String id=(String) session.getAttribute("id");		
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
			int pro_num = gsv.pro_num(ct_num[j]);
			// ct_num에 있는 상품넘버 pro_num을 리스트로 저장한다
			// select pro_num from Gcart where ct_num=#{ct_num}
			gps.updateCount(ct_count, pro_num);
			// product에 있는 pro_num의 상품의 보유개수 pro_count에 ct_count를 빼줘 수량을 조절한다
			// update Gproduct set pro_count = pro_count-#{ct_count} where pro_num=#{pro_num}
		}
		List<Gbuy> gbuy = gs.select(id);
		// 세개 테이블을 조인해서 원하는 컬럼을 출력, 저장된 순간 구매완료이기 때문에 id로 검색을 해줘도 된다
		// select * from Gbuy natural join (select * from Gproduct natural join Gcart) where id=#{id};
		model.addAttribute("gbuy",gbuy);
		model.addAttribute("tot",tot);
		return "Gbuy/Gbuy";
	}
}
