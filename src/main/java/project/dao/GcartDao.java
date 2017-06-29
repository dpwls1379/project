package project.dao;

import java.util.List;

import project.model.Gcart;

public interface GcartDao {

	int insert(Gcart gcart);

	List<Gcart> list(String id);

	String selectId(Gcart gcart);

	int update(Gcart gcart);

}
