package project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.javafx.sg.prism.NGShape.Mode;

import project.model.Gboardo;
import project.model.Gproduct;
import project.service.GboardoService;
import project.service.GproductService;

@Controller
public class GFileuploadController {

	@Autowired
	private GproductService gps;
	
	@Autowired
	private GboardoService gbs;

	@RequestMapping(value = "Gproduct", method = RequestMethod.POST)
	public String GproductInsert(Gproduct gproduct, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String id=(String) session.getAttribute("id");
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/images");

		if (!gproduct.getFile1().isEmpty()) {
			String proimage = gproduct.getFile1().getOriginalFilename();
			gproduct.setPro_image(proimage);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(gproduct.getFile1(), real, proimage);
		}

		if (!gproduct.getFile2().isEmpty()) {
			String proinfo = gproduct.getFile2().getOriginalFilename();
			gproduct.setPro_info(proinfo);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(gproduct.getFile2(), real, proinfo);
		}

		int result = gps.insert(gproduct);
		model.addAttribute("result", result);

		return "Gproduct/Gproduct";
	}

	@RequestMapping(value="GproductUpdate", method = RequestMethod.POST)
	public String GproductUpdate(Gproduct gproduct, Model model, HttpServletRequest request) {

		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/images");

		if (!gproduct.getFile1().isEmpty()) {
			String proimage = gproduct.getFile1().getOriginalFilename();
			gproduct.setPro_image(proimage);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(gproduct.getFile1(), real, proimage);
		}else{
			gproduct.setPro_image("nothing.jpg");
		}

		if (!gproduct.getFile2().isEmpty()) {
			String proinfo = gproduct.getFile2().getOriginalFilename();
			gproduct.setPro_info(proinfo);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(gproduct.getFile2(), real, proinfo);
		}else{
			gproduct.setPro_info("nothing.jpg");
		}

		int result = gps.update(gproduct);
		model.addAttribute("result", result);

		return "Gproduct/GproductUpdate";
	}

	@RequestMapping(value="Gboardo", method = RequestMethod.POST)
	public String Gboardo(Model model, Gboardo gboardo,  HttpServletRequest request, HttpSession session){
		
		String id=(String) session.getAttribute("id");
		gboardo.setId(id);
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/images");
		
		if(!gboardo.getFile1().isEmpty()){
			String bo_image=gboardo.getFile1().getOriginalFilename();
			gboardo.setBo_image(bo_image);
			Filewriter filewriter=new Filewriter();
			filewriter.writeFile(gboardo.getFile1(),real , bo_image);
		}else{
			gboardo.setBo_image("nothing.jpg");
		}
		int result=gbs.insert(gboardo);
		
		model.addAttribute("pro_num",gboardo.getPro_num());
		model.addAttribute("result",result);
		
		return "Gboardo/Gboardo";
	}

	@RequestMapping(value="GboardoUpdate")
	public String GboardoUpdate(Model model, Gboardo gbo, HttpServletRequest request){
		
		String real=request.getSession().getServletContext().getRealPath("/WEB-INF/images");
		
		if(!gbo.getFile1().isEmpty()){
			String bo_image=gbo.getFile1().getOriginalFilename();
			gbo.setBo_image(bo_image);
			Filewriter fw=new Filewriter();
			fw.writeFile(gbo.getFile1(), real, bo_image);
		}else{
			gbo.setBo_image("nothing.jpg");
		}
		
		int result = gbs.update(gbo);
		
		model.addAttribute("result",result);
		model.addAttribute("bo_num",gbo.getBo_num());
		
		return "Gboardo/GboardoUpdate";
	}
	
	

}
