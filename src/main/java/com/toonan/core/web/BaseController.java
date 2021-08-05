package com.toonan.core.web;


import org.springframework.beans.factory.annotation.Autowired;

import com.toonan.core.cache.WebplusCache;
import com.toonan.core.constant.WebplusCons;
import com.toonan.core.matatype.Dto;
import com.toonan.core.token.WebplusToken;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.UserToken;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 类名:com.ims.common.web.BaseController
 * 描述:基础控制类
 * 编写者:陈骑元
 * 创建时间:2018年4月6日 下午11:15:54
 * 修改说明:
 */
public class BaseController {
    @Autowired
    protected  HttpServletRequest request;
    @Autowired
    protected HttpServletResponse response;
    
    protected org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());
   
    /**
     * 
     * 简要说明：获取token用户
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:46:39
     * @param 说明
     * @return 说明
     */
    public  UserToken getUserToken(){
    	
    	return WebplusToken.getUserToken(request);
    }
  
    /**
     * 
     * 简要说明：获取token用户编号
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:51:26
     * @param 说明
     * @return 说明
     */
    public String getUserId(){
        String token=WebplusToken.getToken(request);
    	return WebplusToken.getUserIdFromToken(token);
    }
    
   
  
   


}
