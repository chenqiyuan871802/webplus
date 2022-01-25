package com.toonan.core.util;

import java.util.UUID;


/**
 * 
 * @ClassName:  WebplusId   
 * @Description:webplusId生成器
 * @author: 陈骑元（chenqiyuan@toonan.com)
 * @date:   2022年1月25日 下午11:03:45     
 * @Copyright: 2022 www.toonan.com Inc. All rights reserved. 
 * 注意：本内容仅限于广州市图南软件有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class WebplusId {

    /**
     * 主机和进程的机器码
     */
    private static final WebplusSequence worker = new WebplusSequence();

    public static long getId() {
        return worker.nextId();
    }

    public static String getIdStr() {
        return String.valueOf(worker.nextId());
    }

    /**
     * <p>
     * 获取去掉"-" UUID
     * </p>
     */
    public static synchronized String uuid() {
        return uuid2().replace("-", "");
    }
    
    /**
     * <p>
     * 获取去掉"-" UUID
     * </p>
     */
    public static synchronized String uuid2() {
        return UUID.randomUUID().toString();
    }
}  

