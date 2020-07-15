package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtPageBean;
import com.bean.PtRole;
import com.helpbean.RolesVO;
import com.service.PtRoleService;

@Controller
@RequestMapping("/role")
public class PtRoleController {
	
	@Autowired
	private PtRoleService ptRoleService;
	
	@RequestMapping(value="/getRoles",method=RequestMethod.GET)
	@ResponseBody
	public PtPageBean<RolesVO> getRolesVO(int pageSize,int pageNumber){
		PtPageBean<RolesVO> pageBean=ptRoleService.getRolesVO(pageSize, pageNumber);
		return pageBean;
	}
}
