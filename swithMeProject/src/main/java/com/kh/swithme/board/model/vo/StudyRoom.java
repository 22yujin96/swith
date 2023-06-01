package com.kh.swithme.board.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class StudyRoom {
	private int sRoomNo;
	private String sRoomName;
	private String sRoomLocation;
	private float sRoomLat;
	private float sRoomLng;
	private String sRoomPhone;
	private String sRoomIntroduce;
	private Date date;
}
