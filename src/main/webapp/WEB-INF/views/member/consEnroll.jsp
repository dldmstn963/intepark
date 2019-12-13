<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
	}
	
function idCheck(id){
	var idc= id.value;
	var tdid = document.getElementById("idcheck");
	var idc1 = idc.charAt(0);	
	var re = /^[a-zA-Z]+$/;
	var re2 = /^[a-zA-Z0-9]+$/; 

	if(!re2.test(idc)){
		id.value=idc.replace(/[^a-zA-Z0-9]/g,'');
	}else if(!re.test(idc1)){
		tdid.innerHTML="<p style='color:red; margin:0;'>아이디의 첫글자는 영문이어야 합니다.</p>";
 	}else if(idc.length <6){
		tdid.innerHTML="<p style='color:red; margin:0;'>아이디는 6글자 이상이여야 합니다.</p>";
 	}else{
 		tdid.innerHTML="<p style='color:green; margin:0;'>사용 가능한 아이디입니다. 중복체크를 해주세요.</p>";
 	}
	return false;
}

function pwdCheck(pwd){
	var pwdc= pwd.value;
	var tdpwd = document.getElementById("pwdcheck");

	var repwd1 = /[a-zA-Z]/; //영문이 들어갔는지
	var repwd2 = /[0-9]/; // 숫자들어갔는지
	var repwd3 = /[^a-zA-Z0-9]/; //특수문자 들어갔는지.

	if(pwdc.length<8){
		tdpwd.innerHTML="<p style='color:red; margin:0;'>암호는 8글자 이상이여야 합니다.</p>";
	}else if(!repwd1.test(pwdc)){	
		tdpwd.innerHTML="<p style='color:red; margin:0;'>암호에 영문이 반드시 들어가야합니다.</p>";
	}else if(!repwd2.test(pwdc)){
		tdpwd.innerHTML="<p style='color:red; margin:0;'>암호에 숫자가 반드시 들어가야합니다.</p>";
	}else if(!repwd3.test(pwdc)){
		tdpwd.innerHTML="<p style='color:red; margin:0;'>암호에 특수기호가 반드시 들어가야합니다.</p>";
	}else{
		tdpwd.innerHTML="<p style='color:green; margin:0;'>사용 가능한 비밀번호입니다.</p>";
	}
	return false;
}

function pwd2dCheck(pwda, pwdb){//비밀번호 확인
	var pwdc1 = pwda.value;
	var pwdc2 = pwdb.value;
	var td2pwd = document.getElementById("pwdcheck2");

	if(pwdc1!=pwdc2)
		td2pwd.innerHTML="<p style='color:red; margin:0;'>비밀번호가 일치하지 않습니다.</p>";
	else
		td2pwd.innerHTML="<p style='color:green; margin:0;'>비밀번호가 일치합니다.</p>";

	return false;
			
}

function dcheckId(){
	$.ajax({
		url : "userIdchk6.do",
		type : "post",
		data : { userid : $("#userId").val() },
		success : function(data){			
			if(data == "ok"){
				document.getElementById("idcheck");
				$("#idcheck").html("<p style='color:green; margin:0;'>사용 가능한 아이디입니다.</p>");
				$("#userPwd").focus();
			}else{
				$("#idcheck").html("<p style='color:red; margin:0;'>이미 존재하는 아이디입니다.</p>");
				$("#userId").select();
			}
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	return false;	//전송 안 됨.
}

</script>
</head>
<body>
<section>
<span><a href="main.do"><img src="/intepark/resources/img/favicon.ico" height="150" width="150"></a><br>
</span>
<H1>시공사 회원가입</H1>
<form action="insertUser6.do" method="post">
<table>
<tr><th>아이디* : </th><td><input type="text" id="consId" name="consid" onkeyup="idCheck(this)" maxlength="12" required></td><td><input type="button" onclick="dcheckId()" value="아이디 중복체크"></td></tr>
<tr><td colspan="3" id="idcheck"></td></tr>
<tr><th>비밀번호* : </th><td><input type="password" id="consPwd" name="conspwd" onkeyup="pwdCheck(this)" maxlength="15" id="pwd" required></td></tr>
<tr><td colspan="3" id="pwdcheck"></td></tr>
<tr><th>비밀번호 확인* : </th><td><input type="password" onkeyup="pwd2dCheck(consPwd,this)" maxlength="15" required></td></tr>
<tr><td colspan="3" id="pwdcheck2"></td></tr>
<tr><th>이름* : </th><td><input type="text" name="consname"></td></tr>
<tr><th>전화번호* : </th><td><input type="tel" name="phone"></td></tr>
<tr><th>이메일* : </th><td><input type="email" name="email"></td></tr>
<tr><th>상호명* : </th><td><input type="text" name="companyname"></td></tr>
<tr><th>A/S기간* : </th><td><input type="radio" name="asdate"></td></tr>
<tr><th>경력* : </th><td><input type="radio" name="career"></td></tr>
<tr><th>시공 분야* : </th><td><input type="text" name="consarea"></td></tr>
<tr><th>한줄 소개* : </th><td><input type="text" name="consintroduction"></td></tr>
<tr><th>프로필사진 : </th><td><input type="file" name="profileoriginalimg"></td></tr>
<tr><th>사업자등록증* : </th><td><input type="file" name="blicenceoriginalimg"></td></tr>
<tr><th>주소 :</th></tr>
</table>
<input type="text" id="sample6_postcode" placeholder="우편번호" name="address1" readonly>
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" name="address2"readonly><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address3" required>
<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="address4" readonly>
<br>
<input type="submit" value="가입하기">
<input type="reset" value="초기화">
</form>
</section>
</body>
</html>