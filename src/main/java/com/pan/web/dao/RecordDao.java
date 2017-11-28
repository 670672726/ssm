package com.pan.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.pan.web.bean.Record;
import com.pan.web.bean.Record2;



public interface RecordDao {
	
	public Record queryRecordById(int rid);

	public boolean saveRecord(Record record);

	public boolean uptateRecord(Record record);

	public List<Record2> queryAllRecords();

	// 查看用户的借还记录
	public List<Record2> queryRecordByUname(String uname);

	// 查看指定DVD的借还记录
	public List<Record2> queryrRecordByDname(String dname);

	// 查看用户的归还记录（以归还，未归还）
	public List<Record2> queryUserRecordByReturnTime(
			@Param("flag") boolean flag, @Param("uname") String uname);
	public Record2 queryUserRecordByReturnTimeonly(
			@Param("flag") boolean flag, @Param("uid") int uid,@Param("did")int did);
}
