package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtPageBean;
import com.bean.PtRRoleOrgan;
import com.dao.PtRRoleOrganMapper;
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
	
	/**
	 * 增加岗位信息
	 * @param dutiesVO
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public int insert(DutiesVO dutiesVO) {
		int data=dutyService.insert(dutiesVO);
		return data;
	}
	
	/**
	 * 根据id获取岗位信息
	 * @param dutyId
	 * @return
	 */
	@RequestMapping(value="/getDuty",method=RequestMethod.GET)
	@ResponseBody
	public DutiesVO getDuty(int uuid) {
		DutiesVO dutiesVO=dutyService.getDuty(uuid);
		return dutiesVO;
	}
	
	/**
	 * 更新岗位信息
	 * @param dutiesVO
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public int update(DutiesVO dutiesVO) {
		int data=dutyService.update(dutiesVO);
		return data;
	}
	
	/**
	 * 根据id删除岗位信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	@ResponseBody
	public int remove(int id) {
		int data=dutyService.remove(id);
		return data;
	}
	
	/**
	 * 根据组织id查找岗位
	 * @param organId
	 * @return
	 */
	@RequestMapping(value="/getDutyByOrganId",method=RequestMethod.GET)
	@ResponseBody
	public List<PtRRoleOrgan> getDutyByOrganId(int organId){
		List<PtRRoleOrgan> roleOrgans=dutyService.getDutyByOrganId(organId);
		return roleOrgans;
	}
}