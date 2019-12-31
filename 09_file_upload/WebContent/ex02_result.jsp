<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 여러개 파일 업로드 처리 --%>

<%
	request.setCharacterEncoding("UTF-8");

	//파일을 저장할 위치 지정(upload)
	ServletContext sc = this.getServletContext();
	String path = sc.getRealPath("/upload");
	System.out.println("진짜 파일의 경로 path : " + path);
	
	//MultipartRequest 객체 생성
	//MultipartRequest 사용해서 처리
	//MultipartRequest 기본 생성자 없음
	MultipartRequest mr = new MultipartRequest(
			request, 						//요청객체
			path, 							//실제 파일을 저장하기 위한 경로
			10 * 1024 * 1024, 				//업로드 파일의 최대용량(byte 단위, 10MB)
			"UTF-8", 						//파일의 인코딩 타입
			new DefaultFileRenamePolicy() 	//파일이름 중복시 새로운 이름 사용
			);
	
	//업로드 파일에 대한 처리(여러개)
%>