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
import com.bean.PtUser;
import com.dao.PtUserMapper;
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
    	PtPageBean<UsersVO> pageBean=PtUserService.selectByPage(pageSize, pageNumber);
		return pageBean;
    }
    
    /**
	 * 删除用户
	 * @return
	 */
    @RequestMapping(value="/remove",method=RequestMethod.GET)
    @ResponseBody
    public String removeUser(int id){
    	System.out.println("....."+id);
    	PtUserService.deleteByPrimaryKey(id);
		return "sucess";
    }

}
