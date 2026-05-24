package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;


/**
 * 天气预报
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@TableName("weather")
public class WeatherEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public WeatherEntity() {
		
	}
	
	public WeatherEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 城市
	 */
					
	private String city;
	
	/**
	 * 封面
	 */
					
	private String picture;
	
	/**
	 * 天气
	 */
					
	private String weather;
	
	/**
	 * 气温
	 */
					
	private String temp;
	
	/**
	 * 湿度
	 */
					
	private String wet;
	
	/**
	 * 风向
	 */
					
	private String wind;
	
	/**
	 * 风速
	 */
					
	private String windspeed;
	
	/**
	 * 适宜出行
	 */
					
	private String outdoor;
	
	/**
	 * 穿衣推荐
	 */
					
	private String clothing;
	
	/**
	 * 更新时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date updatetime;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：城市
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * 获取：城市
	 */
	public String getCity() {
		return city;
	}
	/**
	 * 设置：封面
	 */
	public void setPicture(String picture) {
		this.picture = picture;
	}
	/**
	 * 获取：封面
	 */
	public String getPicture() {
		return picture;
	}
	/**
	 * 设置：天气
	 */
	public void setWeather(String weather) {
		this.weather = weather;
	}
	/**
	 * 获取：天气
	 */
	public String getWeather() {
		return weather;
	}
	/**
	 * 设置：气温
	 */
	public void setTemp(String temp) {
		this.temp = temp;
	}
	/**
	 * 获取：气温
	 */
	public String getTemp() {
		return temp;
	}
	/**
	 * 设置：湿度
	 */
	public void setWet(String wet) {
		this.wet = wet;
	}
	/**
	 * 获取：湿度
	 */
	public String getWet() {
		return wet;
	}
	/**
	 * 设置：风向
	 */
	public void setWind(String wind) {
		this.wind = wind;
	}
	/**
	 * 获取：风向
	 */
	public String getWind() {
		return wind;
	}
	/**
	 * 设置：风速
	 */
	public void setWindspeed(String windspeed) {
		this.windspeed = windspeed;
	}
	/**
	 * 获取：风速
	 */
	public String getWindspeed() {
		return windspeed;
	}
	/**
	 * 设置：适宜出行
	 */
	public void setOutdoor(String outdoor) {
		this.outdoor = outdoor;
	}
	/**
	 * 获取：适宜出行
	 */
	public String getOutdoor() {
		return outdoor;
	}
	/**
	 * 设置：穿衣推荐
	 */
	public void setClothing(String clothing) {
		this.clothing = clothing;
	}
	/**
	 * 获取：穿衣推荐
	 */
	public String getClothing() {
		return clothing;
	}
	/**
	 * 设置：更新时间
	 */
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	/**
	 * 获取：更新时间
	 */
	public Date getUpdatetime() {
		return updatetime;
	}

}
