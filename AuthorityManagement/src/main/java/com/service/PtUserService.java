package com.service;

import java.util.List;

import com.bean.PtPageBean;
import com.bean.PtUser;
import com.helpbean.UsersVO;

public interface PtUserService {
	int deleteByPrimaryKey(Integer userUuid);

    int insert(UsersVO record);


    UsersVO selectByPrimaryKey(Integer userUuid);
    /**
	 * 获取展示的用户列表
	 * @return
	 */
    PtPageBean<UsersVO> selectByPage(int pageSize,int pageNumber);

    int updateByPrimaryKey(UsersVO record);

}
