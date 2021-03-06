package project.service;

import java.util.List;

import project.model.Gboardo;

public interface GboardoService {

	public int insert(Gboardo gboardo);

	public List<Gboardo> list(Gboardo gbo);

	public Gboardo content(int bo_num);

	public Object readcount(int bo_num);

	public int update(Gboardo gboardo);

	public int delete(int bo_num);

	public int getTotalRecordBoardo();

	public List<Gboardo> myList(String id);


}
