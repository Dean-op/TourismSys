package com.entity.view;

import com.entity.DiscusshotelinfoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 酒店信息评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-11-09 18:31:56
 */
@TableName("discusshotelinfo")
public class DiscusshotelinfoView  extends DiscusshotelinfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscusshotelinfoView(){
	}
 
 	public DiscusshotelinfoView(DiscusshotelinfoEntity discusshotelinfoEntity){
 	try {
			BeanUtils.copyProperties(this, discusshotelinfoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
