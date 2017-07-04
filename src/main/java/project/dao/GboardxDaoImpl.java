package project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.model.Gboardx;

@Repository
public class GboardxDaoImpl implements GboardxDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Gboardx gboardx) {
		return sst.insert("gboardxns.insert", gboardx);
	}

	@Override
	public List<Gboardx> list(Gboardx gbx) {
		return sst.selectList("gboardxns.list",gbx);
	}

	@Override
	public Gboardx content(int bx_num) {
		return sst.selectOne("gboardxns.content",bx_num);
	}

	@Override
	public int update(Gboardx gboardx) {
		return sst.update("gboardxns.update",gboardx);
	}

	@Override
	public int delete(int bx_num) {
		return sst.update("gboardxns.delete",bx_num);
	}

	@Override
	public Object readcount(int bx_num) {
		return sst.update("gboardxns.readcount",bx_num);
	}

	@Override
	public List<Gboardx> search(String serct, String serc) {
		HashMap<String, String> ser = new HashMap<String, String>();
		ser.put("serct", serct);
		ser.put("serc", serc);
		return sst.selectList("gboardxns.search",ser);
	}

	@Override
	public Object bn_num() {
		return sst.update("gboardxns.bn_num");
	}

	@Override
	public List<Gboardx> list2(Gboardx gbx) {
		return sst.selectList("gboardxns.list2",gbx);
	}

	@Override
	public List<Gboardx> search2(String serct, String serc) {
		HashMap<String, String> hm2 = new HashMap<String, String>();
		hm2.put("serct", serct);
		hm2.put("serc", serc);
		return sst.selectList("gboardxns.search2", hm2);
	}

	@Override
	public int insert2(Gboardx gboardx) {
		return sst.insert("gboardxns.insert2",gboardx);
	}

	@Override
	public List<Gboardx> listn() {
		return sst.selectList("gboardxns.listn");
	}

	@Override
	public List<Gboardx> listq() {
		return sst.selectList("gboardxns.listq");
	}

	@Override
	public int getTotalRecordBoardx() {
		return sst.selectOne("getTotalBoardx");
	}



}
