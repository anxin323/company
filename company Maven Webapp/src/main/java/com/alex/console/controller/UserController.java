package com.alex.console.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alex.base.controller.BaseController;
import com.alex.base.vo.BaseResultVo;
import com.alex.console.model.User;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiParam;

@Controller
@RequestMapping(value = "restapi/user/")
public class UserController extends BaseController{
	@Autowired
//	private IUserService userService;
	
	private static final Log LOGGER = LogFactory.getLog(UserController.class);

	@RequestMapping(value = "addUser", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ApiOperation(value = "新增用户信息", httpMethod = "GET", notes = "填写完整的用户信息", response = BaseResultVo.class)
	public @ResponseBody String addUser( @ApiParam(required = true) @ModelAttribute User user) {
		user.setRigisterTime(System.currentTimeMillis());
		return buildSuccessResultInfo(user);
//		if (userService.saveUser(user)){
//			return buildSuccessResultInfo(user);
//		}else{
//			return buildFailedResultInfo(200, "用户名已存在");
//		}
	}

	@RequestMapping(value = "getUser",  method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ApiOperation(value = "获取用户信息", httpMethod = "GET", notes = "获取用户信息", response = BaseResultVo.class)
	public @ResponseBody String getUser() {
//		List<User> userList= userService.getUsers();
		return buildSuccessResultInfo("");
	}
	
	@RequestMapping(value = "verifyUser", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ApiOperation(value = "验证用户信息", httpMethod = "POST", notes = "请输入用户名和密码", response = BaseResultVo.class)
	public @ResponseBody String verifyUser(@ApiParam(required = true) @RequestParam String userName,@ApiParam(required = true) @RequestParam String password) {
		User user = new User();
		user.setUsername(userName);
		user.setPassword(password);
//		if (userService.verifyUser(user)){
//			return buildSuccessResultInfo(user);
//		}else{
//			return buildFailedResultInfo(200, "用户名或密码不正确");
//		}
		return buildSuccessResultInfo(user);
	}
}
