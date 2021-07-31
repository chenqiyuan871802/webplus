package com.toonan.system.service;

import com.toonan.system.model.Log;
import com.toonan.system.mapper.LogMapper;
import com.toonan.system.service.LogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import com.toonan.core.matatype.Dto;
import com.baomidou.mybatisplus.plugins.Page;
import com.toonan.core.vo.Query;

/**
 * <p>
 * 系统日志表 服务实现类
 * </p>
 *
 * @author 陈骑元
 * @since 2020-11-30
 */
@Service
public class LogService extends ServiceImpl<LogMapper, Log>  {
     
   
     /**
	 * 根据Dto查询并返回数据持久化对象集合
	 * 
	 * @return List<Log>
	 */
	public List<Log> list(Dto pDto){
	    
	    return baseMapper.list(pDto);
	};
    /**
	 * 根据Dto查询并返回分页数据持久化对象集合
	 * 
	 * @return Page<Log>
	 */
	public Page<Log> listPage(Dto pDto){
	    Query<Log> query=new Query<Log>(pDto);
	    query.setRecords(baseMapper.listPage(query,pDto));
	    return query;
	};
		
	/**
	 * 根据Dto模糊查询并返回数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return List<Log>
	 */
	public List<Log> like(Dto pDto){
	
	    return baseMapper.like(pDto);
	
	};

	/**
	 * 根据Dto模糊查询并返回分页数据持久化对象集合(字符型字段模糊匹配，其余字段精确匹配)
	 * 
	 * @return Page<Log>
	 */
	public Page<Log> likePage(Dto pDto){
		
	    Query<Log> query=new Query<Log>(pDto);
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
