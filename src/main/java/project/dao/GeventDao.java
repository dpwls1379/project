package project.dao;

import java.util.List;

import project.model.Gevent;

public interface GeventDao {

	int insert(Gevent gevent);

	List<Gevent> list(Gevent gevent);

	Object readcount(int ev_num);

	Gevent content(int ev_num);

	int update(Gevent gevent);

	int delete(int ev_num);

	List<Gevent> search(String search);

	List<Gevent> evList();

	List<Gevent> evList2();
	
	List<Gevent> evList3();

	int getTotalEvent();


}
