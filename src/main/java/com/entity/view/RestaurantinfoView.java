package com.entity.view;

import com.entity.RestaurantinfoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 餐厅信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@TableName("restaurantinfo")
public class RestaurantinfoView  extends RestaurantinfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public RestaurantinfoView(){
	}
 
 	public RestaurantinfoView(RestaurantinfoEntity restaurantinfoEntity){
 	try {
			BeanUtils.copyProperties(this, restaurantinfoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
