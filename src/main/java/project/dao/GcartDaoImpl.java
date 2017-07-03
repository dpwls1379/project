package project.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.model.Gcart;

@Repository
public class GcartDaoImpl implements GcartDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Gcart gcart) {
		return sst.insert("gcart.insert",gcart);
	}

	@Override
	public List<Gcart> list(String id) {
		return sst.selectList("gcart.list",id);
	}

	@Override
	public String selectId(Gcart gcart) {
		return sst.selectOne("gcart.selectId",gcart);
	}

	@Override
	public int update(Gcart gcart) {
		return sst.update("gcart.update",gcart);
	}

	@Override
	public int delete(int ct_num) {
		return sst.delete("gcart.delete",ct_num);
	}

	@Override
	public Gcart info(int ct_num) {
		return sst.selectOne("gcart.info",ct_num);
	}

	@Override
	public Gcart member(String id) {
		return sst.selectOne("gcart.member",id);
	}
}
