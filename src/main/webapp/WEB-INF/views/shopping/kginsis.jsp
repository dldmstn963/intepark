<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테파크 결제</title>
</head>
<body>
  <script src="/intepark/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
	  $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '인테파크 결제',
	            amount : 1000,
	            buyer_email : '${user.useremail }',
	            buyer_name :'${user.username }',
	            buyer_tel : '${user.phone }',
	            buyer_addr : '${user.address }',
	            buyer_postcode : '123-456',
	            //m_redirect_url : 'http://www.naver.com'
	        }, function(rsp) {
	        	 if ( rsp.success ) {
	        	        var msg = '결제가 완료되었습니다.';
	        	        location.href='moveMyOrderList4.do';
	        	    } else {
	        	        var msg = '결제에 실패하였습니다.';
	        	        msg += '에러내용 : ' + rsp.error_msg;
	        	    }
	        	    alert(msg);
	        });
	        
	    });
	</script>
	
</body>
</html>