package com.bitcamp.home.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardList implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//총 레코드 수 
		BoardDAO dao = BoardDAO.getInstance();
		PagingVO pageVO = new PagingVO();
		
		//현재 페이지
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			pageVO.setNowPage(Integer.parseInt(nowPageTxt));
		}		
		
		//검색어, 검색키
		String sWord = req.getParameter("searchWord");
		if(!(sWord==null || sWord.equals(""))) {//검색어가 있을때
			pageVO.setSearchKey(req.getParameter("searchKey"));
			pageVO.setSearchWord(sWord);
		}
		
		//총 레코드 수 
		pageVO.setTotalRecord(dao.getAllRecordCount(pageVO));
		
		List<BoardVO> list = dao.getListRecord(pageVO);
		
		req.setAttribute("pageVO", pageVO);
		req.setAttribute("list", list);
		
		return "/board/boardList.jsp";
	}

}
