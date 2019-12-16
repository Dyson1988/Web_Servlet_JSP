package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signup")
//서블릿을 상속(extends)해서 Servlet으로 만들기
public class Ex04 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지를 위한 문자타입 처리(UTF-8처리)
		response.setContentType("text/html;charset=UTF-8");
		
		//전달받은 파라미터 값 추출
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String email = request.getParameter("email");
		
		//취미(hobby) 배열 값 추출
		String[] hobby = request.getParameterValues("hobby");
		
		//콘솔창 출력
		System.out.println("name: " + name + "\n"
							+ "id: " + id + "\n" 
							+ "pwd: " + pwd + "\n" 
							+ "pwd2: " + pwd2 + "\n" 
							+ "email: " + email + "\n"
							+ "hobby: " + hobby.toString() + "\n"
						); 
		
		//응답처리
		PrintWriter out = response.getWriter();
		out.write("<fieldset>");
		out.write("<legend>회원가입정보</legend>");
		out.write("<ul>");
			out.write("<li>이름(name) : " + name + "</li>");
			out.write("<li>아이디(id)  : " + id + "</li>");
			out.write("<li>패스워드(pwd)  : " + pwd + "</li>");
			out.write("<li>패스워드확인(pwd2)  : " + pwd2 + "</li>");
			out.write("<li>e-mail(email)  : " + email + "</li>");
			
			//취미정보 처리
			out.write("<li>취미 : " );
			if(hobby == null) {
				out.write("선택사항 없음");
			} else {
				for (int i = 0; i < hobby.length; i++) {
					out.write(hobby[i] + " ");
				}
				out.write("</li>");
			}
		out.write("</ul>");
		out.write("</fieldset>");
		out.write("<hr>");
		
		//===============================================
		//3. getParameterMap(파라미터명) : 맵 형식으로 파라미터 값 추출
		Map<String, String[]> paramMap = request.getParameterMap();
		String[] names = paramMap.get("name");
		String[] hobby2 = paramMap.get("hobby");
		
		out.write("<h3>파라미터를 Map 형식으로 받아서 처리</h3>");
		out.write("<ol>");
		out.write("<li>이름 : " + names[0] + "</li>");
		out.write("<li>취미 : " );
		if(hobby == null) {
			out.write("선택사항 없음");
		} else {
			for (String str : hobby2) {
				out.println(str + "&nbsp;");
			}
			out.write("</li>");
		}
		out.write("</ol>");
		out.write("<hr>");
		
		//======================================================
		//기타 getParameterNames() : 파라미터명 확인시 사용
		out.println("<h3>넘겨받은 파라미터명</h3>");
		Enumeration<String> paramNames = request.getParameterNames();
		out.write("<p>");
		while (paramNames.hasMoreElements()) {
			out.write(paramNames.nextElement() + " ");
		}
		out.println("</p>");
		out.println("<hr>");
	}

}// Ex04 class End
