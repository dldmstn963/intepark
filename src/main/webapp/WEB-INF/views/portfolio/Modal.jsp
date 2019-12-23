<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal</title>
</head>
<body>
<!-- --------------------------------------------------제3자 정보제공 동의 모달 구역---------------------------------------- -->		
<div class="modal fade" id="layerpop" style="padding-top:190px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
        <!-- header title -->
        <div class="container">
        	<div class="row">
        		<div class="col-lg-12" style="text-align:center;">
        			<h4 style="margin-bottom:0;"><strong>개인정보 제 3자 제공 동의</strong></h4>
        		</div>
        	</div>
        </div>
      </div>
      <!-- body -->
      <div class="modal-body">
           <table border="2px solid gray" style="text-align:center; width:100%;">
           		<tr>
           			<th>제공받는자</th>
           			<th>제공목적</th>
           			<th>제공하는<br>개인정보 항목</th>
           			<th>개인정보 보유<br>및 이용기간</th>
           		</tr>
           		<tr>
           		<td>시공사</td>
           		<td><br>전문가 서비스 이용 및 상담을 위한 정보 확인<br> 
           				(견적상담, 방문견적, 계약체결, 상담대리접수) 등<br> 
           				정보통신서비스제공 계약의 이행을 위해<br> 
           				필요한 업무의 처리<br><br></td>
           		<td>이름, 연락처,<br> 시공지역,<br> 상담내용</td>
           		<td>서비스 이용 및<br> 상담 종료 시까지<br> 단, 관계 법령이<br> 정한 시점까지<br> 보존</td>
				</tr>
           </table>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style="width:100%;">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------개인정보 취급방침 동의 모달 구역---------------------------------------- -->		
<div class="modal fade" id="layerpop2">
  <div class="modal-dialog modal-lg" style="max-width:1000px;">
    <div class="modal-content" style="height:700px;">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <div class="container">
        	<div class="row">
        		<div class="col-lg-12" style="text-align:center;">
        			<h4 style="margin-bottom:0;"><strong>개인정보 취급방침 동의</strong></h4>
        		</div>
        	</div>
        </div>
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <!-- body -->
      <div class="modal-body" style="overflow:auto;">
      
           인테파크 서비스 개인정보 취급방침<br><br>
			<div>
			버킷플레이스(이하 "회사"라 합니다)는 회사가 제공하는 인테파크 서비스(이하 "서비스"라 합니다) 회원의 개인정보보호를 매우 중요시하며, 
			『정보통신망 이용촉진 및 정보보호 등에 관한 법률』등 개인정보와 관련된 법령 상의 개인정보보호규정을 준수하고 있습니다. 
			회사는 아래와 같이 개인정보취급방침을 명시하여 회원이 회사에 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 
			개인정보보호를 위해 어떠한 조치를 취하는지 알려드립니다. 회사의 서비스 개인정보취급방침은 정부의 법률 및 지침의 변경과
			당사의 약관 및 내부 정책에 따라 변경될 수 있으며 이를 개정하는 경우 회사는 변경사항에 대하여 즉시 서비스 화면에 게시합니다.
			회원님께서는 사이트 방문 시 수시로 확인하시기 바랍니다.</div><br>

			<h6><strong>1. 인테파크은 이용하는 서비스의 형태에 따라 다음과 같은 개인정보를 수집 및 이용∙제공∙파기하고 있습니다.</strong></h6>
			① 회사는 회원기반 서비스 제공을 위해 다음과 같이 개인정보를 수집, 이용, 파기합니다.
			<table class="table" style="text-align:center;" border="1">
			<tr><th>수집방법</th><th>수집항목</th><th>수집 및 이용목적</th><th>보유 및 이용기간</th></tr>
			<tr><td>회원가입(필수)</td><td>닉네임, 이메일 주소</td><td>서비스 이용 및 상담을 위한 이용자 식별	</td><td rowspan="4">
			회원에서 탈퇴한 후 회원 재가입, 임의해지 등을<br>
			반복적으로 행하여 회사가 제공하는 할인쿠폰, 이벤트<br> 
			혜택 등으로 경제상의 이익을 취하거나 이 과정에서<br> 
			명의를 무단으로 사용하는 편법과 불법행위를 하는<br>
			회원을 차단 하고자 회원 탈퇴 후 1개월 동안 보관합니다.
			</td></tr>
			<tr><td rowspan="2">회원가입(선택)</td><td>페이스북 카카오톡 사용자 ID</td><td>페이스북, 카카오톡 등 SNS 계정을 통한 간편 가입시</td></tr>
			<tr><td>프로필사진, 생년월일, 성별, 거주지 유형 및 크기,<br> 인테리어 관심사, 이용자 홈페이지 주소</td><td>맞춤형 콘텐츠 및 상품 추천 등 마케팅 활용</td></tr>
			<tr><td>휴대전화 인증</td><td>휴대전화 번호</td><td>상품 구매 및 포인트(적립금) 지급 시 본인 인증</td></tr>
			</table>
			<br>
			② 회사는 비회원의 서비스 제공을 위해 다음과 같이 개인정보를 수집, 이용, 파기 합니다.
			<table class="table" style="text-align:center;" border="1">
			<tr><th>수집방법</th><th>수집항목</th><th>수집 및 이용목적</th><th>보유 및 이용기간</th></tr>
			<tr>
			<td rowspan="2">상품구매</td>
			<td>1) 구매자정보(이름, 휴대전화 번호, 이메일 주소)<br>2) 수령인정보(이름, 휴대전화 번호, 이메일 주소)</td>
			<td>상품 주문 확인 및 이용자 식별 서비스 이용 및 상담</td>
			<td rowspan="4">5년 (계약 및 철회, 결제 및 공급)</td>
			<tr>
			<td>개인통관고유부호</td>
			<td>해외 배송상품 구매 시 배송 및 관세법에 따른 통관 절차에 이용</td>
			</tr>
			<tr>
			<td rowspan="2">결제 및 환불</td>
			<td>카드사명, 카드번호</td>
			<td>신용카드 간편결제 서비스</td>
			</tr>
			<tr>
			<td>환불 계좌번호, 은행명, 예금주명</td>
			<td>결제 서비스 환불</td>
			</tr>
			<tr>
			<td>전문가 상담신청</td>
			<td>이름, 시공종류, 휴대전화번호, 지역, 주거유형<br> 예산범위, 시공완료 날짜, 상담내용<br> 서비스 이용 내역</td>
			<td>이용자 식별, 회원관리, 본인여부 확인</td>
			<td>서비스 이용 및 상담 종료 시까지<br> 단, 법령이 정한 시점까지 보존</td>
			</tr>
			<tr>
			<td>고객센터</td>
			<td>이름, 이메일, 휴대전화번호</td>
			<td>인테파크 서비스 이용 고객 상담</td>
			<td>3년</td>
			</tr>
			</table>
			<br>
			<div>
			③ 회사는 전문가 회원에 대한 서비스 제공을 위해 다음과 같이 개인정보를 수집, 이용 파기 합니다.<br>
			1) 구매자정보(이름, 휴대전화 번호, 이메일 주소) 2) 수령인정보(이름, 휴대전화 번호, 이메일 주소)<br>	
			유료 상품 구매, 일부 콘텐츠 및 서비스 이용 금융거래 시 관련 법령에 따른 본인 확인<br>
			서비스 부정사용 방지, 서비스 장애 발생시 신속한 민원 처리 5년 (계약 및 철회, 결제 및 공급)<br>
			결제정보 무통장 입금(가상계좌), 실시간계좌이체 계좌정보(은행명, 계좌번호, 예금주 이름)<br>
			정산 신청자 정보(이름, 전화번호, 이메일 주소)	현금 환불 처리, 관련 법령에 따른 보존 의무 이행 고객센터	이름, 아이디,<br> 
			휴대전화번호, 업체명, 업체주소 사업자등록증, 은행계좌정보 등 서비스 이용관련 문의, 상담, 환불, 장애 대응 등 민원처리<br>
			<br>
			④ 회사는 상품구매 및 배송 등 서비스 및 고객상담 제공을 위해 다음과 같이 개인정보를 수집, 이용, 파기 합니다.<br>
			1) 구매자정보(이름, 휴대전화 번호, 이메일 주소) 2) 수령인정보(이름, 휴대전화 번호, 이메일 주소)<br>	
			상품 주문 확인 및 이용자 식별 서비스 이용 및 상담	5년 (계약 및 철회, 결제 및 공급) 개인통관고유부호<br>
			해외 배송상품 구매 시 배송 및 관세법에 따른 통관 절차에 이용 결제 및 취소·환불	카드사명, 카드번호<br>
			신용카드 간편결제 서비스 환불 계좌번호, 은행명, 예금주명	결제 서비스 환불<br>
			고객상담	이름, 휴대전화 번호(회원 확인 필요 시) 아이디, 닉네임	인테파크 서비스 이용 고객 상담 3년<br>
			<br>
			⑤ 회사는 회원에 전문가 상담 서비스 제공을 위해 다음과 같이 개인정보를 수집, 이용, 파기합니다.<br>
			수집방법	수집항목	수집 및 이용목적	보유 및 이용기간 전문가 상담	이름, 시공종류, 휴대전화번호, 지역, 주거형태<br>
			예산범위, 시공완료 날짜, 상담내용, 서비스 이용 내역	이용자 식별, 회원관리, 본인여부 확인	회원 탈퇴 시점으로부터 <br>
			1개월간 보관하고 파기합니다.<br>
			<br>
			⑥ 회사는 회원의 이벤트참여에 따라 아래와 같이 개인정보를 수집, 이용, 파기 합니다.<br>
			※ 이벤트 참여 회원이라 함은 인테파크에서 운영하는 소셜미디어(페이스북, 카카오스토리, 인스타그램, 블로그 등) 및 <br>
			인테파크 사이트 및 앱 등을 통하여 진행하는 이벤트에 참여한 회원을 의미합니다.<br>
			<br>
			⑦ 회사는 회원 혹은 비회원이 동의하는 경우 이벤트 및 마케팅 홍보를 위한 목적으로 아래와 같이 개인정보를 수집, 이용, 파기합니다.<br>
			이벤트/마케팅 홍보 당사 및 제휴사 상품 안내, 이벤트 등 광고성 정보 전달 및 참여기회 제공, 회원 대상 각종 마케팅 활동, 서비스 이용내역, <br>
			서비스 내 구매 및 결제 내역 이름, 아이디, 휴대전화번호, 이메일 개인정보 이용목적 달성 시, 동의철회(제휴업체는 제휴계약 종료 시) 및 <br>
			관계법령에 따른 보관기간까지<br>
			<br>
			⑧ 서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보, ADID 및 IDFA 가 생성되어 수집될 수 있습니다.<br>
			1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나,<br>
			2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.<br>
			<br>
			2. 서비스의 제공 또는 법령에 정해진 책임의 준수를 위하여 회사가 보관하고 있는 개인정보가 제3자에게 수집 목적 범위 내에서 제공될 수 있습니다.<br>
			<br>
			① 회사는 이용자의 개인정보를 회사에서 제공하는 서비스 이용과 관련한 목적 외로 이용하거나 타인 또는 타기업이나 타 기관에 제공하지 않습니다. <br>
			그러나 보다 나은 서비스의 제공을 위하여 이용자의 개인정보를 협력업체 등과 공유할 필요가 있는 경우에는 제공받는 자, 제공 목적, 제공 정보 항목, <br>
			이용 및 보유 기간 등을 이용자에게 고지하여 동의를 구합니다.<br>
			<br>
			② 회사는 서비스 제공 및 배송, 본인확인 등 거래의 이행을 위하여 필요한 최소한의 개인정보만을 서비스 제공 업체에게 제공하고 있습니다. <br>
			이용자 서비스 구매 시 제3자 제공에 동의하는 경우, 해당 서비스 제공 업체에게 아래의 개인정보가 제공됩니다.<br>
			1) 구매자정보(닉네임, 이름, 휴대폰번호, 이메일주소)<br>
			2) 수령인정보(이름, 휴대폰번호, 주소)<br>
			3) 상품 구매, 취소, 반품, 교환정보<br>
			4) 송장정보<br>
			5) 개인통관고유부호 (해외배송상품 구매시)	상품 제공 완료 후 3개월<br>
			<br>
			③ 회사는 이용자가 서비스에 등록된 특정 전문가에게 상담을 신청한 경우, 최소한의 개인정보만을 해당 전문가에게 제공하고 있습니다. <br>
			이용자 전문가 상담 신청 시 제3자 제공에 동의하는 경우, 해당 전문가에게 아래의 개인정보가 제공됩니다.<br>
			1) 이름<br>
			2) 연락처<br>
			3) 시공지역<br>
			4) 상담내용	서비스 이용 및 상담 종료 시까지<br>
			단, 관계 법령이 정한 시점까지 보존<br>
			<br>
			3. 회사는 서비스 향상과 효과적인 업무처리를 위하여 다음과 같이 개인정보를 처리 위탁하고 있습니다.<br>
			<br>
			① 회사는 원활하고 향상된 서비스를 위하여 개인정보 처리를 타인에게 위탁할 수 있습니다. 이 경우 회사는 사전에 <br>
			다음 각 호의 사항 모두를 이용자에게 미리 알리고 동의를 받습니다.<br>
			(1) 개인정보 처리위탁을 받는 자<br>
			(2) 개인정보 처리위탁을 하는 업무의 내용<br>
			<br>
			② 회사는 개인정보의 처리와 관련하여 아래와 같이 업무를 위탁하고 있으며, 관계법령에 따라 위탁 계약 시 개인정보가 <br>
			안전하게 관리될 수 있도록 필요한 조치를 하고 있습니다. 회사는 위탁 계약 시 수탁자의 개인정보 보호조치 능력을 고려하고, <br>
			개인정보의 안전한 관리 및 파기 등 수탁자의 의무 이행 여부를 주기적으로 확인합니다. 또한 위탁처리하는 정보는 원활한 <br>
			서비스를 제공하기 위하여 필요한 최소한의 정보에 국한됩니다.<br>
			<br>
			나이스정보통신 주식회사 전자 결제 대행<br>
			㈜케이지모빌리언스 휴대전화 결제 대행<br>
			㈜네이버	네이버페이 결제 서비스 제공 업체<br>
			LG CNS 스마일페이 결제 서비스 제공 업체<br>
			㈜한국코퍼레이션	고객 및 주문정보 이용관리 등 콜센터 업무의 일체<br>
			㈜엔에이치엔페이코	페이코 결제 서비스 제공 업체<br>
			braze Inc.	고객 분석 및 메시지 발송 플랫폼 서비스 제공 업체<br>
			㈜NHN (토스트)	SMS 발송 및 카카오 알림톡/친구톡 서비스 제공 업체<br>
			<br>
			4. 회사는 이용자에게 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다.<br>
			<br>
			회사가 이용자에게 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공하는 경우, 회사는 외부사이트 및 자료에 대한 <br>
			아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다.<br>
			회사가 포함하고 있는 링크를 클릭(click)하여 타사이트(site)의 페이지로 옮겨 갈 경우 해당 사이트의 개인정보보호정책은 <br>
			회사와 무관하므로 새로 방문한 사이트의 정책을 검토해보시기 바랍니다.<br>
			<br>
			5. 이용자 및 법정대리인은 아래와 같은 권리를 행사할 수 있습니다.<br>
			<br>
			① 이용자 및 법정대리인은 언제든지 수집 정보에 대하여 수정, 동의철회, 삭제 등을 요청하실 수 있습니다. <br>
			    다만, 동의 철회․삭제시 서비스의 일부 또는 전부 이용이 제한될 수 있습니다.<br>
			<br>
			② (조회/수정 및 정정) 홈페이지에서 ‘마이홈>설정>회원정보수정’ 메뉴 또는 1:1 상담을 이용하여 처리할 수 있습니다. <br>
			    처리가 완료될 때까지 해당 정보를 이용하거나 타인에게 제공하지 않을 것입니다. 또한 합리적인 사유로 잘못된 개인정보를 <br>
			    제3자에게 이미 제공한 경우, 정정 처리의 결과를 지체 없이 제3자에게 통지하여 정정하도록 조치합니다.<br>
			<br>
			③ (동의 철회/삭제) 1:1 상담을 이용하여 수집 정보에 대한 동의 철회 및 삭제를 요청하실 수 있습니다. <br>
			    다만, 수집정보에 대한 동의 철회․삭제시 서비스의 일부 또는 전부 이용이 제한될 수 있으며, 다른 법령에 <br>
			    따라 수집하는 정보의 경우에는 동의 철회가 어려울 수 있습니다.<br>
			<br>
			④ (회원 탈퇴) 홈페이지의 ‘마이홈>설정>회원정보수정>회원탈퇴’ 메뉴를 이용하여 편리하게 직접 탈퇴를 진행하시거나, <br>
			    1:1상담을 통하여 진행할 수 있습니다.<br>
			<br>
			⑤ (서비스 재이용) ‘아이디 찾기’를 통하여 미이용자 여부를 확인할 수 있으며, 반드시 비밀번호를 변경하신 후 <br>
			    계정 재이용이 가능합니다. 문의사항은 고객센터 1670-0876을 이용하시기 바랍니다.<br>
			<br>
			⑥ (상담/문의) 회사는 개인정보의 수집 및 이용 목적에 따라 이용자와 상담원 간의 통화내용을 녹음할 수 있으며 고객센터를 <br>
			    통한 소비자 상담/문의 시 녹음 등에 대한 안내는 고객센터 상담 전 안내 멘트를 통해 확인하실 수 있습니다.<br>
			<br>
			6. 회사는 이용자들의 개인정보를 처리함에 있어 개인정보의 기술적/관리적 보호 대책을 마련하여 정보보호를 위해 노력하고 있습니다.<br>
			회사는 이용자들의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 <br>
			다음과 같은 기술적/관리적 보호대책을 강구하고 있습니다.<br>
			<br>
			① 비밀번호의 암호화<br>
			- 이용자의 비밀번호는 일방향 암호화하여 저장 및 관리되고 있으며, 개인정보의 확인 및 변경은 비밀번호를 알고 있는 본인에 의해서만 가능합니다.<br>
			<br>
			② 해킹 등에 대비한 대책<br>
			- 회사는 해킹이나 바이러스 등 회사 정보통신망 침입에 의한 이용자 개인정보의 분실, 도난, 유출, 변조 또는 훼손 등 <br>
			피해 방지를 위해 침입탐지 및 침입차단 시스템을 24시간 가동하고 있으며, 만일의 사태에 대비하여 모든 침입탐지 <br>
			시스템과 침입차단 시스템은 이중화로 구성하여 운영하고 있습니다.<br>
			- 개인정보의 훼손 피해에 대비하여 중요한 데이터를 주기적으로 백업하고 있으며, 백신 프로그램을 이용하여 <br>
			개인정보나 중요한 데이터의 유출 방지를 위해 노력하고 있습니다.<br>
			- 민감한 개인정보는 정보통신망을 통해 주고받는 과정에서 암호화 통신을 적용하여 개인정보를 안전하게 전송할 수 있도록 하고 있습니다.<br>
			- 이 외에도 보안 시스템 도입 및 전문인력 확충 등 보안성 확보를 위해 지속적으로 노력하고 있습니다.<br>
			<br>
			③ 개인정보 처리자의 최소화 및 주기적인 교육<br>
			- 회사의 개인정보 관련 처리자는 담당자로 한정하여 개인정보 처리자를 최소화 하고 있으며, 퇴직 및 직무변경 등 <br>
			인사이동이 있는 경우 지체 없이 권한을 변경, 말소 하여 개인정보 접근 권한을 통제 하고 있습니다.<br>
			- 개인정보 처리자에 대해 주기적으로 교육을 진행하여 개인정보보호의 중요성을 인식시키고, <br>
			안전하게 관리 할 수 있도록 최선의 노력을 다하고 있습니다.<br>
			<br>
			7. 인테파크은 귀하의 안전한 개인정보 보호를 위해 개인정보 보호책임자를 지정하고 있습니다.<br>
			<br>
			① 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제 등을 위하여 <br>
			아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
			<br>
			개인정보보호책임자	개인정보 민원처리 담당부서<br>
			성명 : 홍 길 동<br>
			연락처 : 1234 - 0876, intepark@or.kr	부서명 : 고객센터<br>
			연락처 : 1234 - 0876, intepark@or.kr<br>
			② 회사가 제공하는 서비스(또는 사업)를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 <br>
			사항을 개인정보 보호책임자 및 고객지원센터로 문의하실 수 있으며, 버킷플레이스는 이런 문의에 대해 지체 없이 답변 및 처리 할 것입니다<br>
			<br>
			③ 개인정보가 침해 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
			▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영) : (국번없이) 118 / privacy.kisa.or.kr<br>
			▶ 대검찰청 사이버범죄수사단 : (국번없이) 1301 / www.spo.go.kr<br>
			▶ 경찰청 사이버안전국 : (국번없이) 182 / www.cyber.go.kr<br>
			▶ 전자거래분쟁조정위원회 (https://www.ecmc.or.kr / 1661-5714)<br>
			<br>
			8. 개인정보 처리방침 변경에 관한 정책은 다음과 같습니다.<br>
			이 개인정보 처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 <br>
			시행 7일 전부터 공지사항을 통하여 고지할 것입니다. 또한 관련 법령이나 회사 정책의 변경으로 불가피하게 처리방침을 변경해야 하는 경우, <br>
			웹사이트 공지사항을 통해 빠르게 알려드리고 있으니 참고하여 주시기 바랍니다.<br>
			<br>
			- 개정일자 : 2019년 7월 8일<br>
			- 시행일자 : 2019년 7월 15일<br>
			<br>
			</div>

      </div><!-- modal-body 끝 -->
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style="width:100%;">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>