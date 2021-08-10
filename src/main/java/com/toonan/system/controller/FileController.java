package com.toonan.system.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.assertj.core.util.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.toonan.core.cache.WebplusCache;
import com.toonan.core.constant.WebplusCons;
import com.toonan.core.matatype.Dto;
import com.toonan.core.matatype.Dtos;
import com.toonan.core.minio.MinioClientUtil;
import com.toonan.core.util.WebplusFile;
import com.toonan.core.util.WebplusUtil;
import com.toonan.core.vo.R;
import com.toonan.core.web.BaseController;



/**
 * 
 * 类名:com.ims.business.controller.FileController
 * 描述:文件操作控制类
 * 编写者:陈骑元
 * 创建时间:2019年7月9日 上午8:20:26
 * 修改说明:
 */
@Controller
@RequestMapping("/system/file")
public class FileController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	/**
	 * 显示图片
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "showImage")
	public void showImage(String fid,String fileBucket,HttpServletRequest request,HttpServletResponse response) {
		
		if (WebplusUtil.isNotEmpty(fid)) {
			int len=fid.indexOf("_");
			String secondBucket="";
            if(len>-1) {
            	secondBucket=fid.substring(0,len);
            }
			String saveFileWay = WebplusCache.getParamValue(WebplusCons.SAVE_FILE_WAY_KEY);
			if (WebplusCons.SAVE_FILE_WAY_LOCAL.equals(saveFileWay)) {
				String folderPath = WebplusCache.getParamValue(WebplusCons.SAVE_ROOT_PATH_KEY);
				String filePath = folderPath + File.separator +secondBucket + File.separator + fid;
				File file = new File(filePath);
				if (file.exists()) {
					WebplusFile.downloadFile(request, response, filePath, fid);
				}

			} else {
				if (WebplusUtil.isEmpty(fileBucket)) {
					fileBucket = WebplusCons.DEFAULT_BUCKET;
				}
				String objectKey=fid;
				if(WebplusUtil.isNotEmpty(secondBucket)) {
					objectKey=secondBucket+"/"+fid;
				}
				MinioClientUtil.downloadFile(fileBucket, objectKey, response);
			}

		}
		
	}
	/**
	 * 
	 * 简要说明：下载文件
	 * 编写者：陈骑元
	 * 创建时间：2019年8月26日 下午5:55:50
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping(value = "downloadFile")
	public  void downloadFile(String fileName,HttpServletRequest request,HttpServletResponse response){
		if(WebplusUtil.isNotEmpty(fileName)){
			String folderPath=WebplusCache.getParamValue(WebplusCons.SAVE_ROOT_PATH_KEY	);
			String filePath=folderPath+File.separator+WebplusCons.FILE_PATH+File.separator+fileName;;
			
			WebplusFile.downloadFile(request, response,  filePath, fileName);
		}
	}
	/**
	 * 
	 * 简要说明：下载APK方法
	 * 编写者：陈骑元
	 * 创建时间：2019年10月25日 下午11:03:57
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping(value = "downloadApk")
	public void downloadApk(String fid,HttpServletRequest request,HttpServletResponse response) {
		
		if(WebplusUtil.isNotEmpty(fid)){
			String folderPath=WebplusCache.getParamValue(WebplusCons.SAVE_ROOT_PATH_KEY	);
			String filePath=folderPath+File.separator+WebplusCons.APK_PATH+File.separator+fid	;
			WebplusFile.downloadFile(request, response,  filePath, fid);
		}
		
	}
	/**
	 * 
	 * 简要说明：下载导入模板文件
	 * 编写者：陈骑元
	 * 创建时间：2019年8月26日 下午5:55:50
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping(value = "downloadTemplateFile")
	public  void downloadTemplateFile(String fileName,HttpServletRequest request,HttpServletResponse response){
		if(WebplusUtil.isNotEmpty(fileName)){
			String filePath="";
			try {
				filePath = ResourceUtils.getURL("classpath:static").getPath()+File.separator+"template"+File.separator+fileName;
				WebplusFile.downloadFile(request, response,  filePath, fileName);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
	}
	/**
	 * 
	 * 简要说明： 新增信息保存 22
	 * 编写者：陈骑元
	 * 创建时间：2019-02-23
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("uploadFile")
	@ResponseBody
	public R uploadFile(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request,HttpServletResponse response) {
		if (WebplusUtil.isNotEmpty(file) && file.getSize() > 0) {

			try {
				String saveFileWay = WebplusCache.getParamValue(WebplusCons.SAVE_FILE_WAY_KEY);
				String fileName = file.getOriginalFilename();
				String fileType = WebplusFile.getFileType(fileName);
				String secondFolder = "";
				if ("apk".equals(fileType)) {
					secondFolder = "apk";
				} else {
					secondFolder = WebplusUtil.getDateStr("YYYYMM");
				}
				String fid = secondFolder + "_" + WebplusUtil.uuid() + "." + fileType;
				String rootPath = WebplusFile.getRootPath();
				if (WebplusCons.SAVE_FILE_WAY_LOCAL.equals(saveFileWay)) {
					String folderPath = rootPath + File.separator + secondFolder;
					WebplusFile.createFolder(folderPath);
					File targetFile = new File(folderPath, fid);
					file.transferTo(targetFile);
				} else {
				    String  objectKey=secondFolder+"/"+fid;
                    MinioClientUtil.uploadFile(WebplusCons.DEFAULT_BUCKET, objectKey, file);
				}
				return R.ok().put("fileName", fileName).put("fid", fid);

			} catch (Exception e) {
                 logger.error("上传文件失败："+e);
			}
			return R.error("上传文件失败");

		}

		return R.error("无文件流上传");
	}
	/**
	 * 
	 * 简要说明： 多文件上传
	 * 编写者：陈骑元
	 * 创建时间：2019-02-23
	 * @param 说明
	 * @return 说明
	 */
	@PostMapping("uploadMoreImage")
	@ResponseBody
	public R uploadMoreImage(HttpServletRequest request,HttpServletResponse response) {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		
		try {
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				Iterator<String> fileForms = multipartRequest.getFileNames();
				String rootPath=WebplusCache.getParamValue(WebplusCons.SAVE_ROOT_PATH_KEY);
				String folderPath=rootPath+File.separator+WebplusCons.IMAGE_PATH;
				
				List<Dto> dataList=Lists.newArrayList();
				while (fileForms.hasNext()) {
					String fileForm = fileForms.next();// 文件提交表单域名称
					List<MultipartFile> files = multipartRequest.getFiles(fileForm);
					for (int i = 0; i < files.size(); i++) {
						MultipartFile file = files.get(i);
						if (file != null && file.getSize() > 0) { // 如果存在上传文件

							String imageName = file.getOriginalFilename();
							String imageFileName = WebplusUtil.createFileId()+ "." + WebplusFile.getFileType(imageName);
							WebplusFile.createFolder(folderPath);
							File targetFile = new File(folderPath, imageFileName);
							file.transferTo(targetFile);
							Dto dataDto=Dtos.newDto();
							dataDto.put("fileName", imageFileName);
							dataList.add(dataDto);
						}
					}
				}
				return R.toList(dataList);

			} 
		} catch (Exception e) {
			return R.error();
		}
		return R.error();
	}
	
	/**
	 * 
	 * 简要说明：下载excel文文件
	 * 编写者：陈骑元
	 * 创建时间：2019年8月26日 下午5:55:50
	 * @param 说明
	 * @return 说明
	 */
	@RequestMapping(value = "downloadExcelFile")
	public  void downloadExcelFile(String fid,String fileName,HttpServletRequest request,HttpServletResponse response){
		if(WebplusUtil.isNotEmpty(fid)){
			String folderPath=WebplusCache.getParamValue(WebplusCons.SAVE_ROOT_PATH_KEY	);
			String filePath=folderPath+File.separator+WebplusCons.EXCEL_PATH+File.separator+fid;;
			if(WebplusUtil.isEmpty(fileName)){
				fileName=fid;
			}
			WebplusFile.downloadFile(request, response,  filePath, fileName);
		}
	}
	
}
