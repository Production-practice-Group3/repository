package com.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.helpbean.OrgansVO;
import com.service.PtOrganService;

@Controller
@RequestMapping("/org")
public class PtOrganController {

	@Autowired
	private PtOrganService PtOrganService;
	
	/**
	 * 分页展示组织信息列表
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
    @RequestMapping(value="/getOrgs",method=RequestMethod.GET)
    @ResponseBody
    public PtPageBean<OrgansVO> listOrgan(int pageSize,int pageNumber){
    	PtPageBean<OrgansVO> pageBean=PtOrganService.selectByPage(pageSize, pageNumber);
		return pageBean;
    }
    
    /**
     * 新增组织信息
     * @param organ
     * @return
     */
    @RequestMapping(value="/insert",method=RequestMethod.POST)
    @ResponseBody
    public int addOrgan(PtOrgan organ){
    	int result = PtOrganService.insertOrgan(organ);
    	return result;
    }
}
