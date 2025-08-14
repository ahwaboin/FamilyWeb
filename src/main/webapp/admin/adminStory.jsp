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
	<span>
		<a href="../">Go To Home </a><br/>
	</span>
	<span>
		<a href="../story"> Go To Story</a>
	</span>
	
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
	
	<h2>스토리 관리 페이지</h2>
	
	<h2>스토리 추가</h2>
	<form action="./insertStory" method="post" enctype="multipart/form-data">
		<fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<legend>스토리 추가</legend>
			스토리 제목 :<br/>
			<input type="text" name="title" /><br/>
			스토리 날짜 :<br/>
			<input type="text" name="day" /><br/>
			스토리 사진(권장 크기:400x400) : <br/>
			<input type="file" name="uploadFile" />
			<br/>
			스토리 내용 :<br/>
			<textarea name="content" rows="15" cols="25"></textarea><br/>
			
			<input type="submit" value="추가"/>
		</fieldset>
	</form>
	
	<h2>스토리 리스트</h2>
	<table>
		<tr>
			<th>스토리 정보</th>
		</tr>
		<c:forEach items="${storys }" var="story">
			<tr>
				<form action="./updateStory" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="id" value="${story.id}">
					<input type="hidden" name="img" value="${story.img}">
					<td>
						스토리 제목:<br/>
						<input type="text" name="title" value="${story.title }"/><br/>
						스토리 날짜:<br/>
						<input type="text" name="day" value="${story.day }"/><br/>
						<span>현재 사진 파일: ${story.img }</span><br/>
						<input type="file" name="uploadFile" ><br/>
						스토리 내용:<br/>
						<textarea name="content" rows="15" cols="25">${story.content }</textarea>
						<br/>
						<input type="submit" value="수정">
				</form>
					<form action="./deleteStory" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="id" value="${story.id}">
						<input type="submit" value="삭제">
					</form>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>