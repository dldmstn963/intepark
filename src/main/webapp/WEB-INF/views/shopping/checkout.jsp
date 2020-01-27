<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>인테파크</title>

    <!-- Favicon  -->
    <link rel="icon" href="/intepark/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/intepark/resources/css/core-style.css">
	<link rel="stylesheet" href="/intepark/resources/css/font.css">
</head>

<body>
<div class="main-content-wrapper d-flex clearfix">

       <jsp:include page="common/header.jsp" />

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>주문 결제</h2>
                            </div>
                            <form action="orderinsert4.do" method="post" id="frm">
                                <div class="row">
                                  <div class="col-12 mb-3">
                                        <select class="w-100" id="country" name="dlvynum">
                                        <c:if test="${!empty list}">
                                        <option value="">주소록</option>
                                        </c:if>
                                        <option value="0">직접 입력</option>
                                        <c:forEach var="li" items="${list }">
                                        <option value="${li.dlvynum }">
                                        ${li.dlvyname }/
                                        ${li.addressee }/
                                        ${li.address }/
                                        ${li.phone }
                                        </option>
                                        </c:forEach>
                                    </select>
                                    </div>
                                    <div id="divylist" class="col-12 mb-3">
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="company" placeholder="배송지 이름" value="" name="dlvyname">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="company" placeholder="받으시는 분" value="" name="addressee">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="email" placeholder="핸드폰 번호" value="" name="phone">
                                    </div>
                                  
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="sample2_address" placeholder="주소" value="" name="address">
                                        <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
                                        <input type="hidden" id="sample2_postcode" placeholder="우편번호">
										<input type="hidden" id="sample2_address" placeholder="주소"><br>
										<input type="hidden" id="sample2_detailAddress" placeholder="상세주소">
										<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
                                    </div>
                                    </div>
                               
                                    
                                    <div class="col-12 mb-3">
                                        <select class="w-100" id="country2" name="requestnum">
                                        <option value="">배송시 요청사항 목록</option>
                                       <option value="0">직접 입력</option>
                                        <c:forEach var="li" items="${list2 }">
                                        <option value="${li.requestnum }">
                                        ${li.requestcn }
                                        </option>
                                        </c:forEach>
                                    </select>
                                    </div>
                                    <div class="col-12 mb-3" id="requests"><input type="text" class="form-control mb-3" id="street_address" placeholder="배송시 요청사항 입력" value="" name="requestcn"></div>
                                    
                                    
                                   <!--  <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="street_address" placeholder="배송시 요청사항" value="" name="requestcn">
                                    </div> -->

                                </div>
                               <input type="hidden" name="userid" value="${loginUser.userid }">
                               <input type="hidden" name="goodsnum" value="${orders.goodsnum }">
								<input type="hidden" name="goodsprice" value="${orders.goodsprice }">
								<input type="hidden" name="orderquantity" value="${orders.orderquantity }">
								<input type="hidden" name="orderprice" value="${orders.orderquantity * orders.goodsprice }">
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>전체 합계</h5>
                            <ul class="summary-table">
                                <li><span>상품 금액:</span> <span><fmt:formatNumber value="${orders.goodsprice * orders.orderquantity}" groupingUsed="true"/>원 </span></li>
                               <!--  <li><span>배송비:</span> <span>2,500원</span></li>
                                <li><span>전체 주문 금액:</span> <span>26,500원</span></li> -->
                            </ul>

                            <!-- <div class="payment-method">
                                Cash on delivery
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="cod" checked>
                                    <label class="custom-control-label" for="cod">착불</label>
                                </div>
                                Paypal
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="paypal">
                                    <label class="custom-control-label" for="paypal">페이팔 <img class="ml-15" src="/intepark/resources/img/core-img/paypal.png" alt=""></label>
                                </div>
                            </div> -->

                            <div class="cart-btn mt-100">
                                <a href="#" onclick="document.getElementById('frm').submit()" class="btn amado-btn w-100">결제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
    <!-- ##### Main Content Wrapper End ##### -->

	<jsp:include page="common/footer.jsp" />

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/intepark/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/intepark/resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/intepark/resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="/intepark/resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="/intepark/resources/js/active.js"></script>
	
	
	
	
	
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
	
	
	
	
	
	 <script type="text/javascript">
$(function(){
	if(${!empty list}){
		$('#divylist').hide();
	}	
$('#country').change(function(){
	if(this.value==0){
$('#divylist').show();
		};
});

$('#country').change(function(){
	if(this.value!=0){
	$('#divylist').hide();
		};
	});

if(${!empty list2}){
	$('#requests').hide();
}	
$('#country2').change(function(){
if(this.value==0){
$('#requests').show();
	};
});

$('#country2').change(function(){
	if(this.value!=0){
	$('#requests').hide();
		};
	});

});
                            </script>
	
</body>

</html>