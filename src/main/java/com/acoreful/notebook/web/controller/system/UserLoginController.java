package com.acoreful.notebook.web.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acoreful.notebook.commons.base.BaseController;
import com.acoreful.notebook.commons.mybatis.plugins.PageView;
import com.acoreful.notebook.entity.UserLoginFormMap;
import com.acoreful.notebook.mapper.UserLoginMapper;

/**
 * 
 */
@Controller
@RequestMapping("/userlogin/")
public class UserLoginController extends BaseController {
	@Inject
	private UserLoginMapper userLoginMapper;

	@RequestMapping("listUI")
	public String listUI(Model model) throws Exception {
		return "/system/userlogin/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
			String pageSize) throws Exception {
		UserLoginFormMap userLoginFormMap = getFormMap(UserLoginFormMap.class);
		userLoginFormMap=toFormMap(userLoginFormMap, pageNow, pageSize,userLoginFormMap.getStr("orderby"));
        pageView.setRecords(userLoginMapper.findByPage(userLoginFormMap));
		return pageView;
	}

}