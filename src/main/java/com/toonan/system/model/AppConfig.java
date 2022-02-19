package com.toonan.system.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.toonan.core.annotation.ItemTag;
import com.toonan.core.matatype.impl.BaseModel;
import java.io.Serializable;

/**
 * <p>
 * 应用配置
 * </p>
 *
 * @author 陈骑元
 * @since 2022-02-04
 */
@TableName("sys_app_config")
public class AppConfig extends BaseModel<AppConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 配置编号
     */
    @TableId("config_id")
    private String configId;
    /**
     * 应用名称
     */
    @TableField("app_name")
    private String appName;
    /**
     * 访问账号
     */
    @TableField("access_key")
    private String accessKey;
    /**
     * 访问秘钥
     */
    @TableField("secret_key")
    private String secretKey;
    /**
     * 联系人
     */
    @TableField("link_man")
    private String linkMan;
    /**
     * 联系电话
     */
    private String phone;
    /**
     * 授权用户编号
     */
    @TableField("grant_user_id")
    private String grantUserId;
    /**
     * 备注
     */
    private String remark;
    /**
     * 当前状态(0:停用;1:启用)
     */
    @ItemTag(type="status")
    private String status;
    /**
     * 编辑模式(0:只读;1:可编辑)
     */
    @ItemTag(type="edit_mode")
    @TableField("edit_mode")
    private String editMode;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 创建用户
     */
    @TableField("create_by")
    private String createBy;
    /**
     * 修改时间
     */
    @TableField("update_time")
    private Date updateTime;
    /**
     * 修改用户
     */
    @TableField("update_by")
    private String updateBy;


    public String getConfigId() {
        return configId;
    }

    public void setConfigId(String configId) {
        this.configId = configId;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGrantUserId() {
        return grantUserId;
    }

    public void setGrantUserId(String grantUserId) {
        this.grantUserId = grantUserId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEditMode() {
        return editMode;
    }

    public void setEditMode(String editMode) {
        this.editMode = editMode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    protected Serializable pkVal() {
        return this.configId;
    }

    @Override
    public String toString() {
        return "AppConfig{" +
        "configId=" + configId +
        ", appName=" + appName +
        ", accessKey=" + accessKey +
        ", secretKey=" + secretKey +
        ", linkMan=" + linkMan +
        ", phone=" + phone +
        ", grantUserId=" + grantUserId +
        ", remark=" + remark +
        ", status=" + status +
        ", editMode=" + editMode +
        ", createTime=" + createTime +
        ", createBy=" + createBy +
        ", updateTime=" + updateTime +
        ", updateBy=" + updateBy +
        "}";
    }
}
