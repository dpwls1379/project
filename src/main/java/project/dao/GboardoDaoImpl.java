package project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.model.Gboardo;
@Repository
public class GboardoDaoImpl implements GboardoDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(Gboardo gboardo) {
		return sst.insert("gboardo.insert",gboardo);
	}

	@Override
	public List<Gboardo> list(Gboardo gbo) {
		return sst.selectList("gboardo.list",gbo);
	}

	@Override
	public Gboardo content(int bo_num) {
		return sst.selectOne("gboardo.content",bo_num);
	}

	@Override
	public Object readcount(int bo_num) {
		return sst.update("gboardo.readcount",bo_num);
	}

	@Override
	public int update(Gboardo gboardo) {
		return sst.update("gboardo.update",gboardo);
	}

	@Override
	public int delete(int bo_num) {
		return sst.update("gboardo.delete",bo_num);
	}

	@Override
	public int getTotalRecordBoardo() {
		return sst.selectOne("gboardo.getTotalBoardo");
	}

	@Override
	public List<Gboardo> myList(String id) {
		// TODO Auto-generated method stub
		return sst.selectList("gboardo.myList",id);
	}

}
