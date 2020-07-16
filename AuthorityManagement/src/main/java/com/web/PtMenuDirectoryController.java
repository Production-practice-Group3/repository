package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtPageBean;
import com.helpbean.ResVo;
import com.service.PtMenuDirectoryService;

@Controller
@RequestMapping("/res")
public class PtMenuDirectoryController {

	@Autowired
	PtMenuDirectoryService resService;
	/**
	 * 获取资源展示列表
	 * @return
	 */
	@RequestMapping(value="/getResources",method=RequestMethod.GET)
	@ResponseBody
	public PtPageBean<ResVo> getResources(int pageSize,int pageNumber){//接收当前页面大小和页面数
		PtPageBean<ResVo> pageBean=resService.getResources(pageSize,pageNumber);
		return pageBean;
	}
	
}
