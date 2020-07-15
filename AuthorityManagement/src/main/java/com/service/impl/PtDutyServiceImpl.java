package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.bean.PtRRoleOrgan;
import com.bean.PtRole;
import com.dao.PtOrganMapper;
import com.dao.PtRRoleOrganMapper;
import com.dao.PtRoleMapper;
import com.helpbean.DutiesVO;
import com.service.PtDutyService;

@Service
public class PtDutyServiceImpl implements PtDutyService {

	@Autowired
	private PtRRoleOrganMapper ptRRoleOrganMapper;
	@Autowired
	private PtOrganMapper ptOrganMapper;
	@Autowired
	private PtRoleMapper ptRoleMapper;
	/**
	 * 分页展示的岗位列表
	 * @return
	 */
	@Override
	public PtPageBean<DutiesVO> getDuties(int pageSize,int pageNumber) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int startIndex=(pageNumber-1)*pageSize;//找到上一批寻找的最后一个是第几个
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<PtRRoleOrgan> roleOrgans=ptRRoleOrganMapper.getRRoleOrgansByPage(map);//找到当前页面的数据
		List<DutiesVO> duties= new ArrayList<DutiesVO>();
		for(PtRRoleOrgan roleOrgan:roleOrgans) {//我的页面需要的操作，根据你们的自己参考
			DutiesVO dutiesVO=new DutiesVO();
			dutiesVO.setName(roleOrgan.getName());
			dutiesVO.setDutyId(roleOrgan.getDutyid());
			PtOrgan organ=ptOrganMapper.selectByPrimaryKey(roleOrgan.getOrganUuid());
			dutiesVO.setOrgan(organ);
			PtRole role=ptRoleMapper.selectByPrimaryKey(roleOrgan.getRoleUuid());
			dutiesVO.setRole(role);
			duties.add(dutiesVO);
		}
		PtPageBean<DutiesVO> pageBean=new PtPageBean<DutiesVO>();
		pageBean.setRows(duties);//放置数据
		int total=ptRRoleOrganMapper.getRRoleOrganCount();//找到总数
		pageBean.setTotal(total);//设置总数
		return pageBean;
	}

}
