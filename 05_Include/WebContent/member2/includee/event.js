	function sel_all(frm){
		frm.action = "selectAll.jsp"; //전체검색
		frm.submit();
	}
	function sel_one(frm) {
		frm.action = "selectOneID.jsp";
		frm.submit();
	}
	function add_go(frm){
		if (frm.id.value.trim() == ""){
			alert("아이디(ID)는 필수 입력항목 입니다.\n입력하세요")
			frm.id.value = ""; //ID값 삭제 처리
			frm.id.focus();
			return false;
		}
		frm.action = "insertMember.jsp";
		frm.submit();
	}
	function del_go(frm){
		if (frm.id.value.trim() == ""){
			alert("삭제할 아이디(ID)입력하세요")
			frm.id.value = ""; //ID값 삭제 처리
			frm.id.focus();
			return false;
		}
		frm.action = "deleteMember.jsp";
		frm.submit();
	}