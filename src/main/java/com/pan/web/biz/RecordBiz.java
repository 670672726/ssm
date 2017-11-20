package com.pan.web.biz;

import java.util.List;

import com.pan.web.bean.Record2;



public interface RecordBiz {
	// 查看指定用户的租赁记录
	public List<Record2> queryUserRecords(String uname);

	// 查看指定DVD的租赁记录
	public List<Record2> queryDVDRecords(String dname);

	// 查看指定用户的已归还记录
	public List<Record2> queryHasReturnRecord(String uname);

	public List<Record2> queryNoReturnRecord(String uname);

	// 所有
	public List<Record2> queryAllRecord();
}
