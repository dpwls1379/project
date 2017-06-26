package project.dao;

import project.model.Gmember;

public interface GmemberDao {

	int insert(Gmember gm);

	int login(String id, String pass);

	int update(Gmember gm);

	Gmember select(String id);

	int delete(String id);

}
