package com.entity.view;

import com.entity.GuideEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 导游
 * 后端返回视图实体辅助类
 */
@TableName("guide")
public class GuideView  extends GuideEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public GuideView(){
	}
 
 	public GuideView(GuideEntity guideEntity){
 	try {
			BeanUtils.copyProperties(this, guideEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
 		
 	}
}
