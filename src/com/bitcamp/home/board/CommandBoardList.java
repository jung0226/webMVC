package com.bitcamp.home.board;

import java.io.IOException;

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
		
		pageVO.setTotalRecord(dao.getAllRecordCount());//총 레코드 수 
		
		req.setAttribute("pageVO", pageVO);
		return "/board/boardList.jsp";
	}

}
