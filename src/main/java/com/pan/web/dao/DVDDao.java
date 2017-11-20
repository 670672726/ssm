package com.pan.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.pan.web.bean.DVD;


public interface DVDDao {
	public boolean saveDVD(DVD dvd);

	public boolean delDVD(int did);

	public boolean updateDVD(DVD dvd);

	public List<DVD> queryDVDs();

	public List<DVD> queryDVDBYName(String dname);

	public List<DVD> querysortDvdsByLimit();// 查找起始位置，指定个数DVD

	public DVD queryDVDbyDid(int did);

	public List<DVD> queryDVDByStatus(int status);
}
