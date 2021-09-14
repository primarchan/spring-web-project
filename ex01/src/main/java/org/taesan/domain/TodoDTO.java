package org.taesan.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	
	private String title;
	
	// @DateTimeFormat : @InitBinder 외에도 날짜에 대한 처리가 쉽게 추가된 어노테이션 
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dueDate;

}
