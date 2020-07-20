package com.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtTree;
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
			if(o.getParentUuid()==-1) {
				organs.setParentName("国电集团");
			}else {
				String pn = ptOrganMapper.getParentName(o);
				organs.setParentName(pn);
			}
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
		int res = ptOrganMapper.insertSelective(org);
		return res;
	}

	/**
	 * 根据id查找组织信息
	 * @param uuid
	 * @return
	 */
    @Override
	public PtOrgan selectByPrimaryKey(Integer uuid) {
    	PtOrgan organ=ptOrganMapper.selectByPrimaryKey(uuid);
    	if(organ.getParentUuid()==-1) {
			organ.setParentName("国电集团");
		}else {
			String pn = ptOrganMapper.getParentName(organ);
			organ.setParentName(pn);
		}
    	return organ;
	}
	
	/**
	 * 修改组织信息
	 * @param organ
	 * @return
	 */
	@Override
	public int updateOrgan(PtOrgan organ) {
		int parentID = organ.getParentUuid();
		int flag = check(organ.getOrganUuid(),parentID);
		if(flag != -1) {
			int res = update(organ);
			return res;
		}
		else {
			return 2;
		}	
	}
	
	/**
	 * 修改组织信息
	 * @param organ
	 * @return
	 */
	@Override
	public int update(PtOrgan organ) {
		int parentID = organ.getParentUuid();
		String count = "2";// 级数至少为2
		int parseInt = 2;
		PtOrgan org = new PtOrgan();
		if (parentID != -1) {
			org = ptOrganMapper.selectByPrimaryKey(parentID);
			count = org.getOrganType();
			parseInt = Integer.parseInt(count);
			parseInt++;
			count = String.valueOf(parseInt);
		}
		organ.setOrganType(count);
		ptOrganMapper.updateByPrimaryKeySelective(organ);
		List<PtOrgan> orgs = ptOrganMapper.findChildAll(organ.getOrganUuid());
		for (PtOrgan o : orgs) {
			update(o);
		}
		return 1;
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
			removeOrgan(org.getOrganUuid());
		}
		return res;
	}
	
	/**
	 * 判断是否可修改id1的父组织为id2
	 * @param id1
	 * @param id2
	 * @return
	 */
	public int check(int id1,int id2) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(id1);
		list = findChild(list);
		for(Integer l:list) {
			if(l == id2) {
				return -1;
			}
		}
		return list.size();
	}
	
	
	public ArrayList<Integer> findChild(ArrayList<Integer> id){
		int length = id.size();
		int root = id.get(length-1);
		List<PtOrgan> orgs = ptOrganMapper.findChildAll(root);
		for(PtOrgan org:orgs) {
			id.add(org.getOrganUuid());
			findChild(id);
		}
		return id;
	}
	
	/**
	 * 建立组织树
	 * @return
	 */
	public PtTree buildOrgTree(){
		PtTree tree = new PtTree();
		tree.setId(-1);
		tree.setName("国电集团");
		List<PtOrgan> org=ptOrganMapper.findChildAll(-1);
		tree.setChildren(buildChild(-1));
		if(org.size() != 0) {
			tree.setHasChildren(true);	
		}else {
			tree.setHasChildren(false);
		}
		return tree;
	}
	
	public List<PtTree> buildChild(int id) {
		List<PtOrgan> org=ptOrganMapper.findChildAll(id);
		List<PtTree> list=new ArrayList<PtTree>();
		for(PtOrgan o:org) {
			PtTree tree = new PtTree();
			tree.setId(o.getOrganUuid());
			tree.setName(o.getOrganName());
			tree.setChildren(buildChild(o.getOrganUuid()));
			if(tree.getChildren().size() != 0) {
				tree.setHasChildren(true);	
			}else {
				tree.setHasChildren(false);
			}
			list.add(tree);
		}
		return list;
	}
}
