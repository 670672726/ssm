package com.pan.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pan.web.bean.DVD;
import com.pan.web.bean.Msg;
import com.pan.web.bizimpl.DVDBizImpl;

@Controller
public class DVDcontrollers {

	@Autowired
	private DVDBizImpl dvdBiz;

	/**
	 * DVD���չʾ
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/dvdshow")
	@ResponseBody
	public Msg getDVDall(
			@RequestParam(value = "pn", defaultValue = "1") int pn,
			@RequestParam(value = "select_val",defaultValue="0") int select_val) {
		// ҳ�룬ÿҳ��С�������Ĳ�ѯʱ��ҳ��ѯ
		if (select_val==0) {
			//ȫ��DVD
			PageHelper.startPage(pn, 5);
			List<DVD> allDVD = dvdBiz.queryAllDVD();
			// ��PageInfo�Խ�����а�װ,������ʾ5ҳ
			PageInfo page = new PageInfo(allDVD, 5);
			return Msg.sucess().add("PageInfo", page);
		}else if(select_val==1) {
			//�ɽ�DVD
			PageHelper.startPage(pn, 5);
			List<DVD> canDVD = dvdBiz.canLendDVD();
			PageInfo page = new PageInfo(canDVD, 5);
			return Msg.sucess().add("PageInfo", page);
		}else if (select_val==2) {
			//�ѽ�DVD
			PageHelper.startPage(pn, 5);
			List<DVD> hasDVD = dvdBiz.hasLendDVD();
			PageInfo page = new PageInfo(hasDVD, 5);
			return Msg.sucess().add("PageInfo", page);
		}else {
			//����DVD
			PageHelper.startPage(pn, 5);
			List<DVD> ranking_top_five = dvdBiz.ranking_top_five();
			PageInfo page = new PageInfo(ranking_top_five,5);
			return Msg.sucess().add("PageInfo", page);
		}
		
	}
	/**
	 * dvd��ѯ
	 * 
	 * @return
	 */
	@RequestMapping(value = "/dvdcondition")
	@ResponseBody
	public Msg conditionDVD(String dname,int pn) {
		PageHelper.startPage(pn, 5);
		List<DVD> querDVDByName = dvdBiz.querDVDByName(dname);
		PageInfo page = new PageInfo(querDVDByName,5);
		return Msg.sucess().add("PageInfo", page);
		
	}
	/**
	 * dvd�༭
	 * 
	 * @return
	 */
	@RequestMapping(value = "/editdvd")
	@ResponseBody
	public Msg editdvd(DVD dvd) {
		boolean flag = dvdBiz.modifyDVD(dvd);
		return Msg.sucess();
	}
	/**
	 * dvd����
	 * 
	 * @return
	 */
	@RequestMapping(value = "/dvd", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveDVD(DVD dvd) {
		boolean flag = dvdBiz.addDVD(dvd);
		return Msg.sucess();
	}
	/**
	 * ��DVD
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/lend")
	public Msg lendDVD(@RequestParam(value="id")int id){
		int i = dvdBiz.lendDVD(id,1);
		if (i==2) {
			return Msg.sucess();
		}else {
			return Msg.fail();
		}
	}
	/**
	 * ��DVD
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/return")
	public Msg returnDVD(@RequestParam(value="uid")int uid,@RequestParam(value="did")int did){
		boolean flag = dvdBiz.returnDVD(uid, did);
		if (flag) {
			return Msg.sucess();
		}else {
			return Msg.fail();
		}
		
	}

	/**
	 * dvdɾ��
	 */
	@ResponseBody
	@RequestMapping(value = "/dvd{id}.do", method = RequestMethod.DELETE)
	public Msg deleteDVD(@PathVariable(value = "id") int id) {
		boolean flag = dvdBiz.deleteDVD(id);
		if (flag) {
			return Msg.sucess();
		} else {
			return Msg.fail();
		}

	}
	
}
