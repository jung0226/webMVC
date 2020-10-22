package com.bitcamp.home.register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class CommandFormOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//폼의 데이터를 request후 저장할 객체
		
		RegisterVO vo = new RegisterVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		vo.setUsername(req.getParameter("username"));
		vo.setGender(req.getParameter("gender"));
		
		//생년월일
		vo.setYear(req.getParameter("year"));
		vo.setMonth(req.getParameter("month"));
		vo.setDay(req.getParameter("day"));
		
		vo.setTel1(req.getParameter("tel1"));
		vo.setTel2(req.getParameter("tel2"));
		vo.setTel3(req.getParameter("tel3"));
		
		vo.setEmail(req.getParameter("email"));
		
		vo.setZipcode(req.getParameter("zipcode"));
		vo.setAddr(req.getParameter("addr"));
		vo.setAddrDetail(req.getParameter("addrdetail"));
		
		RegisterDAO dao = new RegisterDAO();
		
		int result = dao.registerInsert(vo);
		
//		if(result==0) {//회원가입실패
//			return "/register/regFormResult.jsp";
//		}else {//회원가입성공
//			return "index.jsp";
//		}
		
		req.setAttribute("result", result);//view로 필요한 데이터 보내기
		
		return "/register/regFormResult.jsp";
	}

}
