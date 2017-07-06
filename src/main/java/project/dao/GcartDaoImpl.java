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
	public String selectDel(Gcart gcart) {
		return sst.selectOne("gcart.selectDel",gcart);
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

	@Override
	public int pronum(int ct_num) {
		return sst.selectOne("gcart.pronum",ct_num);
	}

	@Override
	public Object updateCart(int ct_num) {
		return sst.update("gcart.updateCart",ct_num);
	}

	@Override
	public int ct_count(int ct_num) {
		return sst.selectOne("gcart.ct_count",ct_num);
	}

	@Override
	public int pro_num(int ct_num) {
		return sst.selectOne("gcart.pro_num",ct_num);
	}

}
