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
	public int pronum(int ct_num) {
		return gd.pronum(ct_num);
	}

	@Override
	public Object updateCart(int ct_num) {
		return gd.updateCart(ct_num);
	}

	@Override
	public int ct_count(int ct_num) {
		return gd.ct_count(ct_num);
	}

	@Override
	public int pro_num(int ct_num) {
		return gd.pro_num(ct_num);
	}

	@Override
	public String selectDel(Gcart gcart) {
		return gd.selectDel(gcart);
	}

	public Gcart content(Gcart gcart) {
		// TODO Auto-generated method stub
		return gd.content(gcart);
	}

	@Override
	public int updateCnt(int ct_count, int ct_num) {
		// TODO Auto-generated method stub
		return gd.updateCnt(ct_count,ct_num);
	}
}
