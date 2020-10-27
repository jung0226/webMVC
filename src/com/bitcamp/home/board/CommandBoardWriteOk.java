package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandBoardWriteOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession ses = req.getSession();
		
		BoardVO vo = new BoardVO(req.getParameter("subject"), req.getParameter("content"), (String)ses.getAttribute("logId"), req.getRemoteAddr());
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.boardInsert(vo);
		req.setAttribute("cnt", cnt);
		
		return "/board/boardWriteOk.jsp";
	}

}
