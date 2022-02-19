package com.toonan.system.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.cache.WebplusCache;
import com.toonan.core.matatype.Dto;
import com.toonan.core.matatype.Dtos;
import com.toonan.core.util.WebplusId;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.R;
import com.toonan.core.web.BaseController;
import com.toonan.system.model.AppConfig;
import com.toonan.system.service.AppConfigService;

import cn.hutool.core.util.RandomUtil;

/**
 * <p>
 * 应用配置 前端控制器
 * </p>
 *
 * @author 陈骑元
 * @since 2022-02-04
 */
@Controller
@RequestMapping("/system/appConfig")
public class AppConfigController extends BaseController {

    @Autowired
    private AppConfigService appConfigService;


	/**
	 * 
	 * 简要说明：分页查询 
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping("list")
	@ResponseBody
	public R list() {
		Dto pDto = Dtos.newDto(request);
		Page<AppConfig> page =appConfigService.likePage(pDto);
		WebplusCache.convertItem(page);
		return R.toPage(page);
	}



	/**
	 * 
	 * 简要说明： 新增信息保存 
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("save")
	@ResponseBody
	public R save(AppConfig appConfig) {
		String userId=this.getUserId();
		Date now=WebplusUtil.getDateTime();
		appConfig.setAccessKey(WebplusId.uuid());
		appConfig.setSecretKey(RandomUtil.randomString(8));
		
		appConfig.setCreateBy(userId);
		appConfig.setCreateTime(now);
		appConfig.setUpdateBy(userId);
		appConfig.setUpdateTime(now);
		boolean result = appConfigService.insert(appConfig);
		if (result) {
			return R.ok();
		} else {
			return R.error("保存失败");
		}

	}
	

	/**
	 * 
	 * 简要说明： 重置账号和秘钥
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("resetAccount")
	@ResponseBody
	public R resetAccount(String configId) {
		AppConfig appConfig=new AppConfig();
		appConfig.setConfigId(configId);
		String userId=this.getUserId();
		Date now=WebplusUtil.getDateTime();
		appConfig.setAccessKey(WebplusId.uuid());
		appConfig.setSecretKey(RandomUtil.randomString(8));
		appConfig.setUpdateBy(userId);
		appConfig.setUpdateTime(now);
		boolean result = appConfigService.updateById(appConfig);
		if (result) {
			return R.ok();
		} else {
			return R.error();
		}

	}
	/**
	 * 
	 * 简要说明： 跳转到编辑页面 
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("edit")
	@ResponseBody
	public R edit(String id) {
		AppConfig appConfig=appConfigService.selectById(id);
		return R.toData(appConfig);
	}
	
	/**
	 * 
	 * 简要说明：修改信息
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("update")
	@ResponseBody
	public R update(AppConfig appConfig) {
		appConfig.setUpdateBy(this.getUserId());
		appConfig.setUpdateTime(WebplusUtil.getDateTime());
		boolean result = appConfigService.updateById(appConfig);
		if (result) {
			return R.ok();
		} else {
			return R.error("更新失败");
		}
		
	}
	
	
	/**
	 * 
	 * 简要说明：删除信息
	 * 编写者：陈骑元
	 * 创建时间：2022-02-04
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("remove")
	@ResponseBody
	public R remove(String id) {
		boolean result = appConfigService.deleteById(id);
		if (result) {
			return R.ok();
		} else {
			return R.error("删除失败");
		}
		
	}
	
	
	
}

