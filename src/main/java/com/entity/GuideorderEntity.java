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
 * 导游预约
 * 数据库通用操作实体类（普通增删改查）
 */
@TableName("guideorder")
public class GuideorderEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	public GuideorderEntity() {

	}

	public GuideorderEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@TableId
	private Long id;
	private Long userid;
	private String username;
	private Long guideid;
	private String guideusername;
	private String guidename;

	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
	@DateTimeFormat
	private Date plandate;

	private Integer days;
	private Float amount;
	private String status;
	private String remark;

	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Long getGuideid() {
		return guideid;
	}

	public void setGuideid(Long guideid) {
		this.guideid = guideid;
	}

	public String getGuideusername() {
		return guideusername;
	}

	public void setGuideusername(String guideusername) {
		this.guideusername = guideusername;
	}

	public String getGuidename() {
		return guidename;
	}

	public void setGuidename(String guidename) {
		this.guidename = guidename;
	}

	public Date getPlandate() {
		return plandate;
	}

	public void setPlandate(Date plandate) {
		this.plandate = plandate;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
}
