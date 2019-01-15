<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateComplete.jsp</title>
</head>
<body>
	<h1>개인정보수정 완료</h1>
	<table>
		<tr>
			<th>ID</th>
			<td>
				${customer.custid}
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				${customer.password}
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				${customer.name}
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				${customer.email}
			</td>
		</tr>
		<tr>
			<th>고객구분</th>
			<td>
				<c:if test="${customer.division == 'personal'}">
					개인
				</c:if>
				<c:if test="${customer.division == 'company'}">
					기업
				</c:if>
			</td>
		</tr>
		<tr>
			<th>식별번호</th>
			<td>
				${customer.idno}
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				${customer.address}
			</td>
		</tr>
	</table>
<p><a href="./">첫페이지로 돌아가기</a></p>
</body>
</html>