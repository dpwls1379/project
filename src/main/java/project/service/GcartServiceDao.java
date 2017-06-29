package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.GcartDao;
import project.model.Gcart;

@Service
public class GcartServiceDao implements GcartService{
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

}
