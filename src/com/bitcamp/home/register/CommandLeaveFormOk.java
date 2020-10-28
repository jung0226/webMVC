package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandLeaveFormOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//1. 비밀번호
		String userpwd=req.getParameter("userpwd");
		
		//2. 세션의 아이디 가져오기
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("logId");
		
		RegisterDAO dao = RegisterDAO.getInstance();
		
		int result = dao.regLeaveRecord(userid, userpwd);
		if(result>0){//레코드가 삭제됨
			ses.invalidate();
		}
		
		req.setAttribute("result", result);
		return "regLeaveResult.jsp";
		
		
		}

}
