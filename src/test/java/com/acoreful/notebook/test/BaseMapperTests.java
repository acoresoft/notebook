package com.acoreful.notebook.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.acoreful.notebook.commons.util.ConfigUtils;
import com.acoreful.notebook.entity.ResFormMap;
import com.acoreful.notebook.mapper.base.BaseMapper;

public class BaseMapperTests extends AbstractSpringMvcTester {
	@Autowired
	private BaseMapper baseMapper;
	@Test
	public void testFind() throws Exception {
		new ConfigUtils().initTableField(baseMapper); 
		baseMapper.findByWhere(new ResFormMap());
	}	
}
