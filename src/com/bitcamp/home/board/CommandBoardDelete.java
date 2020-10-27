package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardDelete implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		//페이지 번호, 검색키, 검색어
		PagingVO pVO = new PagingVO();
		pVO.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		String searchWordStr = req.getParameter("searchWord");
		if (searchWordStr != null) {
			pVO.setSearchKey(req.getParameter("searchKey"));
			pVO.setSearchWord(searchWordStr);
		}
		BoardDAO dao = new BoardDAO();
		int result = dao.boardDelete(no);

		//req.setAttribute("no", no);
		req.setAttribute("pVO", pVO);
		req.setAttribute("result", result);
		return "/board/boardDeleteOk.jsp";
	}

}
