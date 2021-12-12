package org.taesan.service;

import java.util.List;

import org.taesan.domain.BoardVO;
import org.taesan.domain.Criteria;

public interface BoardService {
	
	// 등록
	public void  registser(BoardVO board);
	
	// 조회
	public BoardVO get(Long bno);
	
	// 수정
	public boolean modify(BoardVO board);
	
	// 삭제
	public boolean remove(Long bno);
	
	// 목록(리스트)
	// public List<BoardVO> getList();
	
	// 목록(리스트) + 페이징 처리
	public List<BoardVO> getList(Criteria cri);
	
	// 전체 데이터 개수 처리
	public int getTotal(Criteria cri);

}
