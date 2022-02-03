function writeSave(){
	if(document.writeForm.writer.value == ""){
		alert("작성자를 입력하세요.");
		document.writeForm.writer.focus();
		return false;
	}
	
	if(document.writeForm.content.vlaue == ""){
		alert("내용을 입력하세요.");
		document.writeForm.content.focus();
		return false;	
	}
	
	if(document.writeForm.pass.vlaue == ""){
		alert("비밀번호를 입력하세요.");
		document.writeForm.pass.focus();
		return false;	
	}
}