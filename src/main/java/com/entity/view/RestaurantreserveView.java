package com.entity.view;

import com.entity.RestaurantreserveEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 餐厅预订
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@TableName("restaurantreserve")
public class RestaurantreserveView  extends RestaurantreserveEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public RestaurantreserveView(){
	}
 
 	public RestaurantreserveView(RestaurantreserveEntity restaurantreserveEntity){
 	try {
			BeanUtils.copyProperties(this, restaurantreserveEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
