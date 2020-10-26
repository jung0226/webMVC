package com.bitcamp.home.board;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConnection;

public class BoardDAO extends DBConnection implements BoardInterface{
	public static BoardDAO getInstance() {
		return new BoardDAO();
	}
	
	//레코드 1개를 선택
	@Override
	public void getSelected(BoardVO vo) {
		try {
			getConn();
			String sql = "select no, subject, content, userid, hit, writedate from freeboard "
					+ "where no="+vo.getNo();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserid(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setWritedate(rs.getString(6));
			}
			
		}catch(Exception e){
			System.out.println("레코드 선택에러 --> "+e.getMessage());
		}finally {
			getClose();
		}
		
	}

	@Override
	public int getAllRecordCount(PagingVO pageVO) {//getAllRecordCount getAllRecordCount getAllRecordCount
		int totalRecord=0;
		try {
			getConn();
			String sql = "select count(no) from freeboard";
			if(pageVO.getSearchWord()!=null) {// --------------------------------확인
				sql+=" where " + pageVO.getSearchKey()+" like '%"+pageVO.getSearchWord()+"%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
			
			//조회수 증가
			
		}catch(Exception e) {
			System.out.println("총 레코드 수 구하기 에러 발생-> "+e.getMessage());
		}finally {
			getClose();
		}
		return totalRecord;
	}

	@Override
	public void hitCount(int no) {
		try {
			getConn();
			String sql = "update freeboard set hit=hit+1 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();			
			
		}catch(Exception e) {
			System.out.println("조회수 증가 에러-> "+e.getMessage());
		}finally {
			getClose();
		}
		
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
	public List<BoardVO> getListRecord(PagingVO pVO) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConn();
			String sql = "select * from "
					+ "(select * from "
					+ "(select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from freeboard";
			//검색어가 있을 때
			if(!(pVO.getSearchKey()==null || pVO.getSearchWord()==null)) {
				//sql+="where "+pVO.getSearchKey()+"like ?";
				sql+=" where "+pVO.getSearchKey()+" like ?";
			}
			sql+=" order by no desc)"
					+ " where rownum<=? order by no asc)"
					+ " where rownum<=? order by no desc";
			pstmt =conn.prepareStatement(sql);
			//검색어가 있을 때
			if(!(pVO.getSearchKey()==null || pVO.getSearchWord()==null)) {
				pstmt.setString(1, "%"+pVO.getSearchWord()+"%");
				pstmt.setInt(2, pVO.getNowPage()*pVO.getOnePageRecord());
				pstmt.setInt(3, pVO.getLastPageRecordCount());
			}else {//검색어가 없을 때
				pstmt.setInt(1, pVO.getNowPage()*pVO.getOnePageRecord());
				pstmt.setInt(2, pVO.getLastPageRecordCount());
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1), rs.getString(2), null, rs.getString("userid"), 
						rs.getInt(4), rs.getString(5)));
				
			}
		}catch(Exception e) {
			System.out.println("게시판 레코드 선택 에러 발생 --> "+e.getMessage());
		}finally {
			getClose();
		}
		return list;
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
