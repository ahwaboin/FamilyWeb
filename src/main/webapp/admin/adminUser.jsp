<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/table.css">
</head>
<body>
	<a href="../">Go To Home</a>
	<h1>관리자 페이지입니다.</h1>
	<!-- csrt for log out-->
	<form action="../logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}" 
		value="${_csrf.token}" />
		<input type="submit" value="Log Out">
	</form>
	<ul>
		<li><a href="./adminUser">관리자 관리</a></li>
		<li><a href="./adminImg.jsp">배경이미지 관리</a></li>
		<li><a href="./adminFamily">가족 관리</a></li>
		<li><a href="./adminStory">스토리 관리</a></li>
		<li><a href="./adminGallery">갤러리 관리</a></li>
	</ul>
	<h2>관리자 관리 페이지</h2>
	<form action="./insertUser" method="post">
		<fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<legend>관리자 추가</legend>
			관리자 아이디 :<br/>
			<input type="text" name="username" /><br/>
			관리자 비밀번호 :<br/>
			<input type="text" name="password" /><br/>
			
			<input type="submit" value="관리자 추가"/>
		</fieldset>
	</form>
	<br>
	<h2>관리자 리스트</h2>
	<table>
		<tr>
			<th>관리자 ID</th>
			<th>비밀번호 수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${users }" var="user">
			<tr>
				<td>${user.username }</td>
				<td>
					<form action="./updateUser" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="username" value="${user.username}">
						<input type="text" name="password">
						<input type="submit" value="비밀번호 수정">
					</form>
					<!-- 
					<a href="./modifyDoctorPage?docId=${doctor.docId}">Modify</a>
					 -->
				</td>
				<td>
					<form action="./deleteUser" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="username" value="${user.username}">
						<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>