package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bean.PtMenuDirectory;
import com.bean.PtPageBean;
import com.dao.PtMenuDirectoryMapper;
import com.helpbean.ResVo;
import com.service.PtMenuDirectoryService;
@Service(value = "ptMenuDirectoryService")
@Transactional
public class PtMenuDirectoryServiceImpl implements PtMenuDirectoryService {

	@Autowired
	PtMenuDirectoryMapper ptMenuDirectoryMapper;
	@Override
	public PtPageBean<ResVo> getResources(int pageSize,int pageNumber){
		
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int startIndex=(pageNumber-1)*pageSize;//找到上一批寻找的最后一个是第几个
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<PtMenuDirectory> ptmenudictory = ptMenuDirectoryMapper.getPtMenuDirectoryByPage(map);//找到当前页面的数据
		List<ResVo> reslist= new ArrayList<ResVo>();
		for(PtMenuDirectory res:ptmenudictory) {//我的页面需要的操作，根据你们的自己参考
			ResVo resvo = new ResVo();
			resvo.setMenu_id(res.getMenuId());
			resvo.setDir_name(res.getDirName());
			resvo.setDir_level_number(res.getDirLevelNumber());
			if(res.getParentId().equals("root")) {
				res.setDirName("Root");
				resvo.setParent(res);
			}
			else{
				resvo.setParent(ptMenuDirectoryMapper.selectByPrimaryKey(Integer.parseInt(res.getParentId())));
			}
			resvo.setIsitem(res.getIsitem());
			resvo.setLocale(res.getLocale());
			reslist.add(resvo);
		}
		PtPageBean<ResVo> pageBean=new PtPageBean<ResVo>();
		pageBean.setRows(reslist);//放置数据
		int total=ptMenuDirectoryMapper.getPtMenuDirectoryCount();//找到总数
		pageBean.setTotal(total);//设置总数
		return pageBean;
		
		
	}

}
