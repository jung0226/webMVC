package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandBoardView implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		BoardVO vo = new BoardVO();
		PagingVO pVO = new PagingVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		pVO.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		
		if(req.getParameter("searchWord")!=null) {
			pVO.setSearchKey(req.getParameter("searchKey"));
			pVO.setSearchWord(req.getParameter("searchWord"));
		}
		
		BoardDAO dao=new BoardDAO();
		
		//조회수 증가
		dao.hitCount(vo.getNo());
		
		//레코드 선택
		dao.getSelected(vo);
		
		req.setAttribute("vo", vo);
		req.setAttribute("pVO", pVO);
		
		return "/board/boardView.jsp";
	}

}
