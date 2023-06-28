package kr.ac.kopo.ctc.kopo00.service;

import java.sql.SQLException;

import kr.ac.kopo.ctc.kopo00.dao.BoardItemDao;
import kr.ac.kopo.ctc.kopo00.dto.Pagination;

public interface BoardItemService {
	BoardItemDao getStudentItemDao();
	void setBoardItemDao(BoardItemDao studentItemDao);
	
	Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException;
}
