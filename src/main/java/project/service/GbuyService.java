package project.service;

import java.util.List;

import project.model.Gbuy;

public interface GbuyService {

	int insert(Gbuy gbuy);

	List<Gbuy> select(String id);

	int delete(int buy_num);

	List<Gbuy> gbuylist();

}
