package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo00.domain.BoardItem;

public interface BoardItemDao {
	
	int addGongji(String title, String date, String content) throws ClassNotFoundException, SQLException;
	
	int count() throws ClassNotFoundException, SQLException;
	
	List<BoardItem> selectAll() throws ClassNotFoundException, SQLException;
	
	int getTitle(int id) throws ClassNotFoundException, SQLException;
	
	BoardItem date() throws ClassNotFoundException, SQLException;
	
	BoardItem selectOne(int id) throws ClassNotFoundException, SQLException;
	
	int updateGongji ( String title, String content,int id) throws ClassNotFoundException, SQLException;
	
	int deleteGonji(int id) throws ClassNotFoundException, SQLException;
}
