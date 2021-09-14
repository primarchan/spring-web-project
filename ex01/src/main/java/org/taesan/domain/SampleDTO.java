package org.taesan.domain;

import lombok.Data;

// Lombok의 @Data 어노테이션 이용 -> getter/setter, equals(), toString() 등의 메서드 자동 생성
@Data
public class SampleDTO {
	
	private String name;
	private int age;

}
