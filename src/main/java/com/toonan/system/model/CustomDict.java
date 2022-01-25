package com.toonan.system.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.toonan.core.matatype.impl.BaseModel;
import java.io.Serializable;

/**
 * <p>
 * 自定义字典
 * </p>
 *
 * @author 陈骑元
 * @since 2022-01-25
 */
@TableName("sys_custom_dict")
public class CustomDict extends BaseModel<CustomDict> {

    private static final long serialVersionUID = 1L;

    /**
     * 字典编号
     */
    @TableId("dict_id")
    private String dictId;
    /**
     * 字典健
     */
    @TableField("dict_key")
    private String dictKey;
    /**
     * 字典名称
     */
    @TableField("dict_name")
    private String dictName;
    /**
     * 字典表
     */
    @TableField("dict_table")
    private String dictTable;
    /**
     * 字典条件
     */
    @TableField("dict_where")
    private String dictWhere;
    /**
     * 字典排序字典
     */
    @TableField("dict_sort_field")
    private String dictSortField;
    /**
     * 排序类型 1升序2降序
     */
    @TableField("sort_type")
    private String sortType;
    /**
     * 字典代码字典
     */
    @TableField("dict_code_field")
    private String dictCodeField;
    /**
     * 字典值字字段
     */
    @TableField("dict_value_field")
    private String dictValueField;
    /**
     * 备注
     */
    private String remark;
    /**
     * 当前状态(0:停用;1:启用)
     */
    private String status;
    /**
     * 编辑模式(0:只读;1:可编辑)
     */
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


    public String getDictId() {
        return dictId;
    }

    public void setDictId(String dictId) {
        this.dictId = dictId;
    }

    public String getDictKey() {
        return dictKey;
    }

    public void setDictKey(String dictKey) {
        this.dictKey = dictKey;
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName;
    }

    public String getDictTable() {
        return dictTable;
    }

    public void setDictTable(String dictTable) {
        this.dictTable = dictTable;
    }

    public String getDictWhere() {
        return dictWhere;
    }

    public void setDictWhere(String dictWhere) {
        this.dictWhere = dictWhere;
    }

    public String getDictSortField() {
        return dictSortField;
    }

    public void setDictSortField(String dictSortField) {
        this.dictSortField = dictSortField;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

    public String getDictCodeField() {
        return dictCodeField;
    }

    public void setDictCodeField(String dictCodeField) {
        this.dictCodeField = dictCodeField;
    }

    public String getDictValueField() {
        return dictValueField;
    }

    public void setDictValueField(String dictValueField) {
        this.dictValueField = dictValueField;
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
        return this.dictId;
    }

    @Override
    public String toString() {
        return "CustomDict{" +
        "dictId=" + dictId +
        ", dictKey=" + dictKey +
        ", dictName=" + dictName +
        ", dictTable=" + dictTable +
        ", dictWhere=" + dictWhere +
        ", dictSortField=" + dictSortField +
        ", sortType=" + sortType +
        ", dictCodeField=" + dictCodeField +
        ", dictValueField=" + dictValueField +
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
