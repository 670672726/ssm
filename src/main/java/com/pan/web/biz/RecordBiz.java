package com.pan.web.biz;

import java.util.List;

import com.pan.web.bean.Record2;



public interface RecordBiz {
	// �鿴ָ���û������޼�¼
	public List<Record2> queryUserRecords(String uname);

	// �鿴ָ��DVD�����޼�¼
	public List<Record2> queryDVDRecords(String dname);

	// �鿴ָ���û����ѹ黹��¼
	public List<Record2> queryHasReturnRecord(String uname);

	public List<Record2> queryNoReturnRecord(String uname);

	// ����
	public List<Record2> queryAllRecord();
}
