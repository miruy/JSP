<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달예제</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
}

button {
	all: unset;
	background-color: steelblue;
	color: white;
	padding: 5px 20px;
	border-radius: 5px;
	cursor: pointer;
}
.modal{
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal__overlay{
	background-color: rgba(0,0,0,0.6);
	width: 100%;
	height:100%;
	position: absolute;
}

.modal__content{
	width: 10%;
	background-color: white;
	text-align: center;
	padding: 50px 100px;
	position: relative;
	border-radius: 10px;
	top: 0px;
	box-shadow: 0 10px 20px rgba(0,0,0,0.19);
}

h1{
	margin: 0;
}

.hidden{
	display: none;
}
</style>

</head>
<body>
	<button id="open">Open Modal</button>
	<div class="modal hidden">
		<div class="modal__overlay"></div>
		<div class="modal__content">
			<h1>모달창내용</h1>
			<button id="close">X</button>
		</div>
	</div>
	
	<script>
	
		//열기 버튼
		const openBtn = document.getElementById("open");
		
		//닫기 버튼
		const closeBtn = document.getElementById("close");
		
		//모달 내용
		const modal = document.querySelector(".modal");
		
		//모달 외부
		const overlay = document.querySelector(".modal__overlay");
		
		const openModal = () => {
			modal.classList.remove('hidden');
		}
		
		const closeModal = () => {
			modal.classList.add('hidden');
		}
		
		openBtn.addEventListener('click', openModal);
		closeBtn.addEventListener('click', closeModal);
		overlay.addEventListener('click', closeModal);
	
	</script>
	
</body>
</html>