package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.GcartDao;
import project.model.Gcart;

@Service
public class GcartServiceImpl implements GcartService{
	@Autowired
	private GcartDao gd;

	@Override
	public int insert(Gcart gcart) {
		return gd.insert(gcart);
	}

	@Override
	public List<Gcart> list(String id) {
		return gd.list(id);
	}

	@Override
	public String selectId(Gcart gcart) {
		return gd.selectId(gcart);
	}

	@Override
	public int update(Gcart gcart) {
		return gd.update(gcart);
	}

	@Override
	public int delete(int ct_num) {
		return gd.delete(ct_num);
	}

	@Override
	public Gcart info(int ct_num) {
		return gd.info(ct_num);
	}

	@Override
	public Gcart member(String id) {
		return gd.member(id);
	}

	@Override
	public Gcart content(Gcart gcart) {
		// TODO Auto-generated method stub
		return gd.content(gcart);
	}


}
