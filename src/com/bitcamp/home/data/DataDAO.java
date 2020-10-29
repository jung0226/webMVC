package com.bitcamp.home.data;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConn;

public class DataDAO extends DBConn {
	//자료실 글 등록
	public int dataInsert(DataVO vo) {
		int cnt=0;
		try {
			dbConn();
			sql = "insert into data(no, title, content, userid, filename1, filename2, ip) "
					+ "values(a_sq.nextval, ?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getUserid());
			pstmt.setString(4, vo.getFilename1());
			pstmt.setString(5, vo.getFilename2());
			pstmt.setString(6, vo.getIp());
			
			cnt=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("자료실 레코드 추가 에러발생-> "+e.getMessage());
		}finally {
			dbClose();
		}		
		return cnt;
	}
	//자료실 목록 선택
	public List<DataVO>	dataSelectAll(){
		List<DataVO> list = new ArrayList<DataVO>();
		try {
			dbConn();
			sql = "select no, title, userid, to_char(writedate,'MM-DD HH:MI') writedate, downcount, filename1, filename2 "
					+ "from data order by no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DataVO vo = new DataVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setUserid(rs.getString(3));
				vo.setWritedate(rs.getString(4));
				vo.setDowncount(rs.getInt(5));
				vo.setFilename1(rs.getString(6));
				vo.setFilename2(rs.getString(7));
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("자료실 레코드 선택에러 발생-> "+e.getMessage());
		}finally {
			dbClose();
		}
		return list;		
	}
	//다운로드 회수 증가
	public int downloadCount(int no) {
		int cnt = 0;
		try {
			dbConn();
			
			//다운로드 회수 증가
			sql = "update data set downcount=downcount+1 where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			 //현재 다운로드 회수를 선택
			sql = "select downcount from data where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		}catch(Exception e) {
			System.out.println("다운로드 회수 증가 에러 발생-> "+e.getMessage());
		}finally {
			dbClose();
		}		
		return cnt;
	}
	
}
