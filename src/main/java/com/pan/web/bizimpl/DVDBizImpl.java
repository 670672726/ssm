package com.pan.web.bizimpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.pan.web.bean.DVD;
import com.pan.web.bean.Record;
import com.pan.web.biz.DVDBiz;
import com.pan.web.dao.DVDDao;
import com.pan.web.dao.RecordDao;



@Service
public class DVDBizImpl implements DVDBiz {
	
	@Autowired
	private DVDDao dvdDao;
	
	@Autowired
	private RecordDao recordDao;


	public boolean addDVD(DVD dvd) {
		// TODO Auto-generated method stub
		return dvdDao.saveDVD(dvd);
	}

	public boolean deleteDVD(int did) {
		// TODO Auto-generated method stub
		return dvdDao.delDVD(did);
	}

	public boolean modifyDVD(DVD dvd) {
		// TODO Auto-generated method stub
		return dvdDao.updateDVD(dvd);
	}

	public List<DVD> queryAllDVD() {
		// TODO Auto-generated method stub
		return dvdDao.queryDVDs();
	}

	public List<DVD> ranking_top_five() {
		// TODO Auto-generated method stub
		return dvdDao.querysortDvdsByLimit();
	}

	public List<DVD> querDVDByName(String dname) {
		// TODO Auto-generated method stub
		return dvdDao.queryDVDBYName(dname);
	}

	public DVD querDVDById(int did) {
		// TODO Auto-generated method stub
		return dvdDao.queryDVDbyDid(did);
	}

	public int lendDVD(int did, int uid) {
		// TODO Auto-generated method stub
		DVD dvd = dvdDao.queryDVDbyDid(did);
		if (dvd == null) {
			return 0;// 没有找到要借的DVD
		} else {
			if (dvd.getStatus() == 0) {
				return 1;// 已经借出了
			} else {
				dvd.setStatus(0);// 更新表示已经借出
				dvd.setDcount(dvd.getDcount() + 1);
				boolean flag1 = dvdDao.updateDVD(dvd);
				Record record = new Record(uid, dvd.getId(),
						new SimpleDateFormat("yyyy-MM-dd").format(new Date()),
						null);
				boolean flag2 = recordDao.saveRecord(record);// 插入租赁记录
				if (flag1 && flag2) {
					return 2;// 借出成功
				} else {
					return 3;// 借出失败
				}
			}
		}
	}

	public int returnDVD(int rid) {
		// TODO Auto-generated method stub
		Record record = recordDao.queryRecordById(rid);
		if (record == null) {
			return 1;// 输入不正确
		} else if (record.getReturnTime() != null) {
			return 2;// dvd已经归还
		} else {
			record.setReturnTime(new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date()));
			boolean flag1 = recordDao.uptateRecord(record);
			DVD dvd = dvdDao.queryDVDbyDid(record.getDid());
			dvd.setStatus(1);// 可借状态
			boolean flag2 = dvdDao.updateDVD(dvd);
			if (flag1 && flag2) {
				return 3;// 归还成功
			} else {
				return 4;// 归还失败
			}

		}
	}

	public List<DVD> canLendDVD() {
		// TODO Auto-generated method stub
		return dvdDao.queryDVDByStatus(1);
	}

	public List<DVD> hasLendDVD() {
		// TODO Auto-generated method stub
		return dvdDao.queryDVDByStatus(0);
	}

}
