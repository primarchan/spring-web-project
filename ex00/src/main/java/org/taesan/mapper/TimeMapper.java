package org.taesan.mapper;

import org.apache.ibatis.annotations.Select;

// org.taesan.mapper.TimeMapper.getTime2 -> 

public interface TimeMapper {
	
	@Select("select sysdate from dual") 
	String getTime();
	
	String getTime2();
	
	String getTime3();
}
