package org.taesan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.taesan.domain.BoardVO;
import org.taesan.domain.Criteria;
import org.taesan.domain.PageDTO;
import org.taesan.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	// 목록
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		
//		model.addAttribute("list", service.getList());
//	}
	
	// 목록 + 페이징
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		// BoardController 에서 PageDTO를 사용할 수 있도록 Model에 담아서 화면에 전달해 줄 필요가 있음
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}
	
	// 등록
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register : " + board);
		
		service.registser(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	// 입력 페이지
	@GetMapping("/register")
	public void registerGET() {
		
	}

	// 조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	// 수정
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	//  삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
}
