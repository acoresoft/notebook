package com.acoreful.notebook.mapper;

import java.util.List;

import com.acoreful.notebook.entity.UserFormMap;
import com.acoreful.notebook.mapper.base.BaseMapper;


public interface UserMapper extends BaseMapper{

	public List<UserFormMap> findUserPage(UserFormMap userFormMap);
	
}
