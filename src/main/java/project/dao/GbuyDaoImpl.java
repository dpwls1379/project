package project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GbuyDaoImpl implements GbuyDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
}
