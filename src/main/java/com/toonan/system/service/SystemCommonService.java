package com.toonan.system.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.matatype.Dto;
import com.toonan.core.vo.Item;
import com.toonan.core.vo.Query;
import com.toonan.system.mapper.SystemCommonMapper;
import com.toonan.system.model.Menu;
import com.toonan.system.service.SystemCommonService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 类名:com.toonan.system.service.SystemCommonService
 * 描述:系统通用查询
 * 编写者:陈骑元
 * 创建时间:2018年12月17日 下午2:34:01
 * 修改说明:
 */
@Service
public class SystemCommonService   {
    
	@Autowired
	private SystemCommonMapper systemCommonMapper;
	
    /**
     * 
     * 简要说明：查询授权角色
     * 编写者：陈骑元
     * 创建时间：2019年1月7日 下午8:48:33
     * @param 说明
     * @return 说明
     */
	public List<Menu> listRoleMenu(Dto pDto){
		
		return systemCommonMapper.listRoleMenu(pDto);
	}
	
	 /**
	  * 
	  * 简要说明：查询角色授权编号
	  * 编写者：陈骑元
	  * 创建时间：2019年1月8日 上午10:43:49
	  * @param 说明
	  * @return 说明
	  */
    public List<String> listRoleMenuId(String czyid){
    	
    	return systemCommonMapper.listRoleMenuId(czyid);
    
    }
    
 
}
