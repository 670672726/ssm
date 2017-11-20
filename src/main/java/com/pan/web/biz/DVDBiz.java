package com.pan.web.biz;

import java.util.List;

import com.pan.web.bean.DVD;



public interface DVDBiz {
	public boolean addDVD(DVD dvd);

	public boolean deleteDVD(int did);

	public boolean modifyDVD(DVD dvd);

	public List<DVD> queryAllDVD();

	public List<DVD> ranking_top_five();// 查看前五章DVD

	public List<DVD> querDVDByName(String dname);// 名字

	public DVD querDVDById(int did);// id

	public int lendDVD(int did, int uid);// 按dvd编号和用户编号租

	public int returnDVD(int rid);// 还DVD

	public List<DVD> canLendDVD();// 可借

	public List<DVD> hasLendDVD();// 不可借
}
