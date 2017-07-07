package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.GboardoDao;
import project.model.Gboardo;
@Service
public class GboardoServiceImpl implements GboardoService{
	@Autowired
	private GboardoDao gbd;
	
	@Override
	public int insert(Gboardo gboardo) {
		return gbd.insert(gboardo);
	}

	@Override
	public List<Gboardo> list(Gboardo gbo) {
		return gbd.list(gbo);
	}

	@Override
	public Gboardo content(int bo_num) {
		return gbd.content(bo_num);
	}

	@Override
	public Object readcount(int bo_num) {
		return gbd.readcount(bo_num);
	}

	@Override
	public int update(Gboardo gboardo) {
		return gbd.update(gboardo);
	}

	@Override
	public int delete(int bo_num) {
		return gbd.delete(bo_num);
	}

	@Override
	public int getTotalRecordBoardo() {
		return gbd.getTotalRecordBoardo();
	}

	@Override
	public List<Gboardo> myList(String id) {
		// TODO Auto-generated method stub
		return gbd.myList(id);
	}

}
