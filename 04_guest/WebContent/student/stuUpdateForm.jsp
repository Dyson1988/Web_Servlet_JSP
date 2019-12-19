<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<style>
	table { border-collapse: collapse; width: 800px; }
	th, td { border: 1px solid black; }
	
	h1,h2 { text-align: center; }
	table table { width: 60%; margin: auto;}
</style>
</head>
<body>

<table>
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" alt="로고">
			</a>
		</th>
		<th width="100px"><a href="stuList.jsp">조회</a></th>
		<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
		<th width="100px" bgcolor="orange"><a href="stuAdd.jsp">성적입력</a></th>
		<th width="100px"><a href="stuDel.jsp">데이터삭제</a></th>
	</tr>
	<tr>
		<td colspan="5" height="400">
		<center>
			<h2>성적입력(수정)</h2>	
			<form action="stuUpdate.jsp">
			<table>
				<tr>
					<th>학번</th>
					<td>
						<input type="number" name="idx" readonly
							value="<%=request.getParameter("idx") %>">
					</td>
				</tr>
				<tr>
					<th>국어</th>
					<td><input type="number" name="kor" min="0" max="100"></td>
				</tr>
				<tr>
					<th>영어</th>
					<td><input type="number" name="eng" min="0" max="100"></td>
				</tr>
				<tr>
					<th>수학</th>
					<td><input type="number" name="math" min="0" max="100"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="입력(수정)">
					</td>
				</tr>
			</table>
			</form>
		</center>
		</td>
	</tr>
</table>


<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>







