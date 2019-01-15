<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
<script type="text/javascript">
//로그인 실패 후 서버에서의 오류로 인해 현재 페이지로 되돌아온 경우 오류 메시지를 출력
<c:if test="${errorMsg != null}">alert('${errorMsg}');</c:if>

	function formCheck(){
		var id = document.getElementById("id");
		var pw = document.getElementById("password");
		
		if (id.value == '' || pw.value == '') {
			alert("ID와 비밀번호를 입력하세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h1>[ 로그인 화면 ]</h1>
<form action="login" method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="id" id="id">
		</td>
	</tr>
	<tr>
		<td>Password</td>
		<td>
			<input type="password" name="password" id="password">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Login">
		</td>
	</tr>
</table>
</form>
</body>
</html>