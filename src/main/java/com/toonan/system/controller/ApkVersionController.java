package com.toonan.system.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.cache.WebplusCache;
import com.toonan.core.common.WebplusCommon;
import com.toonan.core.constant.WebplusCons;
import com.toonan.core.matatype.Dto;
import com.toonan.core.matatype.Dtos;
import com.toonan.core.minio.WebplusMinio;
import com.toonan.core.util.WebplusFile;
import com.toonan.core.util.WebplusId;
import com.toonan.core.util.WebplusQrcode;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.R;
import com.toonan.core.web.BaseController;
import com.toonan.system.model.ApkVersion;
import com.toonan.system.service.ApkVersionService;

/**
 * <p>
 * APK版本管理 前端控制器
 * </p>
 *
 * @author 陈骑元
 * @since 2019-10-14
 */
@Controller
@RequestMapping("/system/apkVersion")
public class ApkVersionController extends BaseController {

    @Autowired
    private ApkVersionService apkVersionService;


	/**
	 * 
	 * 简要说明：分页查询 
	 * 编写者：陈骑元
	 * 创建时间：2019-10-14
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping("list")
	@ResponseBody
	public R list() {
		Dto pDto = Dtos.newDto(request);
		pDto.setOrder(" version_num DESC ");
		Page<ApkVersion> page =apkVersionService.likePage(pDto);
		WebplusCache.convertItem(page);
		return R.toPage(page);
	}



	/**
	 * 
	 * 简要说明： 新增信息保存 
	 * 编写者：陈骑元
	 * 创建时间：2019-10-14
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("save")
	@ResponseBody
	public R save(ApkVersion apkVersion) {
		String userId=this.getUserId();
		apkVersion.setCreateBy(userId);
		apkVersion.setCreateTime(WebplusUtil.getDateTime());
		apkVersion.setUpdateBy(userId);
		apkVersion.setUpdateTime(WebplusUtil.getDateTime());
		boolean result = apkVersionService.insert(apkVersion);
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
	 * 创建时间：2019-10-14
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("edit")
	@ResponseBody
	public R edit(String id) {
		ApkVersion apkVersion=apkVersionService.selectById(id);
		return R.toData(apkVersion);
	}
	
	/**
	 * 
	 * 简要说明：修改信息
	 * 编写者：陈骑元
	 * 创建时间：2019-10-14
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("update")
	@ResponseBody
	public R update(ApkVersion apkVersion) {
		String userId=this.getUserId();
		apkVersion.setUpdateBy(userId);
		apkVersion.setUpdateTime(WebplusUtil.getDateTime());
		boolean result = apkVersionService.updateById(apkVersion);
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
	 * 创建时间：2019-10-14
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("remove")
	@ResponseBody
	public R remove(String id) {
		ApkVersion apkVersion=apkVersionService.selectById(id);
		boolean result = apkVersionService.deleteById(id);
		if (result) {
			String rootPath=WebplusCache.getParamValue(WebplusCons.WINDOWS_SAVE_ROOT_PATH_KEY);
			String filePath=rootPath+File.separator+WebplusCons.APK_PATH+File.separator+apkVersion.getFid();
			WebplusFile.deleteFile(filePath);
			return R.ok();
		} else {
			return R.error("删除失败");
		}
		
	}
	
	/**
	 * 
	 * 简要说明： 新增信息保存 
	 * 编写者：陈骑元
	 * 创建时间：2019-02-23
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("uploadApk")
	@ResponseBody
	public R uploadApk(@RequestParam(value = "file", required = false) MultipartFile file,String filePrefix,
			HttpServletRequest request,HttpServletResponse response) {
		if(WebplusUtil.isNotEmpty(file)&&file.getSize()>0){
			
			try {
				String rootPath=WebplusCommon.getRootPath();
				String folderPath=rootPath+File.separator+WebplusCons.APK_PATH;
				String apkName=file.getOriginalFilename();
				String apkFileName=WebplusId.uuid()+"."+WebplusFile.getFileType(apkName);
				WebplusFile.createFolder(folderPath); 
				File targetFile = new File(folderPath,apkFileName); 
				file.transferTo(targetFile);
				return R.ok().put("apkName", apkName).put("fid",apkFileName);
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			return R.error();
			 
		}
       
		return R.error();
	}
	
	/***
	 * 
	 * 简要说明：展示订单二维码
	 * 编写者：陈骑元
	 * 创建时间：2019年10月19日 下午7:30:48
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("showDownloadQrcode")
	@ResponseBody
	public R showDownloadQrcode(String id){
		ApkVersion apkVersion = apkVersionService.selectById(id);
		if (WebplusUtil.isNotEmpty( apkVersion)) {
			String saveFileWay = WebplusCache.getParamValue(WebplusCons.SAVE_FILE_WAY_KEY);
			
			String qrcodeImage=WebplusCons.QRCODE_PATH+"_"+apkVersion.getVersionId()+".png";
			String rootPath=WebplusCommon.getRootPath();
			String qrcodeUrl = WebplusCache.getParamValue(WebplusCons.REQUEST_URL_KEY) + "/system/file/downloadApk?fid="
					+apkVersion.getFid();
			if (WebplusCons.SAVE_FILE_WAY_LOCAL.equals(saveFileWay)) {
				
				String destPath=rootPath+File.separator+WebplusCons.QRCODE_PATH;
				String filePath=destPath+File.separator+qrcodeImage;
				File file=new File(filePath);
				if(!file.exists()){
					 WebplusQrcode.createQrcodeImage(qrcodeUrl, destPath, qrcodeImage); //创建二维码
				}
			}else {
				String objectKey=WebplusCons.QRCODE_PATH+"/"+qrcodeImage;
				WebplusMinio.uploadQrcode( WebplusCons.DEFAULT_BUCKET,objectKey, qrcodeUrl);
			}
            Dto dataDto=Dtos.newDto("fileName",qrcodeImage);
            return R.toData(dataDto);
		}
		return R.error();
	}
	
}

