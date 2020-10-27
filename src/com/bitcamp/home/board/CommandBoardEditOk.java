package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardEditOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		//
		PagingVO pVO = new PagingVO();
		pVO.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		if(req.getParameter("searchWord")!=null) {
			pVO.setSearchKey(req.getParameter("searchKey"));
			pVO.setSearchWord(req.getParameter("searchWord"));
		}
		
		BoardVO vo = new BoardVO();
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		
		BoardDAO dao = new BoardDAO();
		int cnt= dao.boardUpdate(vo);
		
		req.setAttribute("no", vo.getNo());
		req.setAttribute("pVO", pVO);
		req.setAttribute("cnt", cnt);
		
		return "/board/boardEditOk.jsp";
	}

}
