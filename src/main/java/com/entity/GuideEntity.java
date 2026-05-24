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
 * 导游
 * 数据库通用操作实体类（普通增删改查）
 */
@TableName("guide")
public class GuideEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	public GuideEntity() {

	}

	public GuideEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@TableId
	private Long id;
	private String guideusername;
	private String password;
	private String guidename;
	private String phone;
	private String idcard;
	private String avatar;
	private String qualification;
	private String specialties;
	private Float price;
	private String status;

	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getGuideusername() {
		return guideusername;
	}

	public void setGuideusername(String guideusername) {
		this.guideusername = guideusername;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGuidename() {
		return guidename;
	}

	public void setGuidename(String guidename) {
		this.guidename = guidename;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialties() {
		return specialties;
	}

	public void setSpecialties(String specialties) {
		this.specialties = specialties;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
}
