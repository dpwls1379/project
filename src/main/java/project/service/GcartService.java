package project.service;

import java.util.List;

import project.model.Gcart;
import project.model.Gproduct;

public interface GcartService {

	int insert(Gcart gcart);

	List<Gcart> list(String id);

	String selectId(Gcart gcart);

	int update(Gcart gcart);

}
