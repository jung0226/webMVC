package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class CommandDataDelete implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		DataVO vo = new DataVO();
		
		HttpSession session = req.getSession();
		vo.setUserid((String)session.getAttribute("logId"));
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		
		DataDAO dao = new DataDAO();
		int cnt = dao.dataDelete(vo);
		
		//레코드 삭제 확인 후 파일을 삭제한다.
		if(cnt>0) {
			String file[]=vo.getFilename();
			String path = req.getServletContext().getRealPath("/upload");
			for(String f: file) {
				if(f!=null) {
					File delFile = new File(path, f);
					delFile.delete();
				}
			}
		}
		req.setAttribute("cnt", cnt);
		return "/data/dataDelOk.jsp";
	}

}
