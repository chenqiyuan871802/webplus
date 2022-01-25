package com.toonan.system.service;

import com.toonan.system.model.CustomDict;
import com.toonan.system.mapper.CustomDictMapper;
import com.toonan.system.service.CustomDictService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import com.toonan.core.matatype.Dto;
import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.vo.Query;

/**
 * <p>
 * 自定义字典 服务实现类
 * </p>
 *
 * @author 陈骑元
 * @since 2022-01-25
 */
@Service
public class CustomDictService extends ServiceImpl<CustomDictMapper, CustomDict>  {
     
   
     /**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<CustomDict>
	 */
	public List<CustomDict> list(Dto pDto){
	    
	    return baseMapper.list(pDto);
	};
    /**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return Page<CustomDict>
	 */
	public Page<CustomDict> listPage(Dto pDto){
	    Query<CustomDict> query=new Query<CustomDict>(pDto);
	    query.setRecords(baseMapper.listPage(query,pDto));
	    return query;
	};
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<CustomDict>
	 */
	public List<CustomDict> like(Dto pDto){
	
	    return baseMapper.like(pDto);
	
	};

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return Page<CustomDict>
	 */
	public Page<CustomDict> likePage(Dto pDto){
	    Query<CustomDict> query=new Query<CustomDict>(pDto);
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
