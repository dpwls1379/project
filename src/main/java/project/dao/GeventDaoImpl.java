package project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.model.Gevent;

@Repository
public class GeventDaoImpl implements GeventDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Gevent gevent) {
		return sst.insert("geventns.insert", gevent);
	}

	@Override
	public List<Gevent> list(Gevent gevent) {
		return sst.selectList("geventns.list", gevent);
	}

	@Override
	public Object readcount(int ev_num) {
		return sst.update("geventns.readcount",ev_num);
	}

	@Override
	public Gevent content(int ev_num) {
		return sst.selectOne("geventns.content",ev_num);
	}

	@Override
	public int update(Gevent gevent) {
		return sst.update("geventns.update",gevent);
	}

	@Override
	public int delete(int ev_num) {
		return sst.update("geventns.delete",ev_num);
	}

	@Override
	public List<Gevent> search(String search) {
		return sst.selectList("geventns.search",search);
	}

	@Override
	public List<Gevent> evList() {
		return sst.selectList("geventns.evList");
	}

	@Override
	public List<Gevent> evList2() {
		return sst.selectList("geventns.evList2");
	}

	@Override
	public List<Gevent> evList3() {
		return sst.selectList("geventns.evList3");
	}

	@Override
	public int getTotalEvent() {
		return sst.selectOne("geventns.getTotalEvent");
	}



}
