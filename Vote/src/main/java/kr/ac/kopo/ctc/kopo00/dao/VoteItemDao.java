package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo00.domain.VoteItem;
import kr.ac.kopo.ctc.kopo00.dto.AgeRate;

public interface VoteItemDao {
	// CRUD
	
	int addHubo(String name) throws SQLException, ClassNotFoundException, Exception;
	
	List<VoteItem> huboAll() throws ClassNotFoundException, SQLException;
	
	int delHubo(int id) throws ClassNotFoundException, SQLException;
	
	List<VoteItem> tupyoAll() throws ClassNotFoundException, SQLException;
	
	int addTupyo(int id, int age) throws SQLException, ClassNotFoundException, Exception;
	
	int deltupyo(int id) throws ClassNotFoundException, SQLException;
	
	VoteItem oneHubo(int id) throws ClassNotFoundException, SQLException;
	
	AgeRate rate(int id) throws ClassNotFoundException, SQLException;
	
}