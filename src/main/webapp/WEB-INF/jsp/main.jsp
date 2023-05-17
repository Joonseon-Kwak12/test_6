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

	<c:choose>
		<c:when test="${loginedMember eq null }">
			<div class="m-auto w-[300px] text-sm">현재 로그인 회원: 손님</div>
		</c:when>
		<c:when test="${loginedMember ne null }">
			<div class="m-auto w-[300px] text-sm">현재 로그인 회원: ${loginedMember.nickname }</div>
		</c:when>
	</c:choose>
	<section class="m-auto p-6 w-[300px] bg-[#3B5998] rounded">
		<article class="grid grid-cols-2 h-[100px] gap-5">
			<div class="bg-white text-sm text-center align-middle rounded">
				<div class="mt-[50px] -translate-y-1/2">
					<c:choose>
						<c:when test="${loginedMember eq null }">
								<a href="/login">로그인</a>
						</c:when>
						<c:when test="${loginedMember ne null }">
								<a href="/logout">로그아웃</a>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="bg-white text-sm text-center rounded">
				<div class="mt-[50px] -translate-y-1/2">
					<a href="/join">회원가입</a>
				</div>
			</div>
		</article>
	</section>
	<div class="m-auto p-1 w-[300px] text-sm">
		<a href="/logout">로그아웃</a>
	</div>
</body>
</html>