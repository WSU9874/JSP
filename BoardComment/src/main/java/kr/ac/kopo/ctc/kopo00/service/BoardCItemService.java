package kr.ac.kopo.ctc.kopo00.service;

import java.sql.SQLException;

import kr.ac.kopo.ctc.kopo00.dao.BoardCItemDao;
import kr.ac.kopo.ctc.kopo00.dto.Pagination;

public interface BoardCItemService {
	BoardCItemDao getStudentItemDao();
	void setBoardCItemDao(BoardCItemDao studentItemDao);
	
	Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException;
}
