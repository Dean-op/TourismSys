package com.entity.view;

import com.entity.WeatherEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 天气预报
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@TableName("weather")
public class WeatherView  extends WeatherEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public WeatherView(){
	}
 
 	public WeatherView(WeatherEntity weatherEntity){
 	try {
			BeanUtils.copyProperties(this, weatherEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
