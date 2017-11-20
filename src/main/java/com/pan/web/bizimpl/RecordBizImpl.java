package com.pan.web.bizimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.web.bean.Record2;
import com.pan.web.biz.RecordBiz;
import com.pan.web.dao.RecordDao;


@Service
public class RecordBizImpl implements RecordBiz {
	@Autowired
	private RecordDao recordDao = null;
	
	public List<Record2> queryUserRecords(String uname) {
		// TODO Auto-generated method stub
		return recordDao.queryRecordByUname(uname);
	}

	public List<Record2> queryDVDRecords(String dname) {
		// TODO Auto-generated method stub
		return recordDao.queryrRecordByDname(dname);
	}

	public List<Record2> queryHasReturnRecord(String uname) {
		// TODO Auto-generated method stub
		return recordDao.queryUserRecordByReturnTime(true, uname);
	}

	public List<Record2> queryNoReturnRecord(String uname) {
		// TODO Auto-generated method stub
		return recordDao.queryUserRecordByReturnTime(false, uname);
	}

	public List<Record2> queryAllRecord() {
		// TODO Auto-generated method stub
		return recordDao.queryAllRecords();
	}

}
