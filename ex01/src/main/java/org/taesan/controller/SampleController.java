package org.taesan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.taesan.domain.SampleDTO;
import org.taesan.domain.SampleDTOList;
import org.taesan.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		
		log.info("basic.................................");
		
	}
	
	@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		
		log.info("basic get.................................");
		
	}
	
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		
		log.info("basic get only get.................................");
		
	}
	
	// 파라미터 자동 수집
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		
		log.info("" + dto);
		
		return "ex01";
		
	}
	
	// 파라미터 자동 수집과 변환
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		
		log.info("name" + name);
		log.info("age" + age);
		
		return "ex02";
		
	}
	
	// 리스트 파라미터
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		
		log.info("ids" + ids);
		
		return "ex02List";
		
	}
	
	// 배열 파라미터
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		
		log.info("array ids" + Arrays.toString(ids));
		
		return "ex02Array";
		
	}
	
	// 객체 리스 트파라미터
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		
		log.info("list dtos" + list);
		
		return "ex02Bean";
		
	}

// 파라미터로 사용되는 인스턴스 변수에 @DateTimeFormat을 적용해 변환하면 @InitBinder는 불필요	
/*
	// @InitBinder를 이용한 파라미터 변환 처리
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
*/	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		
		log.info("todo" + todo);
		
		return "/ex03";
				
	}
	

}
