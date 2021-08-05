package com.toonan.system.aspect;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.toonan.core.annotation.LogTag;
import com.toonan.core.cache.WebplusCache;
import com.toonan.core.matatype.Dto;
import com.toonan.core.token.WebplusToken;
import com.toonan.core.util.WebplusJson;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.UserToken;
import com.toonan.system.constant.SystemCons;
import com.toonan.system.mapper.LogMapper;
import com.toonan.system.model.Log;
/**
 * 
 * 类名:com.toonan.common.aspect.LogAspect
 * 描述:日志拦截器
 * 编写者:陈骑元
 * 创建时间:2018年12月31日 下午9:41:45
 * 修改说明:
 */

@Aspect
@Component
public class LogAspect {
	@Autowired
	private LogMapper logMapper;

	@Pointcut("@annotation(com.toonan.core.annotation.LogTag)")
	public void logPointCut() {
	}

	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		long beginTime = System.currentTimeMillis();
		// 执行方法
		Object result = point.proceed();
		// 执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;
		// 保存日志
		String log_switch=WebplusCache.getParamValue(SystemCons.LOG_SWITCH_KEY, SystemCons.SWITCH_ON);
		if(SystemCons.SWITCH_ON.equals(log_switch)){
			saveLog(point, time);
		}
		
		return result;
	}
    /**
     * 
     * 简要说明：保存日志信息
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2020年11月30日 下午7:08:56 
     * @param 说明
     * @return 说明
     */
	private void saveLog(ProceedingJoinPoint joinPoint, long time) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		Log sysLog=new Log();
		LogTag logTag = method.getAnnotation(LogTag.class);
		if (WebplusUtil.isNotEmpty(logTag)) {
			// 注解上的描述
			sysLog.setContent(logTag.value());
			sysLog.setLogType(logTag.type());
		}
		// 请求的方法名
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");
		sysLog.setUserId("-1L");
		sysLog.setUserName("获取用户信息为空");
		// 获取request
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	    if(WebplusUtil.isNotEmpty(request)){
	    	sysLog.setIp(WebplusUtil.getClientIpAddr(request));
	    	Dto pDto=WebplusUtil.getParamAsDto(request);
	    	String params=WebplusJson.toJson(pDto);
	    	if(WebplusUtil.isNotEmpty(params)&&params.length()>2000) {
	    		params=params.substring(0,2000);
	    	}
	    	sysLog.setParams(params);
	    	sysLog.setMethod(request.getRequestURI());
	    	UserToken userToken =WebplusToken.getUserToken(request);
	    	if(WebplusUtil.isNotEmpty(userToken)){
	    		
	    		if(WebplusUtil.isNotEmpty(userToken)){
	    			sysLog.setUserId(userToken.getUserId());
	    			sysLog.setUserName(userToken.getUsername());
	    		}
	    	}
	    	
	    	
	    }
		sysLog.setResponseTime((int) time);
		// 系统当前时间
		sysLog.setCreateTime(WebplusUtil.getDateTime());
		logMapper.insert(sysLog);
	}
}
