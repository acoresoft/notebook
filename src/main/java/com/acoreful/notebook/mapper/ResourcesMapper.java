package com.acoreful.notebook.mapper;

import java.util.List;

import com.acoreful.notebook.entity.ResFormMap;
import com.acoreful.notebook.mapper.base.BaseMapper;

public interface ResourcesMapper extends BaseMapper {
	public List<ResFormMap> findChildlists(ResFormMap map);

	public List<ResFormMap> findRes(ResFormMap map);

	public void updateSortOrder(List<ResFormMap> map);
	
	public List<ResFormMap> findUserResourcess(String userId);
	
}
