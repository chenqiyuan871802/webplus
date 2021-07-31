package com.toonan.system.controller;

import java.util.List;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.cache.WebplusCache;
import com.toonan.core.matatype.Dto;
import com.toonan.core.matatype.Dtos;
import com.toonan.core.util.WebplusFormater;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.R;
import com.toonan.core.web.BaseController;
import com.toonan.system.model.Log;
import com.toonan.system.service.LogService;

/**
 * <p>
 * 系统日志表 前端控制器
 * </p>
 *
 * @author 陈骑元
 * @since 2020-11-30
 */
@Api(value="系统日志")
@Controller
@RequestMapping("/system/log")
public class LogController extends BaseController {

    @Autowired
    private LogService logService;


	/**
	 * 
	 * 简要说明：分页查询 
	 * 编写者：陈骑元
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("分页查询日志信息")
	@RequestMapping("list")
	@ResponseBody
	public R list() {
		Dto pDto = Dtos.newDto(request);
		String operateDate=pDto.getString("operateDate");
		if(WebplusUtil.isNotEmpty(operateDate)){
			if(operateDate.length()>=10){
				String beginDate=operateDate.substring(0,10);
				pDto.put("beginDate", beginDate);
			}
			if(operateDate.length()>12){
				String endDate=operateDate.substring(13);
				endDate=WebplusUtil.plusDay(1, endDate);
				pDto.put("endDate", endDate);
			}
		}
		pDto.setOrder(" create_time DESC " );
		Page<Log> page =logService.likePage(pDto);
		WebplusCache.convertItem(page);
		return R.toPage(page);
	}



	/**
	 * 
	 * 简要说明： 新增信息保存 
	 * 编写者：陈骑元
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("新增信息保存")
	@PostMapping("save")
	@ResponseBody
	public R save(Log log) {
		boolean result = logService.insert(log);
		if (result) {
			return R.ok();
		} else {
			return R.error("保存失败");
		}

	}
	/**
	 * 
	 * 简要说明： 跳转到编辑页面 
	 * 编写者：陈骑元
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("跳转到编辑页面")
	@PostMapping("edit")
	@ResponseBody
	public R edit(String id) {
		Log log=logService.selectById(id);
		return R.toData(log);
	}
	
	/**
	 * 
	 * 简要说明：修改信息
	 * 编写者：陈骑元
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("修改信息")
	@PostMapping("update")
	@ResponseBody
	public R update(Log log) {
		boolean result = logService.updateById(log);
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
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("删除信息")
	@PostMapping("remove")
	@ResponseBody
	public R remove(String id) {
		boolean result = logService.deleteById(id);
		if (result) {
			return R.ok();
		} else {
			return R.error("删除失败");
		}
		
	}
	/**
	 * 
	 * 简要说明：删除信息
	 * 编写者：陈骑元
	 * 创建时间：2020-11-30
	 * @param 说明
	 * @return 说明
	 */
	@ApiOperation("删除信息batchRemove")
	@PostMapping("batchRemove")
	@ResponseBody
	public R batchRemove(String ids) {
		List<String > idList=WebplusFormater.separatStringToList(ids);
		boolean result = logService.deleteBatchIds(idList);
		if (result) {
			return R.ok();
		} else {
			return R.error("删除失败");
		}
		
	}
	
	
	/**
	 * 
	 * 简要说明：批量删除信息
	 * 编写者：陈骑元
	 * 创建时间：2018-12-31
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("clearLog")
	@ResponseBody
	public R clearLog() {
		Dto columnDto=Dtos.newDto();
		columnDto.put("1", 1);
		boolean result = logService.deleteByMap(columnDto);
		if (result) {
			return R.ok();
		} else {
			return R.error("清空失败");
		}
		
	}
	
}

