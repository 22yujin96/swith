package com.kh.swithme.board.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class StudyRoom {
	private int srNo;
	private String srName;
	private String srLocation;
	private float srLat;
	private float srLng;
	private String srPhone;
	private String srIntroduce;
	private Date date;
}
