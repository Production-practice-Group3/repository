package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtMenuDirectory;
import com.bean.PtPageBean;
import com.bean.PtTree;
import com.helpbean.ResVo;
import com.service.PtMenuDirectoryService;

@Controller
@RequestMapping("/res")
public class PtMenuDirectoryController {

	@Autowired
	PtMenuDirectoryService resService;
	/**
	 * 获取资源展示列表
	 * @return
	 */
	@RequestMapping(value="/getResources",method=RequestMethod.GET)
	@ResponseBody
	public PtPageBean<ResVo> getResources(int pageSize,int pageNumber){//接收当前页面大小和页面数
		PtPageBean<ResVo> pageBean=resService.getResources(pageSize,pageNumber);
		return pageBean;
	}
	
	/**
	 * 删除资源信息
	 */
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	@ResponseBody
	public int remove(int id) {
		int data = resService.deleteRes(id);
		return data;
	}
	
	/**
	 * 增加资源信息
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public int insert(String dir_name,String parent_name,int parent_id,String isitem) {
		int data=resService.insert(dir_name,parent_id,isitem);
		return data;
	}
	
	/**
	 * 根据menuid获取资源信息
	 */
	@RequestMapping(value="/getResource",method=RequestMethod.GET)
	@ResponseBody
	public ResVo getResource(int uuid) {
		//System.out.print(uuid+".................");
		ResVo resvo = resService.getResource(uuid);
		
		return resvo;
	}
	
	/**
	 * 更新资源信息
	 * @param resvo
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public int update(String dir_name,String parent_name,int parent_id,String isitem,int menu_id) {
		int data = resService.update(dir_name,parent_id,isitem,menu_id);
		return data;
	}
	
	
	/**
	 * 资源树
	 */
	@RequestMapping(value="/getResourcesByParentId",method=RequestMethod.GET)
	@ResponseBody
	public PtTree getResourcesByParentId(){
		PtTree tree = resService.getResourcesByParentId();
		return tree;	
	}
}
