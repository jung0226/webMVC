package com.bitcamp.home.board;

import java.util.List;

public interface BoardInterface {
	//글 선택
	public void getSelected(BoardVO vo);
	//총레코드수
	public int getAllRecordCount(PagingVO pageVO);
	//조회수 증가
	public void hitCount(int no);
	//글 수정
	public int boardUpdate(BoardVO vo);
	//글 삭제
	public int boardDelete(int no);
	//해당페이지의 레코드를 선택
	public List<BoardVO> getListRecord(PagingVO vo);
	//글 등록
	public int boardInsert(BoardVO vo);
}
