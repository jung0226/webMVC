package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandEditForm implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//회원정보
		//session로그인한 id를 구해서 db에서 회원정보를 선택한다.
		HttpSession session = req.getSession();
		
		RegisterVO vo = new RegisterVO();
		vo.setUserid((String)session.getAttribute("logId"));
		
		RegisterDAO dao = RegisterDAO.getInstance();
		dao.registerSelect(vo);
		
		req.setAttribute("regVO", vo);
		
		
		return "/register/regEditForm.jsp";
	}

}
 