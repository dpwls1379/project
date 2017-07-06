package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.GbuyDao;
import project.model.Gbuy;

@Service
public class GbuyServiceImpl implements GbuyService {

	@Autowired
	private GbuyDao gd;

	@Override
	public int insert(Gbuy gbuy) {
		return gd.insert(gbuy);
	}

	@Override
	public List<Gbuy> select(String id) {
		return gd.select(id);
	}
	
}
