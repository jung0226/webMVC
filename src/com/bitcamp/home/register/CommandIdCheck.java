package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandIdCheck implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//폼에 입력된 아이디를 DB조회한다.
		String userid = req.getParameter("userid");
		
		RegisterDAO dao = new RegisterDAO();
		
		int cnt = dao.idSearch(userid);
		//view로 필요한 데이터 보내기
		req.setAttribute("userid",userid);		
		req.setAttribute("result",cnt);
		return "/register/idSearch.jsp";//폴더가 있을 때는 /필요함
	}

}
