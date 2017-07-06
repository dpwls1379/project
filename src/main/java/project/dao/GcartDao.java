package project.dao;

import java.util.List;

import project.model.Gcart;

public interface GcartDao {

	int insert(Gcart gcart);

	List<Gcart> list(String id);

	String selectId(Gcart gcart);

	int update(Gcart gcart);

	int delete(int ct_num);

	Gcart info(int ct_num);

	Gcart member(String id);

	int pronum(int ct_num);

	Object updateCart(int ct_num);

	int ct_count(int ct_num);

	int pro_num(int ct_num);

	String selectDel(Gcart gcart);
}
