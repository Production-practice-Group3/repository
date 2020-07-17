package com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtPageBean;
import com.bean.PtRRoleOrgan;
import com.bean.PtUser;
import com.dao.PtUserMapper;
import com.helpbean.DutiesVO;
import com.helpbean.UsersVO;
import com.service.PtUserService;

@Controller
@RequestMapping("/user")
public class PtUserController {

	@Autowired
	private PtUserService PtUserService;
	
	/**
	 * 获取用户信息列表
	 * @return
	 */
    @RequestMapping(value="/getUsers",method=RequestMethod.GET)
    @ResponseBody
    public PtPageBean<UsersVO> listUser(int pageSize,int pageNumber){
		return PtUserService.selectByPage(pageSize, pageNumber);
    }
    /**
	 * 增加用户
	 * @param dutiesVO
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public int insertUser(UsersVO u) {
		return PtUserService.insert(u);
	}
	
	/**
	 * 根据id获取用户信息
	 * @param dutyId
	 * @return
	 */
	@RequestMapping(value="/getUser",method=RequestMethod.GET)
	@ResponseBody
	public UsersVO getUser(int uuid) {
		return PtUserService.selectByPrimaryKey(uuid);
	}
	
	/**
	 * 更新用户信息
	 * @param dutiesVO
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public int updateUser(UsersVO u) {
		return PtUserService.updateByPrimaryKey(u);
	}
    
    /**
	 * 删除用户
	 * @return
	 */
    @RequestMapping(value="/remove",method=RequestMethod.GET)
    @ResponseBody
    public int removeUser(int id){
		 return PtUserService.deleteByPrimaryKey(id);
    }

}
