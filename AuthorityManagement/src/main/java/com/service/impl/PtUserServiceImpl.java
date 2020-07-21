package com.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.bean.PtRRoleOrgan;
import com.bean.PtRUserDutyOrg;
import com.bean.PtUser;
import com.service.PtUserService;
import com.dao.PtOrganMapper;
import com.dao.PtRUserDutyOrgMapper;
import com.dao.PtUserMapper;
import com.helpbean.UsersVO;
@Service
public class PtUserServiceImpl implements PtUserService{

	@Autowired
	private PtUserMapper ptUserMapper;
	@Autowired
	private PtOrganMapper ptOrganMapper;
	@Autowired
	private PtRUserDutyOrgMapper ptRUserDutyOrgMapper;
	
	
    @Override
	public int deleteByPrimaryKey(Integer userUuid) {
		return ptUserMapper.deleteByPrimaryKey(userUuid);
	}
    /**
	 * 新增用户
	 * @return
	 */
    @Override
	public int insert(UsersVO record) {
    	if((record.getUsername()==null||record.getUsername().trim()=="")||
    			(record.getPassword()==null||record.getPassword().trim()=="")) {//新增用户名密码为空
    		return 3;
    	}
    	if(ptUserMapper.selectByUsername(record.getUsername())!=null) {//判断用户名是否重名
    		return 2;//重名
    	}
    	PtUser u=new PtUser();
    	u.setUsername(record.getUsername());
    	u.setRemark(record.getRemark());
    	u.setPassword(record.getPassword());
    	u.setOrganUuid(record.getOrgan().getOrganUuid());
    	u.setNiceName(record.getNiceName());
    	u.setMobile(record.getMobile());
    	u.setEmail(record.getEmail());
    	u.setStatus("N");
    	ptUserMapper.insert(u);
    	//岗位关联表插入操作
    	if(record.getDuties()!=null) {//用户已分配岗位
    		for(int i=0;i<record.getDuties().size();i++) {
    			PtRRoleOrgan duty=record.getDuties().get(i);
    			if(duty.getDutyid()!=null) {
    			
        		PtRUserDutyOrg r=new PtRUserDutyOrg();
        		r.setDutyid(duty.getDutyid());
        		 
        		r.setUserUuid(ptUserMapper.selectByUsername(u.getUsername()).getUserUuid());
        		ptRUserDutyOrgMapper.insert(r);
    			}
        	}
    	}
    	
    	return 1;
	}
    /**
	 * 查找用户
	 * @return
	 */
    @Override
	public UsersVO selectByPrimaryKey(Integer userUuid) {
    	PtUser u=ptUserMapper.selectByPrimaryKey(userUuid);
    	UsersVO user=new UsersVO();
    	user.setUserUuid(u.getUserUuid());
    	user.setUsername(u.getUsername());
    	user.setRemark(u.getRemark());
    	user.setPassword(u.getPassword());
    	//找组织
    	PtOrgan organ=ptOrganMapper.selectByPrimaryKey(u.getOrganUuid());
    	user.setOrgan(organ);
    	
    	user.setNiceName(u.getNiceName());
    	user.setMobile(u.getMobile());
    	user.setEmail(u.getEmail());
    	//找岗位
    	List<PtRRoleOrgan> duty=ptRUserDutyOrgMapper.selectByUserid(u.getUserUuid());
    	user.setDuties(duty);
    	
		return user;
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
    			map.put("startIndex", startIndex);
    			map.put("pageSize", pageSize);
    			List<PtUser> searchList=ptUserMapper.selectByPage(map);//找到当前页面的数据
    			List<UsersVO> list= new ArrayList<UsersVO>();
    			
    			for(PtUser u:searchList) {
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
    /**
	 * 更新用户
	 * @return
	 */
    
    @Override
	public int updateByPrimaryKey(UsersVO record) {
    	if((record.getUsername()==null||record.getUsername().trim()=="")||
    			(record.getPassword()==null||record.getPassword().trim()=="")) {//修改用户名密码为空
    		return 3;
    	}
    	if(ptUserMapper.selectByUser(record)!=null) {//判断用户名是否重名
    		return 2;//重名
    	}
    	PtUser u=new PtUser();
    	u.setUserUuid(record.getUserUuid());
    	u.setUsername(record.getUsername());
    	u.setRemark(record.getRemark());
    	u.setPassword(record.getPassword());
    	u.setOrganUuid(record.getOrgan().getOrganUuid());
    	u.setNiceName(record.getNiceName());
    	u.setMobile(record.getMobile());
    	u.setEmail(record.getEmail());
    	u.setStatus("N");
    	ptUserMapper.updateByPrimaryKey(u);
    	//岗位关联表更新操作
	ptRUserDutyOrgMapper.deleteByUserid(record.getUserUuid());
    	if(record.getDuties()!=null) {//用户已分配岗位
    		for(int i=0;i<record.getDuties().size();i++) {
    			PtRRoleOrgan duty=record.getDuties().get(i);
    			if(duty.getDutyid()!=null) {
        		PtRUserDutyOrg r=new PtRUserDutyOrg();
        		r.setDutyid(duty.getDutyid());
        		r.setUserUuid(record.getUserUuid());
        		ptRUserDutyOrgMapper.insert(r);
        		
        		//ptRUserDutyOrgMapper.updateByUserid(record.getUserUuid(), duty.getDutyid());
    			}
        	}
    	}
    	
    	
		return 1;
	}

	

}
