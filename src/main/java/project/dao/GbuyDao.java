package project.dao;

import java.util.List;

import project.model.Gbuy;

public interface GbuyDao {

	int insert(Gbuy gbuy);

	List<Gbuy> select(String id);

}
