package project.service;

import java.util.List;

import project.model.Gcart;

public interface GcartService {

	int insert(Gcart gcart);

	List<Gcart> list(String id);

	String selectId(Gcart gcart);

	int update(Gcart gcart);

	int delete(int ct_num);

	Gcart info(int ct_num);

	Gcart member(String id);

}
