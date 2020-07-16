package com.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.bean.PtUser;
import com.service.PtUserService;
import com.dao.PtOrganMapper;
import com.dao.PtUserMapper;
import com.helpbean.UsersVO;
@Service
public class PtUserServiceImpl implements PtUserService{

	@Autowired
	private PtUserMapper ptUserMapper;
	@Autowired
	private PtOrganMapper ptOrganMapper;
	
	
    @Override
	public int deleteByPrimaryKey(Integer userUuid) {
		return ptUserMapper.deleteByPrimaryKey(userUuid);
	}
    @Override
	public int insert(PtUser record) {
		return ptUserMapper.insert(record);
	}
    
    @Override
	public PtUser selectByPrimaryKey(Integer userUuid) {
		return ptUserMapper.selectByPrimaryKey(userUuid);
	}
    /**
	 * 获取展示的用户列表
	 * @return
	 */
    @Override
	public PtPageBean<UsersVO> selectByPage(int pageSize,int pageNumber) {
    	// TODO Auto-generated method stub
    			HashMap<String, Integer> map=new HashMap<String, Integer>();
    			int startIndex=(pageNumber-1)*pageSize;//找到上一批寻找的最后一个是第几个
    			System.out.println("......"+startIndex);
    			map.put("startIndex", startIndex);
    			map.put("pageSize", pageSize);
    			List<PtUser> searchList=ptUserMapper.selectByPage(map);//找到当前页面的数据
    			List<UsersVO> list= new ArrayList<UsersVO>();
    			
    			for(PtUser u:searchList) {
    				System.out.println("......"+u.getNiceName());
    				UsersVO user=new UsersVO();
    				user.setUserUuid(u.getUserUuid());
    				user.setUsername(u.getUsername());
    				user.setEmail(u.getEmail());
    				user.setMobile(u.getMobile());
    				user.setNiceName(u.getNiceName());
    				user.setModtime(u.getModtime());
    				PtOrgan organ=ptOrganMapper.selectByPrimaryKey(u.getOrganUuid());
    				user.setOrgan(organ);
    				list.add(user);
    			}
    			PtPageBean<UsersVO> pageBean=new PtPageBean<UsersVO>();
    			pageBean.setRows(list);//放置数据
    			int total=ptUserMapper.getCount();//找到总数
    			pageBean.setTotal(total);//设置总数
    			return pageBean;
	}
    
    @Override
	public int updateByPrimaryKey(PtUser record) {
		return ptUserMapper.updateByPrimaryKey(record);
	}

	

}
