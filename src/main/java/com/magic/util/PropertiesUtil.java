package com.magic.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class PropertiesUtil {
	
	private Properties prop;

	public PropertiesUtil(String propertiesName) throws IOException{
		Resource resource = new ClassPathResource(propertiesName);
		prop = PropertiesLoaderUtils.loadProperties(resource);
	}
	
	public String getProperty(String key,String defaultValue){
		return prop.getProperty(key, defaultValue);
	}
}
