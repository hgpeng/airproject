package com.hhwork.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.dao.BgUserDao;
import com.hhwork.model.BgUser;
import com.hhwork.service.BgUserService;
import com.hhwork.utils.LoginCookieUtil;

@Service("bgUserService")
public class BgUserServiceImpl implements BgUserService {

	@Resource
	protected BgUserDao bgUserDao;
	
	Md5PasswordEncoder encoder=new Md5PasswordEncoder();
	
	@Override
	public BgUser getBgUserByUserName(String name) {
		return bgUserDao.getBgUserByUserName(name);
	}

	@Override
	public int saveBgUser(BgUser user) {
		/**
		 * 生成秘钥
		 */
		String salt = RandomStringUtils.randomAlphanumeric(6);
		user.setSalt(salt);
		user.setPassword(encoder.encodePassword(user.getPassword()
				.trim(), salt));
		System.out.println(salt);
		System.out.println(user.getPassword());
//		return bgUserDao.saveBgUser(user);
		return 1;
	}

	@Override
	public int deleteBgUserById(int id) {
		return bgUserDao.deleteBgUserById(id);
	}
	
	public static void main(String[] args) {
		BgUserService service=new BgUserServiceImpl();
		BgUser user=new BgUser();
		user.setPassword("123456");
		service.saveBgUser(user);
	}

	@Override
	public int login(BgUser user,HttpServletResponse response) {
		if(user==null || StringUtils.isBlank(user.getUserName()) || StringUtils.isBlank(user.getPassword())){
			return Constants.Status.FAIL;
		}
		BgUser dbQueryUser=bgUserDao.getBgUserByUserName(user.getUserName());
		if(dbQueryUser==null){
			return Constants.Status.NOT_EXISTS;
		}
		String salt=dbQueryUser.getSalt();
		String inputPass=user.getPassword();
		inputPass=encoder.encodePassword(inputPass, salt);
		/**
		 * 密码正确，返回登录成功
		 */
		if(dbQueryUser.getPassword().equals(inputPass)){
			//设置昵称跟创建时间
			user.setNickName(dbQueryUser.getNickName());
			user.setCreateTime(dbQueryUser.getCreateTime());
			LoginCookieUtil.setLoginCookie(response, user, true);
			return Constants.Status.SUCCESS;
		}
		return Constants.Status.FAIL;
	}
	
	

}
