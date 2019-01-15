<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheck.jsp</title>
<script type="text/javascript">
	function formCheck(){
		var searchId = document.getElementById("searchId");
		if (searchId.value.length < 3) {
			alert("검색할 ID를 3자이상 입력해주세요.");
			searchId.focus();
			searchId.select();
			return false;
		}
		return true;
	}
	function idSelect(searchId) {
		opener.document.getElementById("custid").value = searchId;
		this.close();
	}
</script>
</head>
<body>
<h1> ID 체크 폼</h1>

<form action="idcheck" method="post" 
	onsubmit="return formCheck();">
ID : <input type="text" name="searchId" 
	id="searchId" maxlength="10" value="${searchId }">
<input type="submit" value="검색">
</form>
<br>
<!-- 검색 후에만 출력되는 부분으로 만드는 것이다. -->
<c:if test="${search }">
	<c:if test="${searchResult == null }">
		<p>${searchId } : 사용할 수 있는 ID입니다.</p>
		<p><input type="button" value="ID사용하기" onclick="idSelect('${searchId}')"></p>
	</c:if>
	<c:if test="${searchResult != null }">
		<p>${searchId } : 이미 사용중인 ID입니다.</p>
	</c:if>
</c:if>

</body>
</html>