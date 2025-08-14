<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("LF", "\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin</title>
	
	<!-- 부트스트랩 -->
	<link href="../resources/css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
	</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			    <span class="sr-only">Toggle navigation</span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			  </button>
			  <a class="navbar-brand"><span class="label label-primary">"${gall.title }" 갤러리 관리 페이지</span></a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../"><span class="label label-primary">Home</span></a></li>
					<li><a href="./adminGallery"><span class="label label-primary">AdminGallery</span></a></li>
					<li><a href="./adminGallery"><span class="label label-primary">갤러리 수정</span></a></li>
					<li><a href="./adminGallery"><span class="label label-primary">사진 추가</span></a></li>
			    </ul>
			  </div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
		</nav>

	<div class="container text-center">	
		<div class="page-header">
			<h3>갤러리 관리 페이지</h3>
			<h1>갤러리 제목: ${gall.title }</h1>
			<h3>갤러리 날짜: ${gall.day }</h3>
			<div class="row">
				<div class="col-sm-6">
					<div class="thumbnail">
						<h4>갤러리 메인 사진:</h4>
						<img width="300" src="../resources/images/${gall.mainImg }">
					</div>
				</div>
				<div class="col-sm-6">
					<h3>갤러리 내용:</h3>
					<h3>${fn:replace(gall.content,LF,'<br/>') }</h3>
				</div>
			</div>
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#updateGall">갤러리 수정</button>
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertPic">사진추가</button>
		</div>
		<h1>갤러리속 사진들</h1>
			<c:forEach items="${pics }" var="pic" varStatus="statu">
				<c:if test="${statu.index%3==0||statu.index==0 }">
					<div class="row">
				</c:if>
					<div class="col-sm-4">
						<div class="thumbnail">
							<img src="../resources/images/${pic.img }">
							<div class="caption">
						        <p>
						        	 <form method="post" enctype="multipart/form-data" action="./deletePic">
						        	 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        						<input type="hidden" name="picId" value="${pic.picId }" />
		        						<input type="hidden" name="galleryId" value="${gall.galleryId }" />
										 <button type="submit" class="btn btn-default">삭제</button>
						        	 </form>
						        </p>
					      	</div>
					    </div>
					</div>
				<c:if test="${statu.index%3==2||statu.index==2 }">
					</div>
				</c:if>
			</c:forEach>
	
	
	<!-- Modal updateGallery-->
	<div class="modal fade" id="updateGall" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">${gall.title } 갤러리 수정</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" enctype="multipart/form-data" action="./updateGallery">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	<input type="hidden" name="galleryId" value="${gall.galleryId }" />
	        	<input type="hidden" name="mainImg" value="${gall.mainImg }" />
			  <div class="form-group">
			    <label class="col-sm-2 control-label">제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="title" value="${gall.title }">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">날짜</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="day" value="${gall.day }">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputTitle" class="col-sm-2 control-label">현재 사진</label>
			    <div class="col-sm-10">
			      <p>${gall.mainImg }</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">사진 수정<br>(권장크기<br>800*533):</label>
			    <div class="col-sm-10">
			      <input type="file" name="uploadFile">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">내용</label>
			    <div class="col-sm-10">
			    	<textarea class="form-control" rows="7" name="content">${gall.content }</textarea>
			    </div>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" >Save changes</button>
		      </div>
			</form>
		</div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal insertPic-->
	<div class="modal fade" id="insertPic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">${gall.title } 갤러리 사진 추가</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" enctype="multipart/form-data" action="./insertPic">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	<input type="hidden" name="galleryId" value="${gall.galleryId }" />
			  <div class="form-group">
			    <label class="col-sm-2 control-label">사진 추가:</label>
			    <div class="col-sm-10">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			      <input type="file" name="uploadFiles">
			    </div>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" >사진 추가</button>
		      </div>
			</form>
		</div>
	    </div>
	  </div>
	</div>
	
	<!-- jQuery-->
    <script src="../resources/js/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>