package com.pan.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pan.web.bean.DVD;
import com.pan.web.bean.Msg;
import com.pan.web.bean.Record2;
import com.pan.web.bizimpl.RecordBizImpl;

@Controller
public class recordontroller {
	
	@Autowired
	private RecordBizImpl recordBiz;
	
	@ResponseBody
	@RequestMapping(value="/recordshow")
	public Msg showrecord(@RequestParam(value = "pn", defaultValue = "1") int pn,
			@RequestParam(value = "select_val",defaultValue="0") int select_val,
			@RequestParam(value="uname")String uname){
		if (select_val==0) {
			//全部DVD
			PageHelper.startPage(pn, 5);
			List<Record2> queryAllRecord = recordBiz.queryAllRecord();
			// 用PageInfo对结果进行包装,连续显示5页
			PageInfo page = new PageInfo(queryAllRecord, 5);
			return Msg.sucess().add("PageInfo", page);
		}else if(select_val==1) {
			//可借DVD
			PageHelper.startPage(pn, 5);
			List<Record2> queryNoReturnRecord = recordBiz.queryNoReturnRecord(uname);
			PageInfo page = new PageInfo(queryNoReturnRecord, 5);
			return Msg.sucess().add("PageInfo", page);
		}else {
			//已借DVD
			PageHelper.startPage(pn, 5);
			List<Record2> queryHasReturnRecord = recordBiz.queryHasReturnRecord(uname);
			PageInfo page = new PageInfo(queryHasReturnRecord, 5);
			return Msg.sucess().add("PageInfo", page);
		}
	}
	@ResponseBody
	@RequestMapping(value="/recordall")
	public Msg showrecordMsg(@RequestParam(value = "pn", defaultValue = "1") int pn){
		//全部DVD
		PageHelper.startPage(pn, 5);
		List<Record2> queryAllRecord = recordBiz.queryAllRecord();
		// 用PageInfo对结果进行包装,连续显示5页
		PageInfo page = new PageInfo(queryAllRecord, 5);
		return Msg.sucess().add("PageInfo", page);
	}
	@ResponseBody
	@RequestMapping(value="/recordcondition")
	public Msg conditionrecord(String dname,int pn) {
		PageHelper.startPage(pn, 5);
		List<Record2> queryDVDRecords = recordBiz.queryDVDRecords(dname);
		PageInfo page = new PageInfo(queryDVDRecords,5);
		return Msg.sucess().add("PageInfo", page);
		
	}
	
}
