package com.toonan.core.exception;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toonan.core.constant.WebplusCons;
import com.toonan.core.vo.R;



/**
 * 异常处理器
 * 
 */
@ControllerAdvice
@ResponseBody
public class WebplusExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 自定义异常
	 */
	@ExceptionHandler(WebplusException.class)
	public R handleBDException(WebplusException e) {
		R r = new R();
		r.put(WebplusCons.APPCODE_KEY, e.getAppcode());
		r.put(WebplusCons.APPCODE_KEY, e.getMessage());

		return r;
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public R handleDuplicateKeyException(DuplicateKeyException e) {
		logger.error(e.getMessage(), e);
		return R.error("数据库中已存在该记录");
	}

	@ExceptionHandler(org.springframework.web.servlet.NoHandlerFoundException.class)
	public R noHandlerFoundException(org.springframework.web.servlet.NoHandlerFoundException e) {
		logger.error(e.getMessage(), e);
		return R.error("没找找到页面");
	}
	
	@ExceptionHandler(AuthorizationException.class)
	public R handleAuthorizationException(AuthorizationException e) {
		logger.error(e.getMessage(), e);
		return R.error("未授权");
	}
	/**
	 * 
	 * 简要说明：token超时
	 * 编写者：陈骑元
	 * 创建时间：2019年5月12日 下午6:27:24
	 * @param 说明
	 * @return 说明
	 */
	@ExceptionHandler(AuthenticationException.class)
	public R handleAuthenticationException(AuthenticationException e) {
		logger.error(e.getMessage(), e);
		return R.error("未授权");
	}
	/**
	 * 
	 * 简要说明：未授权异常
	 * 编写者：陈骑元
	 * 创建时间：2019年5月12日 下午3:30:43
	 * @param 说明
	 * @return 说明
	 */
	@ExceptionHandler(UnauthorizedException.class)
	public R handleUnauthorizedException(UnauthorizedException e) {
		logger.error(e.getMessage(), e);
		return R.error("该用户未授权这个功能模块，请联系管理授权");
	}

	@ExceptionHandler(Exception.class)
	public R handleException(Exception e) {
		logger.error(e.getMessage(), e);
		return R.error("服务器错误，请联系管理员");
	}
}
