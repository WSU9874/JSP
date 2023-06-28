package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.Statement;

import kr.ac.kopo.ctc.kopo00.domain.BoardItem;

public class BoardItemDaoImpl implements BoardItemDao {

	@Override
	public int addGongji(String title, String date, String content)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("insert into gongji(title,date,content) value('%s','%s','%s')",title, date, content));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int count() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTitle(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("select name from gongji where (%d)", id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public List<BoardItem> selectAll() throws ClassNotFoundException, SQLException {
		List<BoardItem> boardItemList = new ArrayList<BoardItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from gongji");
		while (rset.next()) {
			BoardItem boardItem = new BoardItem();
			boardItem.setId(rset.getInt(1));
			boardItem.setTitle(rset.getString(2));
			boardItem.setDate(rset.getString(3));
			boardItem.setContent(rset.getString(4));

			boardItemList.add(boardItem);
		}
		stmt.close();
		conn.close();
		rset.close();
		return boardItemList;
	}

	@Override
	public BoardItem date() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select date_format(now(), '%Y-%m-%d');");
		rset.next();
			BoardItem boardItem = new BoardItem();
			boardItem.setDate(rset.getString(1));

		stmt.close();
		conn.close();
		rset.close();
		return boardItem;
	}

	@Override
	public BoardItem selectOne(int id) throws ClassNotFoundException, SQLException {
		BoardItem boardItem = new BoardItem();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		String QueryTxt;

		QueryTxt = "select * from gongji where id =" + id;

		ResultSet rset = stmt.executeQuery(QueryTxt);

		rset.next();
		boardItem.setId(rset.getInt(1));
		boardItem.setTitle(rset.getString(2));
		boardItem.setDate(rset.getString(3));
		boardItem.setContent(rset.getString(4));

		stmt.close();
		conn.close();
		rset.close();

		return boardItem;
	}

	@Override
	public int updateGongji( String title, String content,int id)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("update gongji set title = '%s', content = '%s' where id = %d",title, content,id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int deleteGonji(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("delete from gongji where id=%d",id));
		stmt.close();
		conn.close();

		return 0;
	}

}
