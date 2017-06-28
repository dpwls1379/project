package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.GmemberDao;
import project.model.Gmember;

@Service
public class GmemberServiceImpl implements GmemberService {
	@Autowired
	private GmemberDao gd;
	public int insert(Gmember gm) {
		return gd.insert(gm);
	}
	public int login(String id, String pass) {
		return gd.login(id,pass);
	}
	public int update(Gmember gm) {
		return gd.update(gm);
	}
	public Gmember select(String id) {
		return gd.select(id);
	}
	public int delete(String id) {
		return gd.delete(id);
	}
	public int confirm(String id) {
		return gd.confirm(id);
	}
}
