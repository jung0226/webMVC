package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CommandDataWriteOk implements CommandService {

	@Override
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//파일 업로드, 데이터를 request
		//cos.jar에 있는 MultipartRequest클래스가 파일 업로드, 데이터를 request 한다.
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("업로드할 위치= "+path);
		int maxSize=1024*1024*1024;  //1MB =1024*1024, 1GB=1024*2^3
		DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
		//1. request객체
		//2. 업로드할 위치(절대주소)
		//3. 업로드할 파일의 최대 크기
		//4. 한글 인코딩 코드
		//5. 같은 파일명이 존재할 때 파일명 변경
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", pol);
		
		//폼의 정보를 vo에 담기
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		HttpSession session = req.getSession();
		vo.setUserid((String)session.getAttribute("logId"));
		
		vo.setIp(req.getRemoteAddr());

		//업로드 파일명 	a,b		a, null		null,b
		int idx=0;
		String fileName[] = new String[2];
		
		//MultipartRequest 객체에서 사용자가 선택한 원래 파일목록을 구한다.
		Enumeration fileList = mr.getFileNames();
		while(fileList.hasMoreElements()) {
			String oldFileName =(String)fileList.nextElement();
			String newFileName = mr.getFilesystemName(oldFileName);//새로운 파일명
			
			System.out.println(oldFileName +"--> "+ newFileName);
			if(newFileName != null) {
				fileName[idx++] = newFileName;
			}			
		}
		vo.setFilename(fileName);
		
		DataDAO dao = new DataDAO();
		int result = dao.dataInsert(vo);
		
		//레코드 추가 실패시 이미 업로드된 파일을 삭제한다.
		if(result<=0) {
			 for(String delFile : fileName) {
				 if(delFile!=null) {
					 File file=new File(path, delFile);
					 file.delete();
				 }
			 }
		}
		req.setAttribute("result", result);
		return "/data/dataWriteOk.jsp";
	}

}
