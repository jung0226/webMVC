package com.bitcamp.home;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/*.do")
public class ControllerAction extends HttpServlet {
	Map<String, CommandService> map =new HashMap<String, CommandService>();
    public ControllerAction() {
        super();
    }
    // doGet(), doPost()가 실행되기 전에 호출되는 메소드
    public void init(ServletConfig config) throws ServletException{
    	//properties파일 매핑주소와 객체를 Map에 저장한다.
    	
    	//1. properties 파일 이름을 얻어오기
    	String propertiesFile = config.getInitParameter("proFileName");    	
    	
    	Properties prop = new Properties(); // String, String
    	try {
    		FileInputStream fis = new FileInputStream(propertiesFile);
    		prop.load(fis);
    	}catch(FileNotFoundException fnfe) {
    		System.out.println("프로퍼티 파일이 존재하지 않습니다. "+fnfe.getMessage());
    	}catch(IOException ie) {
    		System.out.println("프로퍼티 로딩에러 "+ie.getMessage());
    	}
    	//2. properties의 문자열을 객체로 생성하여 map에 추가하는 기능 구현
    	try {
	    	//키 목록 얻어오기
	    	Enumeration keyList= prop.propertyNames();
	    	while(keyList.hasMoreElements()) {
	    		String key = (String)keyList.nextElement();
	    		//key에 해당하는 commandClass명을 얻어온다.(String)
	    		String command = prop.getProperty(key); //"com.bitcamp.home.CommandIndex"
	    		//System.out.println("key= "+key+", value= "+command);
	    		
	    		//Class.forName() : 문자열을 클래스로 만들어줌.
	    		//문자열로 되어 있는 패키지와 클래스명을 객체로 만들기.
	    		Class commandClass= Class.forName(command); //Class
	    		CommandService service = (CommandService)commandClass.getDeclaredConstructors()[0].newInstance();
	    		
	    		map.put(key,service);
	    	}
    	}catch(Exception e) {
    		System.out.println("프로퍼티를 Map을 만들기에서 에러 발생.."+e.getMessage());
    	}
    	
    	
    }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//uri 주소를 구한다.
		String uriPath = req.getRequestURI(); // /webMVC/index.do, /webMVC/*.do, /webMVC/board.list.do
		String contextPath=req.getContextPath();// /webMVC
		//System.out.println("uriPath= "+uriPath);
		//System.out.println("contextPath= "+contextPath);
		String commandKey = uriPath.substring(contextPath.length());
		CommandService service = map.get(commandKey);
		String viewFile = service.executeCommand(req, res);
		
		//view파일로 이동시키기
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewFile);
		dispatcher.forward(req, res);//view 페이지로 이동하기
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
