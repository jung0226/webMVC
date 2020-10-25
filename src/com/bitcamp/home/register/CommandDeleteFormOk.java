package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandDeleteFormOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//세션의 아이디 가져오기
		RegisterDAO dao = RegisterDAO.getInstance();
		
		HttpSession session = req.getSession();
		String logId = (String)session.getAttribute("logId");
		
		int result = dao.registerDelete(logId);
		if(result>0){
			session = req.getSession();
			session.invalidate();
			return "/index.jsp";
		}else {
			return "/register/regDeleteForm.jsp";
		}
		
	}

}
