package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지를 위한 문자타입 처리(UTF-8처리)
		response.setContentType("text/html;charset=UTF-8");
		
		//(실습) 전달바은 이름, 국어, 영어, 수학 점수를 받아서 성적처리
		//1. p태그를 사용해서 결과 출력
		//2. 테이블 사용해서 결과 출력
		/* 응답형식
		----------
		 성적처리 결과
		 이름 : 홍길동
		 국어 : 90
		 영어 : 80
		 수학 : 70
		----------
		 총점 : 240
		 평균 : 80
		----------
		 */
		
		//전달받은 파라미터 값 추출
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		//응답처리
		PrintWriter out = response.getWriter();
		out.write("<fieldset>");
		out.write("<legend>성적처리 결과</legend>");
		out.write("==============");
		form("이름", name, out, 1);
		form("국어", kor, out, 1);
		form("영어", eng, out, 1);
		form("수학", math, out, 1);
		out.write("==============");
		sumAvg(kor, eng, math, out, 1);
		out.write("==============");
		out.write("</fieldset>");
		
		out.write("<hr>");
		
		out.write("<table border>");
		form("이름", name, out, 2);
		form("국어", kor, out, 2);
		form("영어", eng, out, 2);
		form("수학", math, out, 2);
		sumAvg(kor, eng, math, out, 2);	
		out.write("</table>");
	}
	
	public void form(String str, String name, PrintWriter out, int select) {
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>" + str +": " + name +"</p>");
			} else {
				out.write("<tr><th>" + str + "</th>");
				out.write("<td>"+ name +"</td></tr>");
			}
		}
	}
	
	public void form(String str, int score, PrintWriter out, int select) {
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>" + str +": " + score +"</p>");
			} else {
				out.write("<tr><th>" + str + "</th>");
				out.write("<td>"+ score +"</td></tr>");
			}
		}
	}

	public void sumAvg(int a, int b, int c, PrintWriter out, int select) {
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>총점 : " + (a+b+c) +"</p>");
				out.write("<p>평균 : " + ((a+b+c) / 3) +"</p>");
			} else {
				out.write("<tr><th>총점</th>");
				out.write("<td>"+ (a+b+c) +"</td></tr>");
				out.write("<tr><th>평균</th>");
				out.write("<td>"+ ((a+b+c) / 3) +"</td></tr>");
			}
		}
	}	
}
