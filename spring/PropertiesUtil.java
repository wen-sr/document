package org.tarena.aop;

import java.util.Properties;

public class PropertiesUtil {
	private static Properties props = new Properties();
	
	static{
		try{
		props.load(PropertiesUtil.class.getClassLoader()
				.getResourceAsStream("opt.properties"));
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public static String getValue(String key){
		String value =  props.getProperty(key);
		if(value == null){
			return "";
		}else{
			return value;
		}
	}
}
