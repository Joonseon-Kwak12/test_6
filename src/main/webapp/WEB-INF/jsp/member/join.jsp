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
	<section class="m-auto p-4 w-[450px] bg-[#3B5998] rounded text-center">
		<div class="text-center text-3xl text-white mb-6">회원 가입</div>
		<form method="POST" action="join" onsubmit="submitJoinForm(this); return false;">
			<div class="grid grid-cols-[130px_2fr] text-left">
				<div class="text-white">아이디</div>
				<input name="loginId" id="input-loginId" class="rounded" placeholder="아이디를 입력해주세요" />
				<div class="h-6 col-start-2 text-white text-sm" id="loginIdDupMsg"></div>
				<div class="text-white">비밀번호</div>
				<input name="loginPw" id="input-loginPw" class="rounded" placeholder="비밀번호를 입력해주세요" />
				<div class="h-6 col-start-2 text-white text-sm" id="loginPwValidationMsg"></div>
				<div class="text-white">비밀번호 확인</div>
				<input name="loginPwConfirm" class="rounded" placeholder="비밀번호 확인을 입력해주세요" />
				<div class="h-6 col-span-2"></div>
				<div class="text-white">이름</div>
				<input name="name" class="rounded" placeholder="이름을 입력해주세요" />
				<div class="h-6 col-span-2"></div>
				<div class="text-white">닉네임</div>
				<input name="nickname" class="rounded" placeholder="닉네임을 입력해주세요" />
				<div class="h-6 col-span-2"></div>
				<div class="text-white">전화번호</div>
				<input name="cellphoneNum" class="rounded" placeholder="전화번호를 입력해주세요" />
				<div class="h-6 col-span-2"></div>
				<div class="text-white">이메일</div>
				<input name="email" id="input-email" class="rounded" placeholder="이메일을 입력해주세요" />
				<div class="h-6 col-start-2 text-white text-sm" id="emailDupMsg"></div>
			</div>
			<div class="flex justify-center mt-6 text-[#3B5998] gap-8">
				<button class="bg-white rounded py-1 px-3" type="submit" value="회원가입">회원가입</button>
				<button class="bg-white rounded py-1 px-3" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</form>

	</section>

	<script>
		let isFormSubmitted = false;
		let validLoginId = "";
		let validEmail = "";

		function submitJoinForm(form) {
			if (isFormSubmitted) {
				alert('처리중입니다');
				return;
			}
			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value == 0) {
				alert('아이디를 입력해주세요');
				return;
			}
			form.loginPw.value = form.loginPw.value.trim();
			if (form.loginPw.value == 0) {
				alert('비밀번호를 입력해주세요');
				return;
			}
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value == 0) {
				alert('비밀번호 확인을 입력해주세요');
				return;
			}
			if (form.loginPwConfirm.value != form.loginPw.value) {
				alert('비밀번호와 비밀번호 확인이 일치하지 않습니다');
				form.loginPw.focus();
				return;
			}
			form.name.value = form.name.value.trim();
			if (form.name.value == 0) {
				alert('이름을 입력해주세요');
				return;
			}
			form.nickname.value = form.nickname.value.trim();
			if (form.nickname.value == 0) {
				alert('닉네임을 입력해주세요');
				return;
			}
			form.email.value = form.email.value.trim();
			if (form.email.value == 0) {
				alert('이메일을 입력해주세요');
				return;
			}
			form.cellphoneNum.value = form.cellphoneNum.value.trim();
			if (form.cellphoneNum.value == 0) {
				alert('전화번호를 입력해주세요');
				return;
			}
			if (validLoginId = "") {
				alert('유효하지 않은 아이디입니다.');
				return;
			}
			if (validEmail = "") {
				alert('유효하지 않은 메일 주소입니다.');
				retrun;
			}
			
			isFormSubmitted = true;
			
			form.submit();
		}

		async function checkDupLoginId(loginId) {
			validLoginId = "";

			let response = await fetch('/checkDupLoginId?loginId=' + loginId);
			const loginIdDupMsg = document.querySelector('#loginIdDupMsg');
			loginIdDupMsg.replaceChildren();
			
			if (loginId === "" || loginId === undefined) {
				let msg = document.createElement("div");
				msg.innerText = "아이디를 입력해주세요.";
				loginIdDupMsg.append(msg);
				msg.classList.add("text-red-300");
				validLoginId = "";
				return;
			}
			
			if (loginId.trim().length < 5) {
				let msg = document.createElement("div");
				msg.innerText = "아이디는 5글자 이상이어야 합니다.";
				loginIdDupMsg.append(msg);
				msg.classList.add("text-red-300");
				validLoginId = "";
				return;
			}

			if (response.ok) {
				let result = await response.text();
				
				if (result === "Y") {
					// let msg = document.createElement("div").innerText = "사용 가능한 아이디입니다."; // 할당 연산자 = 두 번 쓰인 게 매우 이상해 보인다.
					// document.querySelector('#loginIdDupMsg').append(msg);
					let msg = document.createElement("div");
					msg.innerText = "사용 가능한 아이디입니다.";
					loginIdDupMsg.append(msg);
					msg.classList.add("text-lime-400");
					validLoginId = loginId
				} else if (result === "N") {
					let msg = document.createElement("div");
					msg.innerText = "이미 사용 중인 아이디입니다.";
					loginIdDupMsg.append(msg);
					msg.classList.add("text-red-300");
					validLoginId = ""
				}
			// respones.ok인 경우 끝
			} else {
				alert("HTTP-Error: " + response.status);
			}
		}

		function checkValidationLoginPw(loginPw) {
			
			const loginPwValidationMsg = document.querySelector('#loginPwValidationMsg');
			loginPwValidationMsg.replaceChildren();
			
			if (loginPw === "" || loginPw === undefined) {
				let msg = document.createElement("div");
				msg.innerText = "비밀번호를 입력해주세요.";
				loginPwValidationMsg.append(msg);
				msg.classList.add("text-red-300");
				return;
			}
			
			if (loginPw.trim().length < 5) {
				let msg = document.createElement("div");
				msg.innerText = "비밀번호는 5글자 이상이어야 합니다.";
				loginPwValidationMsg.append(msg);
				msg.classList.add("text-red-300");
				return;
			}
			
			if (loginPw.indexOf(' ') >= 0) {
				let msg = document.createElement("div");
				msg.innerText = "비밀번호에는 공백이 포함될 수 없습니다.";
				loginPwValidationMsg.append(msg);
				msg.classList.add("text-red-300");
				return;
			}
		}
		
		async function checkDupEmail(email) {
			validEmail = "";
			
			let response = await fetch('/checkDupEmail?email=' + email);
			const emailDupMsg = document.querySelector('#emailDupMsg');
			emailDupMsg.replaceChildren();
			
			if (email === "" || email === undefined) {
				let msg = document.createElement("div");
				msg.innerText = "메일 주소를 입력해주세요.";
				emailDupMsg.append(msg);
				msg.classList.add("text-red-300");
				validEmail = "";
				return;
			}
			
			if (email.indexOf('@') === -1) {
				let msg = document.createElement("div");
				msg.innerText = "이메일 형식이 바르지 않습니다.";
				emailDupMsg.append(msg);
				msg.classList.add("text-red-300");
				validEmail = "";
				return;
			}

			if (response.ok) {
				let result = await response.text();
				
				if (result === "Y") {
					let msg = document.createElement("div");
					msg.innerText = "사용 가능한 메일 주소입니다.";
					emailDupMsg.append(msg);
					msg.classList.add("text-lime-400");
					validEmail = email
				} else if (result === "N") {
					let msg = document.createElement("div");
					msg.innerText = "이미 사용 중인 메일 주소입니다.";
					emailDupMsg.append(msg);
					msg.classList.add("text-red-300");
					validEmail = ""
				}
			// respones.ok인 경우 끝
			} else {
				alert("HTTP-Error: " + response.status);
			}
		}
		
		const inputLoginId = document.querySelector('#input-loginId');
		inputLoginId.onblur = function() {
			checkDupLoginId(inputLoginId.value);
		};
		// inputLoginId.onblur = checkDupLoginId(inputLoginId.value); // 이렇게 적으면 처음 시작할 때 딱 한 번만 실행됨
		
		const inputLoginPw = document.querySelector('#input-loginPw');
		inputLoginPw.onkeyup = function() {
			checkValidationLoginPw(inputLoginPw.value);
		};
		
		const inputEmail = document.querySelector('#input-email');
		inputEmail.onblur = function() {
			checkDupEmail(inputEmail.value);
		};
	</script>


</body>
</html>