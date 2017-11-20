package com.pan.web.biz;

import java.util.List;

import com.pan.web.bean.DVD;



public interface DVDBiz {
	public boolean addDVD(DVD dvd);

	public boolean deleteDVD(int did);

	public boolean modifyDVD(DVD dvd);

	public List<DVD> queryAllDVD();

	public List<DVD> ranking_top_five();// �鿴ǰ����DVD

	public List<DVD> querDVDByName(String dname);// ����

	public DVD querDVDById(int did);// id

	public int lendDVD(int did, int uid);// ��dvd��ź��û������

	public int returnDVD(int rid);// ��DVD

	public List<DVD> canLendDVD();// �ɽ�

	public List<DVD> hasLendDVD();// ���ɽ�
}
