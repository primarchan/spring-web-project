package org.taesan.mapper;

import java.util.List;

// import org.apache.ibatis.annotations.Select;
import org.taesan.domain.BoardVO;
import org.taesan.domain.Criteria;

public interface BoardMapper {
	
	// @Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	// create(insert) 처리(insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우)
	public void insert(BoardVO board);
	
	// create(insert) 처리(insert문이 실행되고 생성된 PK 값을 알아야 하는 경우)
	public void insertSelectKey(BoardVO board);
	
	// read(select 처리)
	public BoardVO read(Long bno);

	// update 처리
	public int update(BoardVO board);
	
	// delete 처리
	public int delete(Long bno);
	
	// 페이징 처리
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 전체 데이터 개수 처리
	public int getTotalCount(Criteria cri);

}
