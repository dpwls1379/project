package project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.model.Gproduct;

@Repository
public class GproductDaoImpl implements GproductDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Gproduct gproduct) {
		return sst.insert("gproduct.insert",gproduct);
	}

	@Override
	public List<Gproduct> list(Gproduct gp) {
		return sst.selectList("gproduct.list", gp);
	}

	@Override
	public int delete(int pro_num) {
		return sst.delete("gproduct.delete",pro_num);
	}

	@Override
	public int update(Gproduct gproduct) {
		return sst.update("gproduct.update",gproduct);
	}

	@Override
	public List<Gproduct> pdList() {
		return sst.selectList("gproduct.pdList");
	}

	@Override
	public Gproduct pdContent(int pro_num) {
		return sst.selectOne("gproduct.pdContent",pro_num);
	}

	@Override
	public Object readcount(int pro_num) {
		return sst.update("gproduct.readcount",pro_num);
	}

	@Override
	public List<Gproduct> pdList2() {
		return sst.selectList("gproduct.pdList2");
	}

	@Override
	public List<Gproduct> pdList3() {
		return sst.selectList("gproduct.pdList3");
	}

	@Override
	public List<Gproduct> search(String search) {
		return sst.selectList("gproduct.search",search);
	}

	@Override
	public int getTotalRecordProduct() {
		return sst.selectOne("getTotalProduct");
	}

	@Override
	public Object updateCount(int ct_count, int pro_num) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("ct_count",ct_count);
		hm.put("pro_num",pro_num);
		return sst.update("gproduct.updateCount",hm);
	}

	public List<Gproduct> rlist(int pro_num) {
		return sst.selectList("gproduct.rlist",pro_num);
	}

	@Override
	public Object updateSell(int ct_count, int pro_num) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("ct_count",ct_count);
		hm.put("pro_num",pro_num);
		return sst.update("gproduct.updateSell",hm);
	}

	@Override
	public Object updateCount2(int ct_count, int pro_num) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("ct_count",ct_count);
		hm.put("pro_num",pro_num);
		return sst.update("gproduct.updateCount2",hm);
	}

	@Override
	public Object updateSell2(int ct_count, int pro_num) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("ct_count",ct_count);
		hm.put("pro_num",pro_num);
		return sst.update("gproduct.updateSell2",hm);
	}
}
