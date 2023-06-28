package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo00.domain.JegoItem;

public class JegoItemDaoImpl implements JegoItemDao {

	@Override
	public int addJego(String name, long jego, String date, String content, String picture,long id)
			throws ClassNotFoundException, SQLException {
		int checkerror = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
			Statement stmt = conn.createStatement();

			stmt.execute(String.format(
					"insert into jego(name,jego,jegodate,newdate,content,picture,id) values('%s',%d,'%s','%s','%s','%s',%d)",
					 name, jego, date, date, content, picture,id));
			stmt.close();
			conn.close();
		} catch(Exception e) {
			checkerror = 1;
		}

		return checkerror;
	}

	@Override
	public int count() throws ClassNotFoundException, SQLException {
		int count = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select count(*) from jego");
		rset.next();
		count = rset.getInt(1);

		stmt.close();
		conn.close();
		rset.close();

		return count;

	}

	@Override
	public List<JegoItem> selectAll() throws ClassNotFoundException, SQLException {
		List<JegoItem> jegoItemList = new ArrayList<JegoItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from jego order by keyid desc");
		while (rset.next()) {
			JegoItem jegoItem = new JegoItem();
			jegoItem.setKeyid(rset.getLong(1));
			jegoItem.setName(rset.getString(2));
			jegoItem.setJego(rset.getLong(3));
			jegoItem.setJegoDate(rset.getString(4));
			jegoItem.setNewDate(rset.getString(5));
			jegoItem.setContent(rset.getString(6));
			jegoItem.setPicture(rset.getString(7));
			jegoItem.setId(rset.getLong(8));

			jegoItemList.add(jegoItem);
		}
		stmt.close();
		conn.close();
		rset.close();
		return jegoItemList;
	}

	public int getTitle(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public JegoItem date() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select date_format(now(), '%Y-%m-%d');");
		rset.next();
		JegoItem jegoItem = new JegoItem();
		jegoItem.setNewDate(rset.getString(1));

		stmt.close();
		conn.close();
		rset.close();
		return jegoItem;
	}

	@Override
	public JegoItem selectOne(Long id) throws ClassNotFoundException, SQLException {
		JegoItem jegoItem = new JegoItem();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		String QueryTxt;

		QueryTxt = "select * from jego where id =" + id;

		ResultSet rset = stmt.executeQuery(QueryTxt);

		rset.next();
		jegoItem.setKeyid(rset.getLong(1));
		jegoItem.setName(rset.getString(2));
		jegoItem.setJego(rset.getLong(3));
		jegoItem.setJegoDate(rset.getString(4));
		jegoItem.setNewDate(rset.getString(5));
		jegoItem.setContent(rset.getString(6));
		jegoItem.setPicture(rset.getString(7));
		jegoItem.setId(rset.getLong(8));

		stmt.close();
		conn.close();
		rset.close();

		return jegoItem;
	}

	@Override
	public int updateJego(Long jego,String jegoDate, Long id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("update jego set jego = %d, jegodate='%s' where id = %d", jego,jegoDate, id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int deleteJego(Long id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("delete from jego where id=%d", id));

		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public JegoItem jegodate() throws ClassNotFoundException, SQLException {
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select date_format(now(), '%Y-%m-%d');");
		rset.next();
		JegoItem jegoItem = new JegoItem();
		
		jegoItem.setJegoDate(rset.getString(1));

		stmt.close();
		conn.close();
		rset.close();
		return jegoItem;
	}

	@Override
	public JegoItem duplication(Long id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		String QueryTxt;

		QueryTxt = "select * from jego where id =" + id;
		JegoItem jegoItem = new JegoItem();
		ResultSet rset = stmt.executeQuery(QueryTxt);
		rset.next();
		jegoItem.setDuplication(rset.getInt(1));
		
		stmt.close();
		conn.close();

		return jegoItem;
	}
	@Override
	public List<String> SearchId() throws ClassNotFoundException, SQLException {
		List<String> idList = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
			// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
			Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성
			ResultSet rset = stmt.executeQuery("select id from jego"); // 명령어를 통해 나오는값을 rset에 저장
			while(rset.next()) {
			idList.add(rset.getString(1));
			}
		}catch (Exception e) {
	
		}
		return idList;
	}
}
