package project.service;

import java.util.List;

import project.model.Gmember;

public interface GmemberService {

	int insert(Gmember gm);

	int login(String id, String pass);

	int update(Gmember gm);

	Gmember select(String id);

	int delete(String id);

	int confirm(String id);

	int gmDelete(String id);

	Gmember mypage(String id);

	int getTotalRecordMember();

	List<Gmember> gmList(Gmember gm);



}
