<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
<script>

//수정실행 후 서버에서의 오류로 현재 페이지로 되돌아온 경우 오류 메시지를 출력
<c:if test="${errorMsg != null}">
	alert('${errorMsg}');
	location.href="/loginEx";
</c:if>

//가입폼 확인
function formCheck() {
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var name = document.getElementById('name');

	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (name.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div class="centerdiv">
		<h1>[ 개인정보수정 ]</h1>
		<form id="joinform" action="update" method="post" onsubmit="return formCheck();">
<!-- 			세션에 id값이 있으니, 굳이 히든값으로 설정해서 update 액션을 호출할 필요가 없다... -->
<%-- 		<input type="hidden" name="custid" value="${customer.custid}"> --%>
			<table>
				<tr>
					<th>ID</th>
					<td>
						${customer.custid}
<%-- 						<input type="text" name="custid" readonly="readonly" value="${customer.custid}" /> --%>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="password" id="password" placeholder="비밀번호 입력"
							value="${customer.password}" />
						<br>
						<input type="password" id="password2" placeholder="비밀번호 다시 입력"
							value="${customer.password}" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="name" placeholder="이름 입력"
							value="${customer.name}" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" id="email" placeholder="이메일  입력"
							value="${customer.email}" />
					</td>
				</tr>
				<tr>
					<th>고객구분</th>
					<td>
						<input type="radio" name="division" value="personal"
							<c:if test="${customer.division == 'personal'}">checked</c:if> />
						개인
						<c:if test="${customer.division != 'company'}">
							<input type="radio" name="division" value="company" />
						</c:if>
						<c:if test="${customer.division == 'company'}">
							<input type="radio" name="division" value="company" checked />
						</c:if>
						기업
					</td>
				</tr>
				<tr>
					<th>식별번호</th>
					<td>
						<input type="text" name="idno" placeholder="개인:주민번호 / 법인:사업자번호"
							value="${customer.idno}" />
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" placeholder="주소 입력"
							value="${customer.address}" style="width: 300px;" />
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="수정" />
		</form>
	</div>
</body>
</html>
