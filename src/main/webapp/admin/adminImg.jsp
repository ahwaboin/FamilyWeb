<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/table.css">
<style type="text/css">
<style>
div.gallery {
    border: 1px solid #ccc;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
    padding: 0 6px;
    float: left;
    width: 24.99999%;
}

@media only screen and (max-width: 700px){
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}

@media only screen and (max-width: 500px){
    .responsive {
        width: 100%;
    }
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}
</style>
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
	<h2>배경이미지 관리 페이지</h2>
	
	<div class="responsive">
	  <div class="gallery">
	    <img src="../resources/backImg/index.jpg" width="300" height="200">
	    <div class="desc">
	    	Home 배경이미지
	    	<form action="./updateImg" method="post" enctype="multipart/form-data">
	    		<input type="hidden" name="${_csrf.parameterName}" 
					value="${_csrf.token}" />
				<input type="hidden" name="name" value="index.jpg" />
				<input type="file" name="uploadFile" />
				<input type="submit" value="사진바꾸기" />
			</form>
	    </div>
	  </div>
	</div>
	<div class="responsive">
	  <div class="gallery">
	    <img src="../resources/backImg/about.jpg" width="300" height="200">
	    <div class="desc">
	    	About 배경이미지
	    	<form action="./updateImg" method="post" enctype="multipart/form-data">
	    		<input type="hidden" name="${_csrf.parameterName}" 
					value="${_csrf.token}" />
				<input type="hidden" name="name" value="about.jpg" />
				<input type="file" name="uploadFile" />
				<input type="submit" value="사진바꾸기" />
			</form>
	    </div>
	  </div>
	  
	</div>
	<div class="responsive">
	  <div class="gallery">
	    <img src="../resources/backImg/story.jpg" width="300" height="200">
	    <div class="desc">
	    	Story 배경이미지
	    	<form action="./updateImg" method="post" enctype="multipart/form-data">
	    		<input type="hidden" name="${_csrf.parameterName}" 
					value="${_csrf.token}" />
				<input type="hidden" name="name" value="story.jpg" />
				<input type="file" name="uploadFile" />
				<input type="submit" value="사진바꾸기" />
			</form>
	    </div>
	  </div>
	</div>
	<div class="responsive">
	  <div class="gallery">
	    <img src="../resources/backImg/gallery.jpg" width="300" height="200">
	    <div class="desc">
	    	Gallery 배경이미지
	    	<form action="./updateImg" method="post" enctype="multipart/form-data">
	    		<input type="hidden" name="${_csrf.parameterName}" 
					value="${_csrf.token}" />
				<input type="hidden" name="name" value="gallery.jpg" />
				<input type="file" name="uploadFile" />
				<input type="submit" value="사진바꾸기" />
			</form>
	    </div>
	  </div>
	</div>
	
</body>
</html>