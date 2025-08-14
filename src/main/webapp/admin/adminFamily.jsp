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
	<a href="../">Go To Home </a>
	<a href="../about"> Go To About</a>
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
	<h2>가족 관리 페이지</h2>
	<h2>가족 리스트</h2>
	<table>
		<tr>
			<th>가족 정보</th>
			<!-- 
			<th>가족 이름</th>
			<th>가족 생년월일</th>
			<th>가족 구분(father,mother,child만)</th>
			<th>가족 사진(권장 크기:400x400)</th>
			<th>가족 프로필</th>
			<th>수정</th>
			<th>삭제</th>
			 -->
		</tr>
		<c:forEach items="${family }" var="person">
			<tr>
				<form action="./updatePerson" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="id" value="${person.id}">
					<input type="hidden" name="img" value="${person.img}">
					<td>
						가족 이름:<br/>
						<input type="text" name="name" value="${person.name }"/><br/>
						가족 생년월일:<br/>
						<input type="text" name="birth" value="${person.birth }"/><br/>
						가족 구분(father,mother,child만)<br/>
						<input type="text" name="role" value="${person.role }"/><br/>
						<span>현재 사진 파일: ${person.img }</span><br/>
						<input type="file" name="uploadFile" ><br/>
						가족 프로필:<br/>
						<textarea name="profile" rows="15" cols="25">${person.profile }</textarea>
						<br/>
						<input type="submit" value="수정">
				</form>
					<form action="./deletePerson" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="id" value="${person.id}">
						<input type="submit" value="삭제">
					</form>
					</td>
					<!-- 
					<td>
						<input type="text" name="name" value="${person.name }"/>
					</td>
					<td>
						<input type="text" name="name" value="${person.birth }"/>
					</td>
					<td>
						<input type="text" name="name" value="${person.role }"/>
					</td>
					<td>
						<span>현재 사진 파일: ${person.img }</span>
						<input type="file" name="uploadFile" >
					</td>
					<td>
						<textarea name="profile" rows="7" cols="50">${person.profile }</textarea>
					</td>
						<input type="submit" value="수정">
					<td>
					</td>
				</form>
				<td>
					<form action="./deletePerson" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="id" value="${person.id}">
						<input type="submit" value="삭제">
					</form>
				</td>
					 -->
			</tr>
		</c:forEach>
	</table>
	<h2>가족 추가</h2>
	<form action="./insertPerson" method="post" enctype="multipart/form-data">
		<fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<legend>가족 추가</legend>
			가족 이름 :<br/>
			<input type="text" name="name" /><br/>
			가족 생년월일 :<br/>
			<input type="text" name="birth" /><br/>
			가족 구분 :<br/>
			<input type="radio" name="role" value="child" checked/>Child 
			<input type="radio" name="role" value="father"/>Father 
			<input type="radio" name="role" value="mother"/>Mother
			<br/> 
			가족 사진(권장 크기:400x400) : <br/>
			<input type="file" name="uploadFile" />
			<br/>
			가족 프로필 :<br/>
			<textarea name="profile" rows="15" cols="25"></textarea><br/>
			
			<input type="submit" value="추가"/>
		</fieldset>
	</form>
</body>
</html>