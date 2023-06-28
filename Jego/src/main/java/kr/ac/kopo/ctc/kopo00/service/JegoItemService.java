package kr.ac.kopo.ctc.kopo00.service;

import java.sql.SQLException;

import kr.ac.kopo.ctc.kopo00.dao.JegoItemDao;
import kr.ac.kopo.ctc.kopo00.dto.Pagination;

public interface JegoItemService {
	JegoItemDao getJegoItemDao();
	void setJegoItemDao(JegoItemDao jegoItemDao);
	
	Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException;
}
