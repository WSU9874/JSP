package kr.ac.kopo.ctc.kopo00.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.Statement;

import kr.ac.kopo.ctc.kopo00.domain.VoteItem;
import kr.ac.kopo.ctc.kopo00.dto.AgeRate;

public class VoteItemDaoImpl implements VoteItemDao {
	VoteItem studentItem = new VoteItem();

	@Override
	public int addHubo(String name) throws SQLException, ClassNotFoundException, Exception {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select id from hubo;");
		List<Integer> huboIdList = new ArrayList<Integer>();
		while (rset.next()) {
			huboIdList.add(rset.getInt(1));
		}
		int huboId = 1;
		for (int checkId : huboIdList) {
			if (checkId != huboId) {
				break;
			}
			huboId++;
		}

		stmt.execute(String.format("insert into hubo value(%d,'%s')", huboId, name));
		stmt.execute(String.format("insert into tupyo value(%d, %s)", huboId, null));
		stmt.close();
		conn.close();

		return huboId;
	}

	@Override
	public List<VoteItem> huboAll() throws ClassNotFoundException, SQLException {
		List<VoteItem> voteItemList = new ArrayList<VoteItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from hubo;");
		while (rset.next()) {
			VoteItem voteItem = new VoteItem();
			voteItem.setId(rset.getInt(1));
			voteItem.setName(rset.getString(2));

			voteItemList.add(voteItem);
		}
		rset.close();
		stmt.close();
		conn.close();
		return voteItemList;
	}

	@Override
	public int delHubo(int id) throws ClassNotFoundException, SQLException {
		int checkerror = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		try {
			String QueryTxt = " ";
			QueryTxt = String.format("DELETE FROM hubo WHERE id='%s';", id);
			stmt.execute(QueryTxt);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			checkerror = 1;
			stmt.close();
			conn.close();
		}
		return checkerror;
	}

	@Override
	public int addTupyo(int id, int age) throws SQLException, ClassNotFoundException, Exception {
		int ad = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		stmt.execute(String.format("insert into tupyo value(%d, %d)", id, age));
		stmt.close();
		conn.close();

		return ad;
	}

	@Override
	public List<VoteItem> tupyoAll() throws ClassNotFoundException, SQLException {
		List<VoteItem> tupyoItemList = new ArrayList<VoteItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery(
				"select id, count(IF (age='', NULL, age)) as vote, count(IF (age='', NULL, age))/(select count(age) from tupyo)*100 as rate from tupyo group by id order by id asc");
		while (rset.next()) {
			VoteItem tupyoItem = new VoteItem();
			tupyoItem.setHuboId(rset.getInt(1));
			tupyoItem.setCount(rset.getInt(2));
			tupyoItem.setRate(rset.getInt(3));

			tupyoItemList.add(tupyoItem);

		}
		rset.close();
		stmt.close();
		conn.close();
		return tupyoItemList;
	}

	@Override
	public int deltupyo(int id) throws ClassNotFoundException, SQLException {
		int checkerror = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		try {
			String QueryTxt = " ";
			QueryTxt = String.format("DELETE FROM tupyo WHERE id='%s';", id);
			stmt.execute(QueryTxt);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			checkerror = 1;
			stmt.close();
			conn.close();
		}
		return checkerror;
	}

	@Override
	public VoteItem oneHubo(int id) throws ClassNotFoundException, SQLException {
		VoteItem voteItem = new VoteItem();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery(String.format("select name from hubo where id ='%d';", id));
		rset.next();
		voteItem.setOneName(rset.getString(1));
		rset.close();
		stmt.close();
		conn.close();
		return voteItem;

	}

	@Override
	public AgeRate rate(int id) throws ClassNotFoundException, SQLException {
		AgeRate ageRate = new AgeRate();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.69:33060/kopo20", "root", "kopo1234");
		Statement stmt = conn.createStatement();

		for (int i = 1; i <= 9; i++) {
			int age = i * 10;
			ResultSet rset = stmt.executeQuery(String.format(
					"select count(age)*100 / (select count(age) from tupyo where id = '%d') , count(age) from tupyo where id = '%d' and age='%d';",
					id, id, age));
			rset.next();
			if (age == 10) {
				ageRate.setVote10(rset.getInt(1));
				ageRate.setCount10(rset.getInt(2));
			} else if (age == 20) {
				ageRate.setVote20(rset.getInt(1));
				ageRate.setCount20(rset.getInt(2));
			} else if (age == 30) {
				ageRate.setVote30(rset.getInt(1));
				ageRate.setCount30(rset.getInt(2));
			} else if (age == 40) {
				ageRate.setVote40(rset.getInt(1));
				ageRate.setCount40(rset.getInt(2));
			} else if (age == 50) {
				ageRate.setVote50(rset.getInt(1));
				ageRate.setCount50(rset.getInt(2));
			} else if (age == 60) {
				ageRate.setVote60(rset.getInt(1));
				ageRate.setCount60(rset.getInt(2));
			} else if (age == 70) {
				ageRate.setVote70(rset.getInt(1));
				ageRate.setCount70(rset.getInt(2));
			} else if (age == 80) {
				ageRate.setVote80(rset.getInt(1));
				ageRate.setCount80(rset.getInt(2));
			} else if (age == 90) {
				ageRate.setVote90(rset.getInt(1));
				ageRate.setCount90(rset.getInt(2));

			}

			rset.close();
		}

		stmt.close();
		conn.close();
		return ageRate;
	}
}