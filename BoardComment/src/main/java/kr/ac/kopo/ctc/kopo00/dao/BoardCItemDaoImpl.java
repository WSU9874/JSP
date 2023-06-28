package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.Statement;

import kr.ac.kopo.ctc.kopo00.domain.BoardCItem;

public class BoardCItemDaoImpl implements BoardCItemDao {

	@Override
	public int addGongji(String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,boolean redelete)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		
		int lastId = 0;

		stmt.execute(String.format(
				"insert into gongji2(title,date,content,rootid,relevel,recnt,viewcnt,redelete) value('%s','%s','%s',%d,%d,%d,%d,true)",
				title, date, content, rootid, relevel, recnt, viewcnt));

		ResultSet rset = stmt.executeQuery("SELECT LAST_INSERT_id()");
		rset.next();
		lastId = rset.getInt(1);

		String QueryTxt = "";
		QueryTxt = String.format("update gongji2 set rootid=%d where id=%d", lastId, lastId);
		stmt.execute(QueryTxt);

		stmt.close();
		conn.close();
		rset.close();
		return lastId;
	}

	@Override
	public int count() throws ClassNotFoundException, SQLException {
		int count = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select count(*) from gongji2");
		rset.next();
		count = rset.getInt(1);

		stmt.close();
		conn.close();
		rset.close();

		return count;

	}

	@Override
	public int getTitle(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("select name from gongji2 where (%d)", id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public List<BoardCItem> selectAll() throws ClassNotFoundException, SQLException {
		List<BoardCItem> boardItemList = new ArrayList<BoardCItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from gongji2 order by rootid desc, recnt asc");
		int cnt=0;
		while (rset.next()) {
			BoardCItem boardItem = new BoardCItem();
			boardItem.setId(rset.getInt(1));
			boardItem.setTitle(rset.getString(2));
			boardItem.setDate(rset.getString(3));
			boardItem.setContent(rset.getString(4));
			boardItem.setRootid(rset.getInt(5));
			boardItem.setRelevel(rset.getInt(6));
			boardItem.setRecnt(rset.getInt(7));
			boardItem.setViewcnt(rset.getInt(8));
			boardItem.setRedelete(rset.getBoolean(9));
			if(rset.getInt(6)==0) {
				cnt++;
			}

			boardItemList.add(boardItem);
		}
		for(BoardCItem s : boardItemList) {
			if(s.getRelevel()==0) {
				s.setListNum(cnt);
				cnt--;
			}	
		}
		stmt.close();
		conn.close();
		rset.close();
		return boardItemList;
	}

	@Override
	public BoardCItem date() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select date_format(now(), '%Y-%m-%d');");
		rset.next();
		BoardCItem boardItem = new BoardCItem();
		boardItem.setDate(rset.getString(1));

		stmt.close();
		conn.close();
		rset.close();
		return boardItem;
	}

	@Override
	public BoardCItem selectOne(int id) throws ClassNotFoundException, SQLException {
		BoardCItem boardItem = new BoardCItem();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		String QueryTxt;

		QueryTxt = "select * from gongji2 where id =" + id;

		ResultSet rset = stmt.executeQuery(QueryTxt);

		rset.next();
		boardItem.setId(rset.getInt(1));
		boardItem.setTitle(rset.getString(2));
		boardItem.setDate(rset.getString(3));
		boardItem.setContent(rset.getString(4));
		boardItem.setRootid(rset.getInt(5));
		boardItem.setRelevel(rset.getInt(6));
		boardItem.setRecnt(rset.getInt(7));
		boardItem.setViewcnt(rset.getInt(8));
		boardItem.setRedelete(rset.getBoolean(9));

		stmt.close();
		conn.close();
		rset.close();

		return boardItem;
	}

	@Override
	public int updateGongji(String title, String content, int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(
				String.format("update gongji2 set title = '%s', content = '%s' where id = %d", title, content, id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int deleteGonji(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("delete from gongji2 where rootid=%d", id));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int updateCount(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		String QueryTxt = " ";
		int cnt = 0;

		ResultSet rset = stmt.executeQuery(String.format("select viewcnt from gongji2 where id=%d", id));
		rset.next();
		cnt = rset.getInt(1);

		cnt++;
		QueryTxt = String.format("update gongji2 set viewcnt=%d where id=%d", cnt, id);
		stmt.execute(QueryTxt);

		stmt.close();
		conn.close();
		rset.close();
		return cnt;
	}

	@Override
	public int getCount(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		int cnt = 0;

		ResultSet rset = stmt.executeQuery(String.format("select viewcnt from gongji2 where id=%d", id));
		rset.next();
		cnt = rset.getInt(1);

		stmt.close();
		conn.close();
		rset.close();
		return cnt;

	}

	@Override
	public int addComment(String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,boolean redelete)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format(
				"insert into gongji2(title,date,content,rootid,relevel,recnt,viewcnt,redelete) value('%s','%s','%s',%d,%d,%d,%d,true)",
				title, date, content, rootid, relevel, recnt, viewcnt));
		stmt.close();
		conn.close();

		return 0;
	}

	@Override
	public int recntPlus(int rootid, int recnt) throws ClassNotFoundException, SQLException {
		int checkerror = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		try {
			String Querytxt = "";
			Querytxt = String.format("Update gongji2 SET recnt = (recnt+1) where rootid = %d and recnt > %d", rootid,
					recnt);
			stmt.execute(Querytxt);

		} catch (Exception e) {
			checkerror = 1;
			stmt.close();
			conn.close();

		}
		stmt.close();
		conn.close();
		return checkerror;
	}

	@Override
	public int deleteComment(int id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		stmt.execute(String.format("update gongji2 set title='삭제된 댓글입니다', content='삭제된 댓글입니다',redelete=false where id=%d", id));
		stmt.close();
		conn.close();

		return 0;
	}

}
