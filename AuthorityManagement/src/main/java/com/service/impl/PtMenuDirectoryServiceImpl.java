package com.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bean.PtMenuDirectory;
import com.bean.PtPageBean;
import com.bean.PtTree;
import com.dao.PtMenuDirectoryMapper;
import com.helpbean.ResVo;
import com.service.PtMenuDirectoryService;

@Service(value = "ptMenuDirectoryService")
@Transactional
public class PtMenuDirectoryServiceImpl implements PtMenuDirectoryService {

	@Autowired
	PtMenuDirectoryMapper ptMenuDirectoryMapper;

	@Override
	public PtPageBean<ResVo> getResources(int pageSize, int pageNumber) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startIndex = (pageNumber - 1) * pageSize;// 找到上一批寻找的最后一个是第几个
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<PtMenuDirectory> ptmenudictory = ptMenuDirectoryMapper.getPtMenuDirectoryByPage(map);// 找到当前页面的数据
		List<ResVo> reslist = new ArrayList<ResVo>();
		for (PtMenuDirectory res : ptmenudictory) {// 我的页面需要的操作，根据你们的自己参考
			ResVo resvo = new ResVo();
			resvo.setMenu_id(res.getMenuId());
			resvo.setDir_name(res.getDirName());
			resvo.setDir_level_number(res.getDirLevelNumber());
			if (res.getParentId()==-1) {
				res.setDirName("Root");
				resvo.setParent(res);
			} else {
				resvo.setParent(ptMenuDirectoryMapper.selectByPrimaryKey(res.getParentId()));
			}
			resvo.setIsitem(res.getIsitem());
			resvo.setLocale(res.getLocale());
			/* resvo.setRes_uuid(res.getResUuid()); */
			reslist.add(resvo);
		}
		PtPageBean<ResVo> pageBean = new PtPageBean<ResVo>();
		pageBean.setRows(reslist);// 放置数据
		int total = ptMenuDirectoryMapper.getPtMenuDirectoryCount();// 找到总数
		pageBean.setTotal(total);// 设置总数
		return pageBean;

	}

	/**
	 * 删除资源信息
	 */
	@Override
	public int deleteRes(int id) {
		// TODO Auto-generated method stub
		if (ptMenuDirectoryMapper.selectParentId(id).size() == 0) {
			ptMenuDirectoryMapper.updateStatus("1", id);
			return 1;
		} else {
			return -1;
		}
	}

	/**
	 * 新增资源信息
	 */
	@Override
	public int insert(String dir_name, int parent_id, String isitem) {
		// TODO Auto-generated method stub
		PtMenuDirectory ptmd = new PtMenuDirectory();
		List<String> names = ptMenuDirectoryMapper.selectMenuName();
		for (String name : names) {
			if (dir_name.equals(name))
				return -1;
		}
		ptmd.setDirName(dir_name);
		ptmd.setIsitem(isitem);
		ptmd.setParentId(parent_id);
		if (parent_id==-1) {
			ptmd.setDirLevelNumber(1);
		} else {
			int n = ptMenuDirectoryMapper.selectByPrimaryKey(parent_id).getDirLevelNumber() + 1;
			ptmd.setDirLevelNumber(n);
		}
		ptMenuDirectoryMapper.insertSelective(ptmd);
		return 1;
	}

	/**
	 * 根据menuid获取资源
	 */
	@Override
	public ResVo getResource(int menu_id) {
		// TODO Auto-generated method stub
		PtMenuDirectory ptmd = new PtMenuDirectory();
		ptmd = ptMenuDirectoryMapper.selectByPrimaryKey(menu_id);
		ResVo resvo = new ResVo();
		resvo.setMenu_id(ptmd.getMenuId());
		resvo.setDir_name(ptmd.getDirName());
		resvo.setIsitem(ptmd.getIsitem());
		if (ptmd.getParentId()==-1) {
			PtMenuDirectory ptmd2 = new PtMenuDirectory();
			ptmd2.setDirName("Root");
			ptmd2.setMenuId(-1);
			resvo.setParent(ptmd2);
		} else {
			resvo.setParent(ptMenuDirectoryMapper.selectByPrimaryKey(ptmd.getParentId()));
		}
		return resvo;
	}

	/**
	 * 更新资源信息
	 */
	@Override
	public int update(String dir_name, int parent_id, String isitem, int uuid) {
		// TODO Auto-generated method stub
		PtMenuDirectory ptmd = new PtMenuDirectory();
		List<PtTree> childs = selectchild(uuid);
		for(PtTree t : childs) {
			if(t.getId()==parent_id)
				return -1;
		}
		if(uuid==parent_id) {
			return -1;
		}
		ptmd.setMenuId(uuid);
		List<String> names = ptMenuDirectoryMapper.selectMenuName();
		for (String name : names) {
			if (dir_name.equals(name) && !dir_name.equals(ptMenuDirectoryMapper.selectByPrimaryKey(uuid).getDirName()))
				return -1;
		}
		ptmd.setDirName(dir_name);
		ptmd.setIsitem(isitem);
		ptmd.setParentId(parent_id);
		if (parent_id==-1) {
			ptmd.setDirLevelNumber(1);
		} else {
			int n = ptMenuDirectoryMapper.selectByPrimaryKey(parent_id).getDirLevelNumber() + 1;
			ptmd.setDirLevelNumber(n);
		}
		for(PtTree t : childs) {
			int m = ptMenuDirectoryMapper.selectByPrimaryKey(t.getId()).getDirLevelNumber();
			int n =ptmd.getDirLevelNumber()-ptMenuDirectoryMapper.selectByPrimaryKey(uuid).getDirLevelNumber();
			ptMenuDirectoryMapper.updateLevelById(m+n, t.getId());
		}
		ptMenuDirectoryMapper.updateByPrimaryKeySelective(ptmd);
		return 1;

	}

	/**
	 * 资源树
	 */
	@Override
	public PtTree getResourcesByParentId() {
		// TODO Auto-generated method stub
		
		PtTree tree = new PtTree();
		tree.setId(-1);
		tree.setName("root");
		List<PtMenuDirectory> childs = ptMenuDirectoryMapper.selectParentId(-1);
		tree.setHasChildren(childs.size()!=0);
		tree.setChildren(selectchild(-1));
		return tree;
	}
	
	public List<PtTree> selectchild(int id){
		List<PtMenuDirectory> childs = ptMenuDirectoryMapper.selectParentId(id);
		List<PtTree> children = new ArrayList<PtTree>();
		for(PtMenuDirectory child : childs) {
			PtTree tree = new PtTree();
			tree.setId(child.getMenuId());
			tree.setName(child.getDirName());
			List<PtMenuDirectory> list = ptMenuDirectoryMapper.selectParentId(child.getMenuId());
			tree.setHasChildren(list.size()!=0);
			tree.setChildren(selectchild(child.getMenuId()));
			children.add(tree);
		}
		return children;
		
	}
}
