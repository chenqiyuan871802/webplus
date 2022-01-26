package com.toonan.core.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toonan.core.cache.WebplusCache;
import com.toonan.core.constant.WebplusCons;
import com.toonan.core.minio.WebplusMinio;
import com.toonan.core.util.WebplusFile;
import com.toonan.core.util.WebplusUtil;

/**
 * 
 * @ClassName:  WebplusCommon   
 * @Description:通用处理
 * @author: 陈骑元（chenqiyuan@toonan.com)
 * @date:   2022年1月26日 下午9:48:17     
 * @Copyright: 2022 www.toonan.com Inc. All rights reserved. 
 * 注意：本内容仅限于广州市图南软件有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class WebplusCommon {
	/**
	 * 
	 * 简要说明：获取保存的跟路径
	 * 编写者：陈骑元（chenqiyuan@toonan.com）
	 * 创建时间： 2022年1月26日 下午9:56:37 
	 * @param 说明
	 * @return 说明
	 */
	public static String getRootPath() {
		String saveRootPath = "";
		if (WebplusUtil.isWindows()) {
			saveRootPath = WebplusCache.getParamValue(WebplusCons.WINDOWS_SAVE_ROOT_PATH_KEY,
					WebplusCons.WINDOWS_ROOT_PATH);
		} else {
			saveRootPath = WebplusCache.getParamValue(WebplusCons.LINUX_SAVE_ROOT_PATH_KEY,
					WebplusCons.LINUX_ROOT_PATH);
		}
		File file = new File(saveRootPath);
		if (!file.exists()) { // 文件夹不存在，则创建
			WebplusFile.createFolder(saveRootPath);
		}
		return saveRootPath;
	}
	
	/***
	 * 
	 * 简要说明：下载文件通用处理
	 * 编写者：陈骑元（chenqiyuan@toonan.com）
	 * 创建时间： 2022年1月26日 下午10:09:29 
	 * @param 说明  文件的fid,fileName下载的文件名
	 * @return 说明
	 */
	public static void downloadFile(String fid,String fileName,HttpServletRequest request,HttpServletResponse response) {
		if(WebplusUtil.isNotEmpty(fid)) {
			String saveFileWay = WebplusCache.getParamValue(WebplusCons.SAVE_FILE_WAY_KEY);
			int len=fid.indexOf("_");
		    //存储的业务桶和文件层
			String bussBucket="";
            if(len>-1) {
            	bussBucket=fid.substring(0,len);
            	fid=fid.substring(len+1);
            }else {
            	bussBucket=WebplusCons.DEFAULT_BUCKET;
            }
			if (WebplusCons.SAVE_FILE_WAY_LOCAL.equals(saveFileWay)) {  //文件存储的方式
				String folderPath = WebplusCommon.getRootPath();
				String filePath = folderPath + File.separator +bussBucket + File.separator + fid;
				File file = new File(filePath);
				if (file.exists()) { //文件存在则进行下载
					if(WebplusUtil.isEmpty(fileName)) {
						fileName=fid;
					}
					WebplusFile.downloadFile(request, response, filePath, fileName);
				}
			}else {
				WebplusMinio.downloadFile(bussBucket,fid, response);
			}
		}
	}

}
