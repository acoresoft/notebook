package com.acoreful.notebook.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台管理
 * @author WallenHeng
 * @since 2016-3-12 15:02:55
 */
@Controller
@RequestMapping("/index")
public class AdminController {
	@RequestMapping
	public String index(Model model) throws Exception {
		return "index";
	}
}
