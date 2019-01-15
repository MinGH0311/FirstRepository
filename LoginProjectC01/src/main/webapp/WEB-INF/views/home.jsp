<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>[ Login Project ]</h1>
	<c:if test="${loginId != null }">
	${loginId}(${loginName })님 로그인 중<br>
	</c:if>
	<ul>
		<c:if test="${loginId == null }">
			<li>
				<a href="join">회원가입</a>
			</li>
			<li>
				<a href="login">로그인</a>
			</li>
		</c:if>
		<c:if test="${loginId != null }">
			<li>
				<a href="logout">로그아웃</a>
			</li>
			<li>
				<a href="update">회원정보수정</a>
			</li>
		</c:if>
	</ul>

</body>
</html>
