package kr.ac.kopo.ctc.kopo00.service;

import java.sql.SQLException;

import kr.ac.kopo.ctc.kopo00.dao.JegoItemDao;
import kr.ac.kopo.ctc.kopo00.dao.JegoItemDaoImpl;
import kr.ac.kopo.ctc.kopo00.dto.Pagination;

public class JegoItemServiceImpl implements JegoItemService{

	@Override
	public JegoItemDao getJegoItemDao() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setJegoItemDao(JegoItemDao jegoItemDao) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException {
		Pagination pagination = new Pagination();
		JegoItemDaoImpl jegoItemDaoImpl = new JegoItemDaoImpl();
		int total_count = jegoItemDaoImpl.count();
		

		int totalPage;
		int startPage;

		pagination.setC(page);

		if (total_count % countPerPage == 0) {
			totalPage = total_count / countPerPage;
		} else {
			totalPage = (total_count / countPerPage) + 1;
		}

		if (page < 1) {
			pagination.setC(1);
		} else if (totalPage < page) {
			pagination.setC(totalPage);
		} else {
			pagination.setC(page);
		}

		if (page < 1) {
			pagination.setS(1);
			startPage = 1;
		} else if (totalPage < page) {
			startPage = ((totalPage - 1) / 10) * 10 + 1;
			pagination.setS(startPage);
		} else {
			startPage = ((page - 1) / 10) * 10 + 1;
			pagination.setS(startPage);
		}

		if (page < 11) {
			pagination.setE(10);
		} else if (((page - 1) / 10) >= totalPage / 10) {
			pagination.setE(totalPage);
		} else {
			pagination.setE(((page - 1) / 10) * 10 + 10);
		}

		if (page < 11) {
			pagination.setPp(-1);
		} else {
			pagination.setPp(1);
		}

		if (page < 11) {
			pagination.setP(-1);
		} else if (totalPage < page) {
			pagination.setP((((totalPage - 1) / 10) - 1) * 10 + 1);
		} else {
			pagination.setP((((page - 1) / 10) - 1) * 10 + 1);
		}

		if ((totalPage / 10 * 10) < page) {
			pagination.setNn(-1);
		} else {
			pagination.setNn(totalPage);
		}

		if (page < 11) {
			pagination.setN(11);
		} else if (page <= (totalPage / 10 * 10)) {
			pagination.setN((((page - 1) / 10) + 1) * 10 + 1);
		} else if ((totalPage / 10 * 10) < page) {
			pagination.setN(-1);
		}	
		return pagination;
	}

}
