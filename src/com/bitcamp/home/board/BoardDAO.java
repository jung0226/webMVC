package com.bitcamp.home.board;

import java.util.List;

import com.bitcamp.home.DBConnection;

public class BoardDAO extends DBConnection implements BoardInterface{
	public static BoardDAO getInstance() {
		return new BoardDAO();
	}
	@Override
	public void getSelected(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getAllRecordCount() {
		int totalRecord=0;
		try {
			getConn();
			String sql = "select count(no) from freeboard";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("총 레코드 수 구하기 에러 발생-> "+e.getMessage());
		}finally {
			getClose();
		}
		return totalRecord;
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> getListRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
