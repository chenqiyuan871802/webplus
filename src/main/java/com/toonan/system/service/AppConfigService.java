package com.toonan.system.service;

import com.toonan.system.model.AppConfig;
import com.toonan.system.mapper.AppConfigMapper;
import com.toonan.system.service.AppConfigService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import com.toonan.core.matatype.Dto;
import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.vo.Query;

/**
 * <p>
 * 应用配置 服务实现类
 * </p>
 *
 * @author 陈骑元
 * @since 2022-02-04
 */
@Service
public class AppConfigService extends ServiceImpl<AppConfigMapper, AppConfig>  {
     
   
     /**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<AppConfig>
	 */
	public List<AppConfig> list(Dto pDto){
	    
	    return baseMapper.list(pDto);
	};
    /**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return Page<AppConfig>
	 */
	public Page<AppConfig> listPage(Dto pDto){
	    Query<AppConfig> query=new Query<AppConfig>(pDto);
	    query.setRecords(baseMapper.listPage(query,pDto));
	    return query;
	};
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<AppConfig>
	 */
	public List<AppConfig> like(Dto pDto){
	
	    return baseMapper.like(pDto);
	
	};

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return Page<AppConfig>
	 */
	public Page<AppConfig> likePage(Dto pDto){
	    Query<AppConfig> query=new Query<AppConfig>(pDto);
	    query.setRecords(baseMapper.likePage(query,pDto));
	    return query;
	};
	/**
	 * 根据数学表达式进行数学运算
	 * 
	 * @param pDto
	 * @return String
	 */
	 public String calc(Dto pDto){
	 
	     return baseMapper.calc(pDto);
	 }
	 
}
