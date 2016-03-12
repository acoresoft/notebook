package com.acoreful.notebook.mapper;

import java.util.List;

import com.acoreful.notebook.entity.RoleFormMap;
import com.acoreful.notebook.mapper.base.BaseMapper;

public interface RoleMapper extends BaseMapper{
	public List<RoleFormMap> seletUserRole(RoleFormMap map);
	
	public void deleteById(RoleFormMap map);
}
