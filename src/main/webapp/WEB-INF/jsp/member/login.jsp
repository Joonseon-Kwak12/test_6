<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>test_6</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
	<div class="h-[100px]" id="blank"></div>

	<div class="m-auto p-6 w-[300px] bg-[#3B5998] rounded text-center">
		<div class="text-center text-xl text-white mb-6">로그인해주세요</div>
		<form method="post" action="login" class="flex flex-col items-center gap-3">
			<input type="text" placeholder="아이디를 입력해주세요." name="loginId" class="rounded w-full" />
			<input type="text" placeholder="비밀번호를 입력해주세요." name="loginPw" class="rounded w-full" />
			<div>
				<button type="submit" class="w-24 h-6 bg-white text-sm rounded">로그인</button>
				<button type="button" onclick="history.back();" class="w-24 h-6 bg-white text-sm rounded">뒤로 가기</button>
			</div>
		</form>
	</div>
</body>
</html>