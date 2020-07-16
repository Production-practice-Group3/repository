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
		for(PtRRoleOrgan roleOrgan:roleOrgans) {//找到对应的组织和角色信息
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
	
	/**
	 * 增加岗位信息
	 * @param dutiesVO
	 */
	@Override
	public int insert(DutiesVO dutiesVO) {
		// TODO Auto-generated method stub
		PtRRoleOrgan rRoleOrgan=new PtRRoleOrgan();
		rRoleOrgan.setName(dutiesVO.getName());
		rRoleOrgan.setOrganUuid(dutiesVO.getOrgan().getOrganUuid());
		rRoleOrgan.setRoleUuid(dutiesVO.getRole().getRoleUuid());
		ptRRoleOrganMapper.insertSelective(rRoleOrgan);
		return 1;
	}

	/**
	 * 根据id查找岗位信息
	 * @param dutyId
	 * @return
	 */
	@Override
	public DutiesVO getDuty(int dutyId) {
		// TODO Auto-generated method stub
		DutiesVO dutiesVO=new DutiesVO();
		PtRRoleOrgan rRoleOrgan=new PtRRoleOrgan();
		rRoleOrgan=ptRRoleOrganMapper.selectByPrimaryKey(dutyId);
		PtOrgan organ=ptOrganMapper.selectByPrimaryKey(rRoleOrgan.getOrganUuid());
		PtRole role=ptRoleMapper.selectByPrimaryKey(rRoleOrgan.getRoleUuid());
		dutiesVO.setDutyId(rRoleOrgan.getDutyid());
		dutiesVO.setName(rRoleOrgan.getName());
		dutiesVO.setOrgan(organ);
		dutiesVO.setRole(role);
		return dutiesVO;
	}

	/**
	 * 更新岗位信息
	 * @param dutiesVO
	 * @return
	 */
	@Override
	public int update(DutiesVO dutiesVO) {
		// TODO Auto-generated method stub
		PtRRoleOrgan rRoleOrgan=new PtRRoleOrgan();
		rRoleOrgan.setDutyid(dutiesVO.getDutyId());
		rRoleOrgan.setName(dutiesVO.getName());
		rRoleOrgan.setOrganUuid(dutiesVO.getOrgan().getOrganUuid());
		rRoleOrgan.setRoleUuid(dutiesVO.getRole().getRoleUuid());
		ptRRoleOrganMapper.updateByPrimaryKeySelective(rRoleOrgan);
		return 1;
	}

	/**
	 * 根据id删除岗位信息
	 * @param id
	 * @return
	 */
	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		ptRRoleOrganMapper.deleteByPrimaryKey(id);
		return 1;
	}

}
