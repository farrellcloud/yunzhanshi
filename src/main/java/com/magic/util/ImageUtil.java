package com.magic.util;

import java.io.File;
import java.io.IOException;

public class ImageUtil {
	
	public static String getImagePath(String fileName,String folder,String x,String y) throws IOException{

		PropertiesUtil props = new PropertiesUtil("settings.properties");
		StringBuffer str = new StringBuffer(getFilePath(props,"filePath", ""));
		String fileSuffix = props.getProperty("fileSuffix", "zip");
		String suffix = null;
		if("bigimages".equals(folder)){
			suffix = props.getProperty("bigImageSuffix", "jpg");
		}else{
			suffix = props.getProperty("smallImageSuffix", "jpg");
		}
		str.append(File.separator).append(fileName).append(fileSuffix).append(File.separator)
				.append(folder).append(File.separator).append(x).append("_").append(y).append(".").append(suffix);
		return str.toString();
	}
	
	public static String getFilePath(PropertiesUtil props,String key,String defaultValue){
		String filePath = new String(props.getProperty(key, defaultValue));
		if(filePath != null){
			File file = new File(filePath);
			if(!file.exists())
				file.mkdirs();
		}
		return filePath;
	}
}
