package com.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	//查询所有角色信息(分页查询)
	@RequestMapping(value="/getRoles",method=RequestMethod.GET)
	@ResponseBody
	public PtPageBean<RolesVO> getRolesVO(int pageSize,int pageNumber){
		PtPageBean<RolesVO> pageBean=ptRoleService.getRolesVO(pageSize, pageNumber);
		return pageBean;
	}
	
	//根据id获取角色信息
	@RequestMapping(value="/getRole" ,method = RequestMethod.GET)
	@ResponseBody
	public PtRole getRole(int uuid) {
		return ptRoleService.getRole(uuid);
	}
	
	//更新角色信息
	@RequestMapping(value="/update" ,method = RequestMethod.POST)
	@ResponseBody
	public int updatePtRole(PtRole ptRole) {
		return ptRoleService.updatePtRole(ptRole);
	}
	
	//提供可以分配的角色
	@RequestMapping(value="/getRoles2" ,method = RequestMethod.GET)
	@ResponseBody
	public List<PtRole> getRoles2(){
		return ptRoleService.getRoles2();
	}
	
	
	//增加角色信息
	@RequestMapping(value="/insert" ,method = RequestMethod.POST)
	@ResponseBody
	public int addPtRole(PtRole ptRole) {
		return ptRoleService.addPtRole(ptRole);
	}
	
	//删除角色信息
	@RequestMapping(value="/remove" ,method = RequestMethod.GET)
	@ResponseBody
	public int deletePtRole(int id) {
		return ptRoleService.deletePtRole(id);
	}
	
}
