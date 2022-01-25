package com.toonan.system.mapper;

import com.toonan.system.model.CustomDict;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.toonan.core.matatype.Dto;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 * <p>
 * 自定义字典 Mapper 接口
 * </p>
 *
 * @author 陈骑元
 * @since 2022-01-25
 */
public interface CustomDictMapper extends BaseMapper<CustomDict> {

    /**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<CustomDict>
	 */
	List<CustomDict> list(Dto pDto);
    /**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return List<CustomDict>
	 */
	List<CustomDict> listPage(Pagination page,Dto pDto);
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<CustomDict>
	 */
	List<CustomDict> like(Dto pDto);

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<CustomDict>
	 */
	List<CustomDict> likePage(Pagination page,Dto pDto);
	
	/**
	 * 根据数学表达式进行数学运算
	 * 
	 * @param pDto
	 * @return String
	 */
	 String calc(Dto pDto);


}
