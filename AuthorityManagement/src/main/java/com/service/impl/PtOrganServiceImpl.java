package com.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.bean.PtRRoleOrgan;
import com.bean.PtUser;
import com.dao.PtOrganMapper;
import com.helpbean.OrgansVO;
import com.helpbean.UsersVO;
import com.service.PtOrganService;
@Service
public class PtOrganServiceImpl implements PtOrganService{
	
	@Autowired
	private PtOrganMapper ptOrganMapper;
	
	/**
	 * 分页展示组织信息列表
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@Override
	public PtPageBean<OrgansVO> selectByPage(int pageSize,int pageNumber) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int startIndex=(pageNumber-1)*pageSize;//找到上一批寻找的最后一个是第几个
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<PtOrgan> organ=ptOrganMapper.selectByPage(map);//找到当前页面的数据
		List<OrgansVO> orglist= new ArrayList<OrgansVO>();
		for(PtOrgan o:organ) {//我的页面需要的操作，根据你们的自己参考
			OrgansVO organs=new OrgansVO();
			organs.setOrganUuid(o.getOrganUuid());
			organs.setOrganCode(o.getOrganCode());
			organs.setOrganName(o.getOrganName());
			String pn = ptOrganMapper.getParentName(o);
			organs.setParentName(pn);
			organs.setShortname(o.getShortname());
			organs.setModtime(o.getModtime());
			orglist.add(organs);
		}
		PtPageBean<OrgansVO> pageBean=new PtPageBean<OrgansVO>();
		pageBean.setRows(orglist);//放置数据
		int total=ptOrganMapper.getOrganCount();//找到总数
		pageBean.setTotal(total);//设置总数
		return pageBean;
	}
	
	/**
     * 新增组织信息
     * @param organ
     * @return
     */
	@Override
	public int insertOrgan(PtOrgan org) {
		Date day=new Date();
		org.setParentUuid(8);//用于测试，需修改
		int parentID = org.getParentUuid();
		String count ="2";//级数至少为2
		int parseInt = 2;
		if(parentID != -1) {
			PtOrgan organ=ptOrganMapper.selectByPrimaryKey(parentID);
			count = organ.getOrganType();
			parseInt = Integer.parseInt(count);
			parseInt++;
		}
		org.setOrganType(String.valueOf(parseInt));
		org.setStatus("N");
		org.setModtime(day);
		ptOrganMapper.insertSelective(org);
		return 1;
	}

	/**
	 * 根据id查找组织信息
	 * @param uuid
	 * @return
	 */
    @Override
	public PtOrgan selectByPrimaryKey(Integer uuid) {
    	PtOrgan organ=ptOrganMapper.selectByPrimaryKey(uuid);
    	String pn = ptOrganMapper.getParentName(organ);
		organ.setParentName(pn);
    	return organ;
	}
	
	/**
	 * 修改组织信息
	 * @param organ
	 * @return
	 */
	@Override
	public int updateOrgan(PtOrgan organ) {
		//organ.setStatus("N");
		Date day=new Date();
		organ.setModtime(day);
		organ.setParentUuid(10);//用于测试，需修改
		int parentID = organ.getParentUuid();
		String count ="2";//级数至少为2
		int parseInt = 2;
		if(parentID != -1) {
			PtOrgan org=ptOrganMapper.selectByPrimaryKey(parentID);
			count = org.getOrganType();
			parseInt = Integer.parseInt(count);
			parseInt++;
			count = String.valueOf(parseInt);
		}
		organ.setOrganType(count);
		int res = ptOrganMapper.updateByPrimaryKeySelective(organ);
		parseInt++;
		count= String.valueOf(parseInt);
		List<PtOrgan> orgs = ptOrganMapper.findChildAll(organ.getOrganUuid());
		for(PtOrgan org:orgs) {
			org.setOrganType(count);
			org.setModtime(day);
			ptOrganMapper.updateByPrimaryKey(org);
		}
		return res;
	}

	/**
	 * 删除组织信息
	 * @param uuid
	 * @return
	 */
	@Override
	public int removeOrgan(Integer uuid) {
		System.out.println(uuid);
		int res = ptOrganMapper.removeByPrimaryKey(uuid);
		List<PtOrgan> orgs = ptOrganMapper.findChildAll(uuid);
		for(PtOrgan org:orgs) {
			ptOrganMapper.removeByPrimaryKey(org.getOrganUuid());
		}
		return res;
	}
}
