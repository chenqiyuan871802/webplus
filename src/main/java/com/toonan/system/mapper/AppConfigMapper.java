package com.toonan.system.mapper;

import com.toonan.system.model.AppConfig;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.toonan.core.matatype.Dto;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 * <p>
 * 应用配置 Mapper 接口
 * </p>
 *
 * @author 陈骑元
 * @since 2022-02-04
 */
public interface AppConfigMapper extends BaseMapper<AppConfig> {

    /**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<AppConfig>
	 */
	List<AppConfig> list(Dto pDto);
    /**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return List<AppConfig>
	 */
	List<AppConfig> listPage(Pagination page,Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<AppConfig>
	 */
	List<AppConfig> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<AppConfig>
	 */
	List<AppConfig> likePage(Pagination page,Dto pDto);
	
	/**
	 * 根据数学表达式进行数学运算
	 * 
	 * @param pDto
	 * @return String
	 */
	 String calc(Dto pDto);


}
