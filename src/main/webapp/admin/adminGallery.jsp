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
	<br/>
	<a href="../gallery">Go To Gallery</a>
	
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
	<h2>갤러리 관리 페이지</h2>
	
	<h2>갤러리 추가</h2>
		<form action="./insertGallery" method="post" enctype="multipart/form-data">
			<fieldset>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<legend>갤러리 추가</legend>
				갤러리 제목 :<br/>
				<input type="text" name="title" /><br/>
				갤러리 날짜 :<br/>
				<input type="text" name="day" /><br/>
				갤러리 메인 이미지(권장크기:800X533) :<br/>
				<input type="file" name="uploadFile"><br/>
				갤러리 내용 :<br/>
				<textarea name="content" rows="7" cols="25"></textarea><br/>
				
				<input type="submit" value="갤러리 추가"/>
			</fieldset>
		</form>
		
	<h2>갤러리 리스트</h2>
	<table>
		<tr>
			<th>갤러리 제목</th>
			<th>갤러리 수정</th>
			<th>갤러리 삭제</th>
		</tr>
		<c:forEach items="${gallery }" var="gall">
			<tr>
				<td>${gall.title }</td>
				<td>
					<form action="./updateGalleryPage" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="galleryId" value="${gall.galleryId}">
						<input type="hidden" name="title" value="${gall.title}">
						<input type="hidden" name="content" value="${gall.content}">
						<input type="hidden" name="day" value="${gall.day}">
						<input type="hidden" name="mainImg" value="${gall.mainImg}">
						<input type="submit" value="수정">
					</form>
				</td>
				<td>
					<form action="./deleteGallery" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="galleryId" value="${gall.galleryId}">
						<input type="hidden" name="mainImg" value="${gall.mainImg}">
						<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>