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

	@Override
	public int delete(int buy_num) {
		return gd.delete(buy_num);
	}

	@Override
	public List<Gbuy> gbuylist() {
		// TODO Auto-generated method stub
		return gd.gbuylist();
	}

	@Override
	public int delicomplete(int buy_num) {
		// TODO Auto-generated method stub
		return gd.delicomplete(buy_num);
	}

	@Override
	public int deliIng(int buy_num) {
		// TODO Auto-generated method stub
		return gd.deliIng(buy_num);
	}
	
}
