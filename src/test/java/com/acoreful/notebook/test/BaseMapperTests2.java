package com.acoreful.notebook.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.acoreful.notebook.entity.ResFormMap;
import com.github.abel533.mapper.Mapper;

public class BaseMapperTests2 extends AbstractSpringMvcTester {
	@Autowired
	private Mapper<ResFormMap> mapper;
	@Test
	public void testFind() throws Exception {
		mapper.select(new ResFormMap());
	}	
}
