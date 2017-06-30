package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.GbuyDao;

@Service
public class GbuyServiceImpl implements GbuyService {

	@Autowired
	private GbuyDao gd;
	
}
