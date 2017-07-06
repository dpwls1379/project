package project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.model.Gbuy;

@Repository
public class GbuyDaoImpl implements GbuyDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Gbuy gbuy) {
		return sst.insert("gbuy.insert",gbuy);
	}

	@Override
	public List<Gbuy> select(String id) {
		return sst.selectList("gbuy.select", id);
	}

	@Override
	public int delete(int buy_num) {
		return sst.update("gbuy.delete",buy_num);
	}

	@Override
	public List<Gbuy> gbuylist() {
		// TODO Auto-generated method stub
		return sst.selectList("gbuy.list");
	}
	
	
}
