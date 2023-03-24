function checkForm(){
    if (!document.frmRipple.content.value) {
        alert("비밀번호를 입력하세요.");
        frmRipple.content.focus();
        return false;
    }
}