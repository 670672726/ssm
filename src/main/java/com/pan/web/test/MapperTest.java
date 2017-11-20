package com.pan.web.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pan.web.bean.DVD;
import com.pan.web.bean.User;
import com.pan.web.bizimpl.DVDBizImpl;
import com.pan.web.dao.DVDDao;
import com.pan.web.dao.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	private DVDDao dvdDao;
	@Autowired
	private UserDao  userDao;
	@Autowired
	private DVDBizImpl dvdBizImpl;
	
	@Test
	public void test(){
		/*DVD dvd=new DVD("22", 3, 0);
		dvdDao.saveDVD(dvd);
		//批量操作需配置SqlSessionTemplate
		DVDDao mapper = session.getMapper(DVDDao.class);
		for (int i = 0; i < 4; i++) {
			mapper.saveDVD(new DVD("pan", 0, 0));
			
		}*/
	}
	@Test
	public void test2(){
		List<DVD> ranking_top_five = dvdBizImpl.ranking_top_five();
		System.out.println(ranking_top_five);
	}
	@Test
	public void test4(){
		boolean b = userDao.saveUser(new User("saadsaadad", "12121", 0));
		System.out.println(b);
	}
}
