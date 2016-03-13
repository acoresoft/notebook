package com.acoreful.notebook.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acoreful.notebook.commons.base.BaseController;
import com.acoreful.notebook.commons.result.MsgResult;
import com.acoreful.notebook.commons.util.Common;
import com.acoreful.notebook.entity.UserLoginFormMap;
import com.acoreful.notebook.mapper.UserLoginMapper;

@Controller
@RequestMapping("/")
public class LoginController extends BaseController{

	@Inject
	private UserLoginMapper userLoginMapper;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public MsgResult login(String username, String password, HttpServletRequest request) throws Exception {
		try {
			if (!request.getMethod().equals("POST")) {
				return MsgResult.failure(null, "支持POST方法提交！");
			}
			if (Common.isEmpty(username) || Common.isEmpty(password)) {
				return MsgResult.failure(null, "用户名或密码不能为空！");
			}
			// 想要得到 SecurityUtils.getSubject() 的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
			Subject user = SecurityUtils.getSubject();
			// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
			// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
			// 当以上认证成功后会向下执行,认证失败会抛出异常
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			try {
				user.login(token);
			} catch (LockedAccountException lae) {
				token.clear();
				return MsgResult.failure(null, "用户已经被锁定不能登录，请与管理员联系！");
			} catch (ExcessiveAttemptsException e) {
				token.clear();
				return MsgResult.failure(null, "账号：" + username + " 登录失败次数过多,锁定10分钟!");
			} catch (AuthenticationException e) {
				token.clear();
				return MsgResult.failure(null, "用户或密码不正确！");
			}
			UserLoginFormMap userLogin = new UserLoginFormMap();
			Session session = SecurityUtils.getSubject().getSession();
			userLogin.put("userId", session.getAttribute("userSessionId"));
			userLogin.put("accountName", username);
			userLogin.put("loginIP", session.getHost());
			userLoginMapper.addEntity(userLogin);
			request.removeAttribute("error");
		} catch (Exception e) {
			e.printStackTrace();
			return MsgResult.failure(null, "登录异常，请联系管理员！");
		}
		return MsgResult.success();
	}
	@Deprecated
	@RequestMapping(value = "login1", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String login(String username, String password, HttpServletRequest request,Model model) {
		try {
			if (!request.getMethod().equals("POST")) {
				request.setAttribute("error", "支持POST方法提交！");
			}
			if (Common.isEmpty(username) || Common.isEmpty(password)) {
				request.setAttribute("error", "用户名或密码不能为空！");
				return "/login";
			}
			// 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
			Subject user = SecurityUtils.getSubject();
			// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
			// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
			// 当以上认证成功后会向下执行,认证失败会抛出异常
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			try {
				user.login(token);
			} catch (LockedAccountException lae) {
				token.clear();
				request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
				return "/login";
			} catch (ExcessiveAttemptsException e) {
				token.clear();
				request.setAttribute("error", "账号：" + username + " 登录失败次数过多,锁定10分钟!");
				return "/login";
			} catch (AuthenticationException e) {
				token.clear();
				request.setAttribute("error", "用户或密码不正确！");
				return "/login";
			}
			UserLoginFormMap userLogin = new UserLoginFormMap();
			Session session = SecurityUtils.getSubject().getSession();
			userLogin.put("userId", session.getAttribute("userSessionId"));
			userLogin.put("accountName", username);
			userLogin.put("loginIP", session.getHost());
			userLoginMapper.addEntity(userLogin);
			request.removeAttribute("error");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "登录异常，请联系管理员！");
			return "/login";
		}
		return "redirect:index";
	}
}
