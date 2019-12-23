/**
 * Made by WooSoo!
 *//*

//시공 지역--------------------------------------------------------------------------------------------------------

$(function(){
	
	$("#reqregion").on("change", function(){
		var reqregion = $(this).val();
		
		$("select[name=reqregion2]").val("");
			    $("select[name='reqregion2'] option").not("[value='']").selectedIndex = 0;
		
		showDiv(reqregion);
		});
	
	function showDiv(reqregion){
		
		if(reqregion == "서울특별시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "inline-block");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "부산광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "inline-block");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "대구광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "inline-block");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "인천광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "inline-block");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "광주광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "inline-block");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "대전광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "inline-block");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "울산광역시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "inline-block");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "강원도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "inline-block");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "경기도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "inline-block");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "경상남도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "inline-block");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "경상북도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "inline-block");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "전라남도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "inline-block");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "전라북도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "inline-block");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "충청남도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "inline-block");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "충청북도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "inline-block");
			$("#a16").css("display", "none");
		}
		if(reqregion == "세종특별자치시"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "none");
		}
		if(reqregion == "제주특별자치도"){
			$("#a0").css("display", "none");
			$("#a1").css("display", "none");
			$("#a2").css("display", "none");
			$("#a3").css("display", "none");
			$("#a4").css("display", "none");
			$("#a5").css("display", "none");
			$("#a6").css("display", "none");
			$("#a7").css("display", "none");
			$("#a8").css("display", "none");
			$("#a9").css("display", "none");
			$("#a10").css("display", "none");
			$("#a11").css("display", "none");
			$("#a12").css("display", "none");
			$("#a13").css("display", "none");
			$("#a14").css("display", "none");
			$("#a15").css("display", "none");
			$("#a16").css("display", "inline-block");
		}
	}
});
*/