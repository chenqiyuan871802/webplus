package com.toonan.core.token;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.toonan.core.cache.WebplusCache;
import com.toonan.core.constant.WebplusCons;
import com.toonan.core.util.WebplusId;
import com.toonan.core.util.WebplusJson;
import com.toonan.core.util.WebplusServlet;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.UserToken;

import eu.bitwalker.useragentutils.UserAgent;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;



/**
 * 
 * @ClassName:  WebplusToken   
 * @Description:token管理工具类
 * @author: 陈骑元（chenqiyuan@toonan.com)
 * @date:   2021年8月3日 下午10:31:55     
 * @Copyright: 2021 www.toonan.com Inc. All rights reserved. 
 * 注意：本内容仅限于广州市图南软件有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class WebplusToken {
	
	/**
	 *  令牌自定义标识
	 */
	public static String HEADER="Authorization";
	/**
	 *  令牌自定义标识
	 */
	public static String SECRET="toonanewebplus";
	/**
	 * 令牌有效期（默认30分钟）
	 */
	public static int EXPIRE_TIME=30;
	/**
	 * 低于二十分钟自动刷新
	 */
    private static final int MINUTE_TEN = 15;
    /**
     * 
     * 简要说明：获取用户token信息
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月4日 下午10:02:12 
     * @param 说明
     * @return 说明
     */
    public static UserToken getUserToken(HttpServletRequest request)
    {
        // 获取请求携带的令牌
        String token = getToken(request);
        if (WebplusUtil.isNotEmpty(token))
        {
            UserToken  user =getUserToken(token); 
            return user;
        }
        return null;
    }
    /**
     * 
     * 简要说明：获取缓存token信息
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月5日 下午3:42:52 
     * @param 说明
     * @return 说明
     */
    public static UserToken getUserToken(String token) {
    	Claims claims = parseToken(token);
        // 解析对应的权限以及用户信息
        String uuid = (String) claims.get(WebplusCons.LOGIN_USER_KEY);
        String userKey = getTokenKey(uuid);
    	UserToken userToken = null;
    	String userJson=WebplusCache.getString(userKey);
    	if (WebplusUtil.isNotEmpty(userJson)) {
			userToken = WebplusJson.fromJson(userJson, UserToken.class);

		}
    	return userToken;
    }
    /**
     * 
     * 简要说明：设置用户身份信息
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月4日 下午10:06:54 
     * @param 说明
     * @return 说明
     */
    public static void setUserTokenCache(UserToken userToken)
    {
        if (WebplusUtil.isNotEmpty(userToken) && WebplusUtil.isNotEmpty(userToken.getToken()))
        {
            String userKey = getTokenKey(userToken.getToken());
            WebplusCache.setString(userKey, WebplusJson.toJson(userToken), EXPIRE_TIME*60);
        }
    }
    /**
     * 
     * 简要说明：删除用户身份
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月4日 下午10:11:00 
     * @param 说明
     * @return 说明
     */
    public static void removeUserToken(HttpServletRequest request)
    {
    	String token = getToken(request);
        if (WebplusUtil.isNotEmpty(token))
        {
        	Claims claims = parseToken(token);
            // 解析对应的权限以及用户信息
            String uuid = (String) claims.get(WebplusCons.LOGIN_USER_KEY);
            if(WebplusUtil.isNotEmpty(uuid)) {
            	String userKey = getTokenKey(uuid);
                WebplusCache.delString(userKey);
            }
        	
        }
    }
    
    
    /**
     * 创建令牌
     * 
     * @param userToken 用户信息
     * @return 令牌
     */
    public static String createToken(UserToken userToken)
    {
        String token = WebplusId.uuid();
        userToken.setToken(token);
        setUserAgent(userToken);
        refreshToken(userToken);
        Map<String, Object> claims = new HashMap<>();
        claims.put(WebplusCons.USER_ID_KEY, userToken.getUserId());
        claims.put(WebplusCons.LOGIN_USER_KEY, token);
        return createToken(claims);
    }
    
    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     * 
     * @param token 令牌
     * @return 令牌
     */
	public static boolean verifyToken(String token) {
		UserToken userToken=getUserToken(token);
		if (WebplusUtil.isNotEmpty(userToken)) {
			Date now = WebplusUtil.getDateTime();
			int plusMinute = WebplusUtil.minutesBetween(userToken.getRefreshTime(), now);
			if (plusMinute >= MINUTE_TEN) { // 当前时间大于刷新时间20分钟就失效
				refreshToken(userToken);
			}

			return true;
		}

		return false;

	}

    /**
     * 
     * 简要说明：刷新令牌有效期
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月5日 下午3:24:24 
     * @param 说明
     * @return 说明
     */
    public static void refreshToken(UserToken userToken)
    {   
    	userToken.setRefreshTime(WebplusUtil.getDateTime());
    	setUserTokenCache(userToken);
    }
    /**
     * 
     * 简要说明：设置用户代理信息
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月3日 下午11:29:11 
     * @param 说明
     * @return 说明
     */
    public static void setUserAgent(UserToken userToken)
    {
        UserAgent userAgent = UserAgent.parseUserAgentString(WebplusServlet.getRequest().getHeader("User-Agent"));
        String ip = WebplusUtil.getIpAddr(WebplusServlet.getRequest());
        userToken.setIpaddr(ip);
        userToken.setLoginLocation(WebplusUtil.getRealAddressByIP(ip));
        userToken.setBrowser(userAgent.getBrowser().getName());
        userToken.setOs(userAgent.getOperatingSystem().getName());
    }
	
	 /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private static  String createToken(Map<String, Object> claims)
    {
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, SECRET).compact();
        return token;
    }
	/**
	 * 
	 * 简要说明：从令牌中获取数据声明
	 * 编写者：陈骑元（chenqiyuan@toonan.com）
	 * 创建时间： 2021年8月3日 下午10:53:49 
	 * @param 说明  token 令牌
	 * @return 说明
	 */
    private static Claims parseToken(String token)
    {
        return Jwts.parser()
                .setSigningKey(SECRET)
                .parseClaimsJws(token)
                .getBody();
    }
    /**
     * 
     * 简要说明：从令牌中获取用户名
     * 编写者：陈骑元（chenqiyuan@toonan.com）
     * 创建时间： 2021年8月3日 下午11:00:37 
     * @param 说明
     * @return 说明
     */
    public static String getUserIdFromToken(String token)
    {
    	
        Claims claims = parseToken(token);
        return (String)claims.get(WebplusCons.USER_ID_KEY);
    }
	/**
	 * 
	 * 简要说明：获得请求令牌
	 * 编写者：陈骑元（chenqiyuan@toonan.com）
	 * 创建时间： 2021年8月3日 下午10:48:51 
	 * @param 说明
	 * @return 说明
	 */
	public static String getToken(HttpServletRequest request) {
		String token = request.getHeader(HEADER);
		if (WebplusUtil.isNotEmpty(token) && token.startsWith(WebplusCons.TOKEN_PREFIX)) {
			token = token.replace(WebplusCons.TOKEN_PREFIX, "");
		}
		return token;
	}
	/**
	 * 
	 * 简要说明：获取token缓存健
	 * 编写者：陈骑元（chenqiyuan@toonan.com）
	 * 创建时间： 2021年8月3日 下午10:52:38 
	 * @param 说明
	 * @return 说明
	 */
	private static  String getTokenKey(String uuid) {
		
		return WebplusCons.CACHE_PREFIX.TOKEN + uuid;
	}
}
