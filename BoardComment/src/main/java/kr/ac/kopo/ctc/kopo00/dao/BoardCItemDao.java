package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo00.domain.BoardCItem;

public interface BoardCItemDao {
	
	int addGongji(String title, String date, String content,int rootid,int relevel, int recnt,int viewcnt,boolean redelete) throws ClassNotFoundException, SQLException;
	
	int count() throws ClassNotFoundException, SQLException;
	
	List<BoardCItem> selectAll() throws ClassNotFoundException, SQLException;
	
	int getTitle(int id) throws ClassNotFoundException, SQLException;
	
	BoardCItem date() throws ClassNotFoundException, SQLException;
	
	BoardCItem selectOne(int id) throws ClassNotFoundException, SQLException;
	
	int updateGongji ( String title, String content,int id) throws ClassNotFoundException, SQLException;
	
	int deleteGonji(int id) throws ClassNotFoundException, SQLException;
	
	int updateCount(int id) throws ClassNotFoundException, SQLException;
	
	int getCount(int id) throws ClassNotFoundException, SQLException;
	
	int addComment(String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,boolean redelete) throws ClassNotFoundException, SQLException;
	
	public int recntPlus(int rootid, int recnt) throws ClassNotFoundException, SQLException;
	
	int deleteComment(int id) throws ClassNotFoundException, SQLException;

}
