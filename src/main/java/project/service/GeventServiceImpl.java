package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.GeventDao;
import project.model.Gevent;

@Repository
public class GeventServiceImpl implements GeventService {
	@Autowired
	private GeventDao gd;

	@Override
	public int insert(Gevent gevent) {
		return gd.insert(gevent);
	}

	@Override
	public List<Gevent> list(Gevent gevent) {
		return gd.list(gevent);
	}

	@Override
	public Object readcount(int ev_num) {
		return gd.readcount(ev_num);
		
	}

	@Override
	public Gevent content(int ev_num) {
		return gd.content(ev_num);
	}

	@Override
	public int update(Gevent gevent) {
		return gd.update(gevent);
	}

	@Override
	public int delete(int ev_num) {
		return gd.delete(ev_num);
	}

	@Override
	public List<Gevent> search(String search) {
		return gd.search(search);
	}

	@Override
	public List<Gevent> evList() {
		return gd.evList();
	}

	@Override
	public int getTotalEvent() {
		return gd.getTotalEvent();
	}
}
