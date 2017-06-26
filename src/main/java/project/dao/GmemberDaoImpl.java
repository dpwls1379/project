package project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.model.Gmember;

@Repository
public class GmemberDaoImpl implements GmemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Gmember gm) {
		System.out.println("id = " + gm.getId());
		System.out.println("pass = " + gm.getPass());
		System.out.println("name = " + gm.getName());
		System.out.println("addr = " + gm.getAddr());
		System.out.println("email = " + gm.getEmail());
		System.out.println("tel = " + gm.getTel());
		System.out.println("gender = " + gm.getGender());
		System.out.println("birthday = " + gm.getBirthday());
		return sst.insert("gmemberns.insert", gm);
	}

	public int login(String id, String pass) {
		int result = 0;
		String dbPass = "";
		System.out.println("id = " + id);
		System.out.println("pass = " + pass);

		try {
			dbPass = (String) sst.selectOne("gmemberns.loginChk", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (dbPass == null || dbPass.equals("")) {
			result = -1;
		} else if (pass.equals(dbPass)) {
			result = 1;
		} else
			result = 0;
		return result;
	}

	public int update(Gmember gm) {
		System.out.println("id = " + gm.getId());
		System.out.println("pass = " + gm.getPass());
		System.out.println("name = " + gm.getName());
		System.out.println("addr = " + gm.getAddr());
		System.out.println("email = " + gm.getEmail());
		System.out.println("tel = " + gm.getTel());
		return sst.update("gmemberns.update", gm);
	}

	public Gmember select(String id) {
		return sst.selectOne("gmemberns.select", id);
	}

	public int delete(String id) {
		return sst.delete("gmemberns.delete", id);
	}

}