package com.acoreful.notebook.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.acoreful.notebook.commons.base.BaseController;
import com.acoreful.notebook.commons.util.Common;
import com.acoreful.notebook.commons.util.TreeObject;
import com.acoreful.notebook.commons.util.TreeUtil;
import com.acoreful.notebook.entity.ResFormMap;
import com.acoreful.notebook.entity.UserFormMap;
import com.acoreful.notebook.mapper.ResourcesMapper;

/**
 * 后台管理
 * @author WallenHeng
 * @since 2016-3-12 15:02:55
 */
@Controller
@RequestMapping("/index")
public class AdminController extends BaseController{
	@Inject
	private ResourcesMapper resourcesMapper;
	@RequestMapping
	public String index(Model model) throws Exception {
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
		ResFormMap resFormMap = new ResFormMap();
		resFormMap.put("userId", userFormMap.get("id"));
		List<ResFormMap> mps = resourcesMapper.findRes(resFormMap);
		//List<ResFormMap> mps = resourcesMapper.findByWhere(new ResFormMap());
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		model.addAttribute("list", ns);
		// 登陆的信息回传页面
		model.addAttribute("userFormMap", userFormMap);
		return "index";
	}
}
