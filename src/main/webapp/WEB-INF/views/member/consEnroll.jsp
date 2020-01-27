<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../common/jscsspath.jsp"%>
<style type="text/css">
#holder {
	border: 2px dashed #ccc;
	width: 150px;
	height: 150px;
}

#holder.hover {
	border: 5px dashed #333;
}
</style>
<script type="text/javascript">
	window.onload = function() { //파일첨부 시작
		var holder = document.getElementById('holder'); 
		state = document.getElementById('status');
		proimg = document.getElementById('proimg');
		proimgname = document.getElementById('proimgname');

		if (typeof window.FileReader === 'undefined') {
			state.className = 'no6';
		} else {
			state.className = 'ok6';
			state.innerHTML = '<br><br>프로필<br>사진을 올려주세요';
		}

		holder.ondragover = function() {
			this.className = 'hover';
			return false;
		};
		holder.ondragend = function() {
			this.className = '';
			return false;
		};
		holder.ondrop = function(e) {
			this.className = '';
			e.preventDefault();

			var file = e.dataTransfer.files[0], reader = new FileReader();
			reader.readAsDataURL(file);
	            var fileNameExtensionIndex = file.name.lastIndexOf('.') + 1;
	            var fileNameExtension = file.name.toLowerCase().substring(fileNameExtensionIndex, file.name.length);
	            if (!((fileNameExtension === 'jpg')
	                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
	                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
	                return false;
	            }
			reader.onload = function(event) {
				proimg.style.display = "";
				proimg.src = event.target.result;
				state.style.display = "none";
				proimgname.innerText = file.name;
				
				//폼데이터생성후 파일객체넣기
				var formData = new FormData();
				formData.append("file",file);
				//이미지변경시 rename삭제를위해 .. 
				var rename = document.getElementById("proRe").value;
				formData.append("rename",rename);
				//폼의 oriname에 값저자..
				var filename= file.name;
				 document.getElementById("proOri").value = filename;

                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : 'conProfileImgUpload.do',
                    data : formData,
                    success : function(data) {
                            document.getElementById("proRe").value=data;
            			},	//seccess끝
            			error: function(request, status, errorData){
            				console.log("error code : " + request.status
            						+ "\Message : " + request.responseText
            						+"\Error : " + errorData);
            			}
                });	//ajax 끝
				
			};
			
			return false;
		};

	}//파일첨부 끝

	
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.consSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.consSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
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

						document.getElementById("sample6_detailAddress").readOnly =false;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	function idCheck(id) {
		var idc = id.value;
		var tdid = document.getElementById("idcheck");
		var idc1 = idc.charAt(0);
		var re = /^[a-zA-Z]+$/;
		var re2 = /^[a-zA-Z0-9]+$/;

		if (!re2.test(idc)) {
			id.value = idc.replace(/[^a-zA-Z0-9]/g, '');
		} else if (!re.test(idc1)) {
			tdid.innerHTML = "<p style='color:red; margin:0;'>아이디의 첫글자는 영문이어야 합니다.</p>";
		} else if (idc.length < 6) {
			tdid.innerHTML = "<p style='color:red; margin:0;'>아이디는 6글자 이상이여야 합니다.</p>";
		} else {
			tdid.innerHTML = "<p style='color:blue; margin:0;'>아이디 중복체크를 해주세요.</p>";
		}
		return false;
	}

	function pwdCheck(pwd) {
		var pwdc = pwd.value;
		var tdpwd = document.getElementById("pwdcheck");

		var repwd1 = /[a-zA-Z]/; //영문이 들어갔는지
		var repwd2 = /[0-9]/; // 숫자들어갔는지
		var repwd3 = /[^a-zA-Z0-9]/; //특수문자 들어갔는지.

		if (pwdc.length < 8) {
			tdpwd.innerHTML = "<p style='color:red; margin:0;'>암호는 8글자 이상이여야 합니다.</p>";
		} else if (!repwd1.test(pwdc)) {
			tdpwd.innerHTML = "<p style='color:red; margin:0;'>암호에 영문이 반드시 들어가야합니다.</p>";
		} else if (!repwd2.test(pwdc)) {
			tdpwd.innerHTML = "<p style='color:red; margin:0;'>암호에 숫자가 반드시 들어가야합니다.</p>";
		} else if (!repwd3.test(pwdc)) {
			tdpwd.innerHTML = "<p style='color:red; margin:0;'>암호에 특수기호가 반드시 들어가야합니다.</p>";
		} else {
			tdpwd.innerHTML = "<p style='color:green; margin:0;'>사용 가능한 비밀번호입니다.</p>";
		}
		pwd2dCheck(pwd,document.getElementById("consPwd2"));
		return false;
	}

	function pwd2dCheck(pwda, pwdb) {//비밀번호 확인
		var pwdc1 = pwda.value;
		var pwdc2 = pwdb.value;
		var td2pwd = document.getElementById("pwdcheck2");

		if (pwdc1 != pwdc2)
			td2pwd.innerHTML = "<p style='color:red; margin:0;'>비밀번호가 일치하지 않습니다.</p>";
		else
			td2pwd.innerHTML = "<p style='color:green; margin:0;'>비밀번호가 일치합니다.</p>";

		return false;

	}

	function nameCheck(uName) {
		var uname = uName.value;
		var consName = document.getElementById("nameCheck");
		var pattern = /^[가-힣]{2,5}$/;

		if (!pattern.test(uname))
			consName.innerHTML = "<p style='color:red; margin:0;'>2~5글자의 한글만 가능합니다.</p>";
		else
			consName.innerHTML = "<p style='color:green; margin:0;'>사용 가능한 이름입니다.</p>";

		return false;
	}

	function dcheckId() {
		var uid = document.getElementById("consId").value;
		var uidcheck = document.getElementById("idcheck").firstChild.innerText;
		if (uid.length == 0 || uidcheck.substr(0, 4) != "아이디 ")
			return false;
		$
				.ajax({
					url : "idchk6.do",
					type : "post",
					data : {
						logid : $("#consId").val()
					},
					success : function(data) {
						if (data == "ok") {
							$("#idcheck")
									.html(
											"<p style='color:green; margin:0;'>사용 가능한 아이디입니다.</p>");
							$("#consPwd").focus();
						} else {
							$("#idcheck")
									.html(
											"<p style='color:red; margin:0;'>이미 존재하는 아이디입니다.</p>");
							$("#consId").select();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
		return false; //전송 안 됨.
	}

	function dcheckEmail() {
		var uemail = document.getElementById("uemail").value;
		if (uemail.length == 0)
			return false;
		$
				.ajax({
					url : "emailChk6.do",
					type : "post",
					data : {
						logemail : $('#uemail').val()
					},
					success : function(data) {
						if (data == "ok") {
							$("#emailcheck")
									.html(
											"<p style='color:green; margin:0;'>사용 가능한 이메일입니다.</p>");
						} else {
							$("#emailcheck")
									.html(
											"<p style='color:red; margin:0;'>이미 사용중인 이메일입니다.</p>");
							$("#ueamil").select();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
		return false;
	}

	function telCheck(event, tel) {
		var utel = tel.value;
		var code = event.keyCode;
		var pattern = /^[\d\-]{12,13}$/;
		if (code == 8 || code == 46) {
			telcheck.innerHTML = "<p style='color:red; margin:0;'>11자리의 숫자만 가능합니다</p>";
			return false;
		}

		if (!pattern.test(utel))
			telcheck.innerHTML = "<p style='color:red; margin:0;'>11자리의 숫자만 가능합니다</p>";
		else
			telcheck.innerHTML = "<p style='color:green; margin:0;'>사용 가능한 번호입니다.</p>";

		if (utel.length == 3)
			tel.value = utel + '-';
		if (utel.length == 8)
			tel.value = utel + '-';

		return false;
	}

	function eCheck(uemail) {
		var uEmail = uemail.value;
		var pattern = /^[\w]{2,}@[\w]+(\.[\w-]+){1,3}$/;
		if (!pattern.test(uEmail))
			emailcheck.innerHTML = "<p style='color:red; margin:0;'>이메일 형식에 맞지 않습니다.</p>";
		else
			emailcheck.innerHTML = "<p style='color:green; margin:0;'>중복 체크해주세요</p>";
		return false;
	}

	function countck(ck) {
		var chkbox = document.getElementsByName("consarea");
		if ($('input:checkbox[name=consarea]:checked').length == 0) {
			alert("1개 이상 체크하셔야 합니다.");
			chkbox[0].checked = true;
			return false;
		}
		var chkCnt = 0;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chkCnt++;
			}
		}
		if (chkCnt > 5) {
			alert("5개까지 체크 할 수 있습니다.");
			ck.checked = false;
			return false;
		}
	}

	function textareaMaxlenth(obj) {
		if (obj.value.length > 150) {
			alert("150글자 이상 작성하실수 없습니다.");
			obj.value = obj.value.substring(0, 150);
		}
	}

	function enrollCheck() {
		var uid = document.getElementById("idcheck").firstChild.innerText;
		var upwd = document.getElementById("pwdcheck").firstChild.innerText;
		var upwd2 = document.getElementById("pwdcheck2").firstChild.innerText;
		var uname = document.getElementById("nameCheck").firstChild.innerText;
		var utel = document.getElementById("telcheck").firstChild.innerText;
		var uemail = document.getElementById("emailcheck").firstChild.innerText;

		var address = document.getElementById("sample6_postcode").value;
		var detailaddress = document.getElementById("sample6_detailAddress").value;
		var proimg = document.getElementById("proOri").value;
		
		if(proimg=="x"){
			alert("이미지를 올려주세요");
			return false;
		}
		if(address ==''){
           alert("주소를 입력해 주세요");
           return false;
		}
		if (address != '' && detailaddress == '') {
			alert("상세주소를 입력해주세요");
			return false;
		}

		if (uid != null && uid.substr(0, 6) != "사용 가능한") {
			document.getElementById("consId").focus();
			return false;
		} else if (upwd != null && upwd.substr(0, 6) != "사용 가능한") {
			document.getElementById("consPwd").focus();
			return false;
		} else if (upwd2 != null && upwd2.substr(0, 9) != "비밀번호가 일치합") {
			document.getElementById("consPwd2").focus();
			return false;
		} else if (uname != null && uname.substr(0, 6) != "사용 가능한") {
			document.getElementById("consName").focus();
			return false;
		} else if (utel != null && utel.substr(0, 6) != "사용 가능한") {
			document.getElementById("consPhone").focus();
			return false;
		} else if (uemail != null && uemail.substr(0, 6) != "사용 가능한") {
			document.getElementById("uemail").focus();
			return false;
		}

		return true;
	}

	function resetForm() {
		document.getElementById("consForm").reset();
		document.getElementById("idcheck").innerHTML = "";
		document.getElementById("pwdcheck").innerHTML = "";
		document.getElementById("pwdcheck2").innerHTML = "";
		document.getElementById("nameCheck").innerHTML = "";
		document.getElementById("telcheck").innerHTML = "";
		document.getElementById("emailcheck").innerHTML = "";
		document.getElementById("sample6_detailAddress").readOnly =true;
	}
</script>
</head>
<body>
	<div align="center">
		<div style="text-align: center">
			<a href="main.do"><img src="/intepark/resources/img/logo.png"
				height="150" width="300"></a><br> <br>
		</div>
		<Br>
		<H1>
			<strong>시공사 회원가입</strong>
		</H1>
		<br>
		<form action="insertCons6.do" id="consForm" method="post"
			onsubmit="return enrollCheck();">
			<input type="hidden" id="proOri" value="x" name="profileoriginalimg">
			<input type="hidden" id="proRe" value="x" name="profilerenameimg">
			<table>
				<tr>
					<th>아이디* :</th>
					<td><input type="text" class="form-control has-feedback-left"
						id="consId" name="consid" onkeyup="idCheck(this)" maxlength="12"
						required></td>
					<td>&nbsp;&nbsp;<input class="btn" type="button"
						onclick="dcheckId()" value="아이디 중복체크"></td>
				</tr>
				<tr>
					<td colspan="3" id="idcheck"></td>
				</tr>
				<tr>
					<th>비밀번호* :</th>
					<td><input type="password"
						class="form-control has-feedback-left" id="consPwd" name="conspwd"
						onkeyup="pwdCheck(this)" maxlength="15" id="pwd" required></td>
				</tr>
				<tr>
					<td colspan="3" id="pwdcheck"></td>
				</tr>
				<tr>
					<th>비밀번호 확인* :</th>
					<td><input type="password"
						class="form-control has-feedback-left" id="consPwd2"
						onkeyup="pwd2dCheck(consPwd,this)" maxlength="15" required></td>
				</tr>
				<tr>
					<td colspan="3" id="pwdcheck2"></td>
				</tr>
				<tr>
					<th>이름* :</th>
					<td><input type="text" name="consname"
						class="form-control has-feedback-left" id="consName" maxlength="5"
						onkeyup="nameCheck(this);" required></td>
				</tr>
				<tr>
					<td colspan="3" id="nameCheck"></td>
				</tr>
				<tr>
					<th>휴대폰번호* :</th>
					<td><input type="tel" name="phone"
						class="form-control has-feedback-left" id="consPhone"
						onkeydown="telCheck(event,this)" maxlength="13" required></td>
				</tr>
				<tr>
					<td colspan="3" id="telcheck"></td>
				</tr>
				<tr>
					<th>이메일* :</th>
					<td><input type="email" class="form-control has-feedback-left"
						id="uemail" name="consemail" onkeyup="eCheck(this)" required></td>
					<td>&nbsp;&nbsp;<input type="button" class="btn"
						onclick="dcheckEmail()" value="이메일 중복체크"></td>
				</tr>
				<tr>
					<td colspan="3" id="emailcheck"></td>
				</tr>
				<tr>
					<th>상호명* :</th>
					<td><input type="text" class="form-control has-feedback-left"
						name="companyname" maxlength="30" required></td>
				</tr>
				<tr>
					<th style="height:60px;">A/S기간* :</th>
					<td><input type="radio" name="asdate" value="미제공" checked>&nbsp;
						<p style="display: inline">미제공</p>&nbsp;&nbsp; <input type="radio"
						name="asdate" value="6개월">&nbsp;
						<p style="display: inline">6개월</p>&nbsp;&nbsp; <input type="radio"
						name="asdate" value="1년">&nbsp;
						<p style="display: inline">1년</p> <br> <input type="radio"
						name="asdate" value="2년">&nbsp;
						<p style="display: inline">2년</p>&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="asdate"
						value="2년이상">&nbsp;
						<p style="display: inline">2년이상</p></td>
				</tr>
				<tr>
					<th style="height:60px;">경력* :</th>
					<td><input type="radio" name="career" value="5년 미만" checked>&nbsp;
						<p style="display: inline">5년 미만</p>&nbsp;&nbsp; <input
						type="radio" name="career" value="5~10년">&nbsp;
						<p style="display: inline">5~10년</p>&nbsp;&nbsp; <input
						type="radio" name="career" value="10~15년">&nbsp;
						<p style="display: inline">10~15년</p> <br> <input
						type="radio" name="career" value="15~20년">&nbsp;
						<p style="display: inline">15~20년</p>&nbsp;&nbsp; <input
						type="radio" name="career" value="20년 이상">&nbsp;
						<p style="display: inline">20년 이상</p></td>
				</tr>
				<tr>
					<th style="height:110px;">시공 분야* :</th>
					<td><input type="checkbox" name="consarea"
						onClick="countck(this);" value="종합" checked>종합&nbsp;&nbsp;&nbsp;<input
						type="checkbox" name="consarea" onClick="countck(this);"
						value="도배">도배&nbsp;&nbsp;&nbsp;<input type="checkbox" name="consarea"
						onClick="countck(this);" value="장판">장판&nbsp;&nbsp;&nbsp;<input
						type="checkbox" name="consarea" onClick="countck(this);"
						value="마루">마루&nbsp;&nbsp;&nbsp;<input type="checkbox" name="consarea"
						onClick="countck(this);" value="주방">주방&nbsp;&nbsp;&nbsp;<br> <input
						type="checkbox" name="consarea" onClick="countck(this);"
						value="목공">목공&nbsp;&nbsp;&nbsp;<input type="checkbox" name="consarea"
						onClick="countck(this);" value="욕실">욕실&nbsp;&nbsp;&nbsp;<input
						type="checkbox" name="consarea" onClick="countck(this);"
						value="타일">타일&nbsp;&nbsp;&nbsp;<input type="checkbox" name="consarea"
						onClick="countck(this);" value="도어">도어&nbsp;&nbsp;&nbsp;<input
						type="checkbox" name="consarea" onClick="countck(this);"
						value="샷시">샷시&nbsp;&nbsp;&nbsp;<br><input type="checkbox"
						name="consarea" onClick="countck(this);" value="페인트">페인트&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="consarea" onClick="countck(this);"
						value="시트필름">시트필름&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="consarea" onClick="countck(this);" value="설비">설비&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="consarea" onClick="countck(this);"
						value="조명">조명&nbsp;&nbsp;&nbsp;<br><input type="checkbox"
						name="consarea" onClick="countck(this);" value="블라인드">블라인드&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="consarea" onClick="countck(this);"
						value="전문디자인">전문디자인&nbsp;&nbsp;&nbsp; <input type="checkbox"
						name="consarea" onClick="countck(this);" value="기타">기타&nbsp;
					</td>
				</tr>
				<tr>
					<th style="height:65px;">한줄 소개* :</th>
					<td><textarea rows="3" cols="30" name="consintroduction" class="form-control"
							onkeyup="textareaMaxlenth(this);" required></textarea>
				</tr>
				<tr>
					<th style="height:180px;">프로필사진* :</th>
					<td><div style="display: inline-block;" id="holder">
							<img style="display: none; height: 146px; width: 146px"
								id="proimg" src="" alt="">
							<p id="status" align="center"></p>
						</div>
						<p id="proimgname" style="margin-left:30px;"></p><td>
				</tr>

				<tr>
					<th>주소* :</th>
					<th><input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기"></th>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="form-control has-feedback-left"
						id="sample6_postcode" placeholder="우편번호" name="address1" readonly></td>
					<td><input type="text" class="form-control has-feedback-left"
						id="sample6_address" placeholder="주소" name="address2" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="form-control has-feedback-left"
						id="sample6_detailAddress" placeholder="상세주소" name="address3" readonly></td>
					<td><input type="text" class="form-control has-feedback-left"
						id="sample6_extraAddress" placeholder="참고항목" name="address4"
						readonly></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center; height:60px;"><input type="submit"
						class="btn btn-success" value="가입하기">&nbsp;&nbsp;<input
						type="button" class="btn btn-danger" value="초기화"
						onclick="resetForm();"></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
</body>
</html>