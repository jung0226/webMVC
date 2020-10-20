package com.bitcamp.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandService {
	//		viewFile
	public String executeCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}
