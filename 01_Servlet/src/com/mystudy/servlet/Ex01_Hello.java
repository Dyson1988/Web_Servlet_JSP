package com.mystudy.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class Ex01_Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_Hello() {
    	/* 생성자
    	WAS(웹 어플리케이션 서버 : Servlet컨테이너, JSP컨테이너)
    	생성자는 서블릿이 WAS에 최초로 등록될 때 한 번만 실행(최초 요청시)
    	한 번 로딩된 후에는 재실행되지 않음
    	두 번째 URL 요청부터는 service() 메소드 실행
    	 */
        super();
        System.out.println(">>> 생성자 실행");
        
    }

	public void init(ServletConfig config) throws ServletException {
		//서블릿 객체가 처음 생성된 후 최초로 한 번 실행
		//초기화 작업등을 처리하는 용도로 사용
		System.out.println("> init() 실행");
	}

	public void destroy() {
		//서버에서 서블릿이 내려갈 때 destroy() 호출되고, 서버에서 소멸
		System.out.println("> destroy() 실행");
	}

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//service()메소드는 요청이 있을 때 마다 호출된다.
		System.out.println(">> service() 실행 =============");
		
		//요청정보를 확인해서 get, post 여부에 따라 분기 처리
		System.out.println("request.getMethod(): " + request.getMethod());
		if (request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get 방식 요청이 있을 때 호출되는 메소드
		//request : 요청정보 (클라이언트 정보)
		//response : 응답정보(요청에 따른 결과를 전달할 정보)
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> doGet() 실행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doPost() 실행");
		//doGet(request, response);
		
	}

}

















