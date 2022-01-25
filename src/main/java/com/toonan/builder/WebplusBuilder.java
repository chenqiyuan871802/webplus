package com.toonan.builder;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.FileOutConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 
 * 类名:com.toonan.builder.WebplusBuilder
 * 描述:代码生成器
 * 编写者:陈骑元
 * 创建时间:2019年5月13日 下午11:34:55
 * 修改说明:
 */


public class WebplusBuilder {
	public static void main(String[] args) {
		String outputDir = "e:\\dao";
		final String viewOutputDir = outputDir + "/view/";
		AutoGenerator mpg = new AutoGenerator();
		// 全局配置
		GlobalConfig gc = new GlobalConfig();
		gc.setOutputDir(outputDir);
		gc.setFileOverride(true);
		gc.setActiveRecord(true);
		// XML 二级缓存
		gc.setEnableCache(false);
		// XML ResultMap
		gc.setBaseResultMap(true);
		// XML columList
		gc.setBaseColumnList(true);
		gc.setAuthor("陈骑元");
		
		
		mpg.setGlobalConfig(gc);

		// 数据源配置
		/*DataSourceConfig dsc = new DataSourceConfig();
		dsc.setDbType(DbType.ORACLE);
		dsc.setDriverName("oracle.jdbc.driver.OracleDriver");
		dsc.setUsername("pyfwpt");
		dsc.setPassword("pyfwpt");
		dsc.setUrl("jdbc:oracle:thin:@192.168.1.247:1521:lgorcl");
		mpg.setDataSource(dsc);*/
		DataSourceConfig dsc = new DataSourceConfig();
		dsc.setDbType(DbType.MYSQL);
		dsc.setDriverName("com.mysql.jdbc.Driver");
		dsc.setUsername("root");
		dsc.setPassword("root");
		dsc.setUrl("jdbc:mysql://127.0.0.1:3306/webplus?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false");
		mpg.setDataSource(dsc);

		// 策略配置
		StrategyConfig strategy = new StrategyConfig();
		// strategy.setCapitalMode(true);// 全局大写命名 ORACLE 注意
		strategy.setTablePrefix(new String[] {"sys_"});// 此处可以修改为您的表前缀
		// 表名生成策略
		strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
		strategy.setSuperControllerClass("com.toonan.core.web.BaseController");
		strategy.setSuperEntityClass("com.toonan.core.matatype.impl.BaseModel");
		strategy.setInclude(new String[] {"sys_custom_dict"}); 
		mpg.setStrategy(strategy);

		// 包配置
		PackageConfig pc = new PackageConfig();
		pc.setParent("com.toonan");
		pc.setController("controller");
		gc.setServiceName("%sService");
		pc.setEntity("model");
		pc.setModuleName("system");
		mpg.setPackageInfo(pc);

		// 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
		InjectionConfig cfg = new InjectionConfig() {
			@Override
			public void initMap() {
				Map<String, Object> map = new HashMap<String, Object>();
             
            
                this.setMap(map);

			}
		};
		// 生成的模版路径，不存在时需要先新建
		File viewDir = new File(viewOutputDir);
		if (!viewDir.exists()) {
			viewDir.mkdirs();
		}
		List<FileOutConfig> files = new ArrayList<FileOutConfig>();
		files.add(new FileOutConfig("/templates/list.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                
                String entityFile = String.format((viewOutputDir + File.separator + "%s" + ".html"), tableInfo.getEntityPath()+"List");
                return entityFile;
            }
        });
		
		files.add(new FileOutConfig("/templates/add.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                
                String entityFile = String.format((viewOutputDir + File.separator + "%s" + ".html"), "add"+tableInfo.getEntityName());
                return entityFile;
            }
        });
		files.add(new FileOutConfig("/templates/edit.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                
                String entityFile = String.format((viewOutputDir + File.separator + "%s" + ".html"), "edit"+tableInfo.getEntityName());
                return entityFile;
            }
        });
		cfg.setFileOutConfigList(files);
		mpg.setCfg(cfg);
		/*TemplateConfig tc = new TemplateConfig();
		tc.setController("/templates/generator/controller.java.vm");
		tc.setService("/templates/generator/service.java.vm");
		tc.setServiceImpl("/templates/generator/serviceImpl.java.vm");
		tc.setMapper("/templates/generator/mapper.java.vm");
		tc.setXml("/templates/generator/mapper.xml.vm");
		tc.setEntity("templates/generator/entity.java.vm");
		mpg.setTemplate(tc);*/

		// 生成controller相关
		mpg.execute();
	}
}
