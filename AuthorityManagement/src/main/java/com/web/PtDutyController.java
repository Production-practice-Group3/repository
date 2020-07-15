package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtPageBean;
import com.helpbean.DutiesVO;
import com.service.PtDutyService;

@RequestMapping("/duty")
@Controller
public class PtDutyController {

	@Autowired
	private PtDutyService dutyService;
	/**
	 * 获取岗位展示列表
	 * @return
	 */
	@RequestMapping(value="/getDuties",method=RequestMethod.GET)
	@ResponseBody
	public PtPageBean<DutiesVO> getDuties(int pageSize,int pageNumber){//接收当前页面大小和页面数
		PtPageBean<DutiesVO> pageBean=dutyService.getDuties(pageSize,pageNumber);
		return pageBean;
	}
}
