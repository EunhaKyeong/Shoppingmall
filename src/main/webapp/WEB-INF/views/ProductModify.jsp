<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
  <title>Heroic Features - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath() %>/resources/mainPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/resources/mainPage/css/heroic-features.css" rel="stylesheet">

</head>

<body>

  	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
  
	<h3>상품등록</h3>
	
	<form role="form" method="post" autocomplete="off" enctype = "multipart/form-data">
	
	<label>카테고리</label>
	 <select class="category" name = "category_code">
	</select>
	
	<div class="inputArea">
	 <label for="name">상품명</label>
	 <input type="text" name="product_name" value ="${ModifyProduct.product_name }" />
	</div>
	
	<div class="inputArea">
	 <label for="manufacturer">제조사</label>
	 <input type="text" name = "product_manufacturer" value ="${ModifyProduct.product_manufacturer }" />
	</div>
	
	<div class="inputArea">
	 <label for="price">상품가격</label>
	 <input type="text" id = "product_price" name = "product_price" value ="${ModifyProduct.product_price}" />
	</div>
	
	<div class="inputArea">
	 <label for="stock">상품수량</label>
	 <input type="text" id = "product_stock" name = "product_stock" value ="${ModifyProduct.product_stock }" />
	</div>
	
	<div class="inputArea">
	 <label for="point">적립포인트</label>
	 <input type="text" id = "product_point" name = "product_point" value ="${ModifyProduct.product_point }"/>
	</div>
	
	<div class="inputArea">
	 <label for="point">판매사</label>
	 <input type="text" name = "product_seller" value ="${ModifyProduct.product_seller }" readonly = "true"/>
	</div>
	
	<div class="inputArea">
	 <label for="point">판매자</label>
	 <input type="text" name = "customerName" value ="${ModifyProduct.customerName }" readonly = "true"/>
	</div>
	
	<div class="inputArea">
	 <label for="point">평점(SQL Null 방지용 기입)</label>
	 <input type="text" name = "product_score" value ="${ModifyProduct.product_score }" readonly = "true"/>
	</div>
	
	<!--  이미지 내일 하겟음
	<div class = "inputArea">
		<label for = "gdsImg">이미지</label>
		<input type = "file" id = "gdsImg" name = "file" />
		<div class = "select_img"><img src = "" /></div>
	</div>
	
	<script>
	$("#gdsImg").change(function() {
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src", data.target.result).width(200);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	</script>
	-->
	<script>
	//초기값 세팅
	var select_category_code = '${ModifyProduct.category_code}';
	var select_category_name = '${ModifyProduct.category_name}';
		
	//컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	//삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	  cate1Obj = new Object();  //초기화
	  cate1Obj.category_code = jsonData[i].category_code;
	  cate1Obj.category_name = jsonData[i].category_name;
	  cate1Arr.push(cate1Obj);
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category");
	
	for(var i = 0; i < cate1Arr.length; i++) {
		if(select_category_code == i+1) {
			cate1Select.append("<option value='" + cate1Arr[i].category_code + "' selected = 'selected'>"
				      + cate1Arr[i].category_name + "</option>");
		} else {
			cate1Select.append("<option value='" + cate1Arr[i].category_code + "'>"
				      + cate1Arr[i].category_name + "</option>");	  
	    }
	}
	
	</script>
	
	<%= request.getRealPath("/") %>
	
	<div class="inputArea">
		<button type="submit" id="update_Btn" class="btn btn-warning">완료</button>
		<button type="button" id="back_Btn" class="btn btn-danger">취소</button>
	</div>
	
	<script>
		var formObj = $("form[role='form']");
		
		$("#update_Btn").click(function() {
			var con = confirm("정말로 수정하시겠습니까?");
			
			if(con){
			formObj.submit();}
		});
		
		$("#back_Btn").click(function() {
			var con = confirm("정말로 취소하시겠습니까?");
			
			if(con) {
			location.href = "/ProductDetail/${ModifyProduct.product_code}";}
		});
		
		var regExp = /[^0-9]/gi;

		$("#product_price").keyup(function(){ numCheck($(this)); });
		$("#product_stock").keyup(function(){ numCheck($(this)); });
		$("#product_point").keyup(function(){ numCheck($(this)); });

		function numCheck(selector) {
		 var tempVal = selector.val();
		 selector.val(tempVal.replace(regExp, ""));
		}
	</script>

  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/resources/mainPage/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/mainPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>