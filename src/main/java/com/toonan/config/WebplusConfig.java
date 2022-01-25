package com.toonan.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.toonan.core.minio.WebplusMinio;
import com.toonan.core.ocr.BaiduOcr;

/**
 * 
 * @ClassName:  WeedfsConfig   
 * @Description:weedfs配置
 * @author: 陈骑元（chenqiyuan@toonan.com)
 * @date:   2020年5月8日 上午10:35:06     
 * @Copyright: 2020 www.toonan.com Inc. All rights reserved. 
 * 注意：本内容仅限于广州市图南软件有限公司内部传阅，禁止外泄以及用于其他的商业目
 */

@Configuration
public class WebplusConfig  {

	
	
	@Value("${minio.endpoint}")
	public void setEndpoint(String endpoint) {
		WebplusMinio.ENDPOINT = endpoint;
	}
	
	@Value("${minio.accessKey}")
	public void setAccessKey(String accessKey) {
		WebplusMinio.ACCESS_KEY=accessKey;
	}
	
	@Value("${minio.secretKey}")
	public void setSecretKey(String secretKey) {
		WebplusMinio.SECRET_KEY=secretKey;
	}
	
 
	
	
}
