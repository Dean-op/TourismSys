package com.entity.view;

import com.entity.GuideorderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 导游预约
 * 后端返回视图实体辅助类
 */
@TableName("guideorder")
public class GuideorderView  extends GuideorderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public GuideorderView(){
	}
 
 	public GuideorderView(GuideorderEntity guideorderEntity){
 	try {
			BeanUtils.copyProperties(this, guideorderEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
 		
 	}
}
