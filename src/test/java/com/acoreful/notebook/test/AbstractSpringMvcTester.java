package com.acoreful.notebook.test;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextHierarchy({
	@ContextConfiguration(name = "parent", locations = {
			"classpath:applicationContext.xml"}),
	@ContextConfiguration(name = "child", locations = { 
			"file:src/main/webapp/WEB-INF/spring-mvc.xml" }) 
})
/*@ActiveProfiles(profiles = Profiles.CURRENT)*/
public abstract class AbstractSpringMvcTester {

	@Autowired
	private WebApplicationContext wac;

	protected MockMvc mockMvc;
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac)
				.addFilter(new CharacterEncodingFilter(), "/*")
				.addFilter(new HiddenHttpMethodFilter(), "/*").build();
	}

}