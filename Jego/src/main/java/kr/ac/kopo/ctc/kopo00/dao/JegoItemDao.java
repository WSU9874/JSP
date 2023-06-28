package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.SQLException;
import java.util.List;
import kr.ac.kopo.ctc.kopo00.domain.JegoItem;

public interface JegoItemDao {
	int addJego(String name,long jego, String date, String content,String picture,long id) throws ClassNotFoundException, SQLException;

	int count() throws ClassNotFoundException, SQLException;

	List<JegoItem> selectAll() throws ClassNotFoundException, SQLException;
	
	JegoItem selectOne(Long keyid) throws ClassNotFoundException, SQLException;

	JegoItem date() throws ClassNotFoundException, SQLException;
	
	JegoItem jegodate() throws ClassNotFoundException, SQLException;

	int updateJego(Long jego,String jegoDate, Long keyid) throws ClassNotFoundException, SQLException;

	int deleteJego(Long keyid) throws ClassNotFoundException, SQLException;
	
	JegoItem duplication(Long keyid) throws ClassNotFoundException, SQLException;
	
	 List<String> SearchId() throws ClassNotFoundException, SQLException;

}
