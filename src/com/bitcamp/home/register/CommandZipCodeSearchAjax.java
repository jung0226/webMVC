package com.bitcamp.home.register;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandZipCodeSearchAjax implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String doro = req.getParameter("doro");
		System.out.println("doro= "+doro);
		
		RegisterDAO dao = new RegisterDAO();
		List<ZipcodeVO> list = dao.getZipcodeList(doro);
		
		req.setAttribute("zipList", list);
		
		return "/register/zipcodeViewAjax.jsp";
	}

}
