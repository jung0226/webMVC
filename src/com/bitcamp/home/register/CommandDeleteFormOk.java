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
		RegisterVO vo = new RegisterVO();
		vo.setUserid(req.getParameter("userid"));
		//세션의 아이디 가져오기
		RegisterDAO dao = RegisterDAO.getInstance();
		
		int result = dao.registerDelete(vo.getUserid());
		if(result>0){
			HttpSession session = req.getSession();
			session.invalidate();
			return "/register/regDeleteResult.jsp";
		}else {
			return "/register/regDeleteForm.jsp";
		}
		
	}

}
