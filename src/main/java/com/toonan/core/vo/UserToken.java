package com.toonan.core.vo;

import java.util.Date;

/**
 * 
 * 类名:com.toonan.vo.UserToken
 * 描述:
 * 编写者:陈骑元
 * 创建时间:2019年4月25日 下午9:11:52
 * 修改说明:
 */
public class UserToken {
	/**
	 * 用户编号
	 */
	private String userId;
	/***
	 * 用户名称
	 */
	private String username;
	/**
	 * 用户账号
	 */
	private String account;
	
	/***
	 * 用户token
	 */
	private String token;
	/**
	 * 数据范围
	 */
	private String dataRange;
	
	/**
	 * token创建时间
	 */
	private Date  createTime;
	/**
	 * 刷新时间
	 */
	private Date refreshTime;
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getRefreshTime() {
		return refreshTime;
	}
	public void setRefreshTime(Date refreshTime) {
		this.refreshTime = refreshTime;
	}
	public String getDataRange() {
		return dataRange;
	}
	public void setDataRange(String dataRange) {
		this.dataRange = dataRange;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	

}
