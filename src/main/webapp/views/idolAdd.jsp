<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css2/idolAdd.css" type="text/css">
<meta charset="UTF-8">
<title>아이돌 추가 페이지</title>
</head>
<body>
   <!-- 아이돌 정보 추가 -->
   <main class="idolAddWrap">
      <!-- 배경 요소 -->
      <img class="img1" src="/resources/img/bottomPattern1025.png" alt="배경요소">
      <img class="img2" src="/resources/img/bottomPattern634.png" alt="배경요소">
      <img class="img3" src="/resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="/resources/img/purple56.png" alt="배경요소">
      <img class="img5" src="/resources/img/purple32.png" alt="배경요소">
      <img class="img6" src="/resources/img/red48.png" alt="배경요소">
      <img class="img7" src="/resources/img/green72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="idolAddWrap2">
         <!-- 관리자 페이지 헤더 -->
         <header>
            <div onclick="homeGo()"></div>
            <p onclick="logoutFunc()">로그아웃</p>
         </header>
         <!-- 정보 입력 -->
         <section class="idolAddBox">
            <h2 class="idolAddBoxTitle">아이돌 정보 추가</h2>
            <form action="adminIdol.do" method="POST" enctype="multipart/form-data" onsubmit="idolAddSubmit(event)">
               <div class="idolAddImgs">
                  <img class="idolAddBoxImg" id="idolAddImg" src="" alt="아이돌 사진">
                  <img class="idolAddBoxMarkerImg" id="markerAddImg" src="" alt="마커 사진">
               </div>
               <div class="idolAddInfo">
                  <div class="idolAddInfoBoxs">
                     <div class="idolAddInfoBox">
                        <p>그룹명</p>
                        <input type="text" name="idolAddGroup" id="idolAddGroup" placeholder="그룹 이름을 입력하세요">
                     </div>
                     <div class="idolAddInfoBox">
                        <p>이름</p>
                        <input type="text" name="idolAddName" id="idolAddName" placeholder="아이돌 이름을 입력하세요">
                     </div>
                     <div class="idolAddInfoImg">
                        <p>아이돌 이미지 첨부</p>
                        <div>
                           <input class="imgUpload" id="idolImgName" disabled="disabled" onchange="readURL(this);">
                           <label for="inputIdolImg">업로드</label>
                           <input type="file" name="inputIdolImg" id="inputIdolImg" class="inputIdolImg" onchange="idolImgChange(event)">
                        </div>
                     </div>
                     <div class="idolAddInfoImg">
                        <p>마커 이미지 첨부</p>
                        <div>
                           <input class="imgUpload" id="idolMarkerName" disabled="disabled" onchange="readURL(this);">
                           <label for="inputMarkerImg">업로드</label>
                           <input type="file" name="inputIdolMark" id="inputMarkerImg" class="inputMarkerImg" onchange="idolMarkerChange(event)"> 
                        </div>
                     </div>
                  </div>
                  <div class="idolAddInfoBtn">
                     <div class="idolAddInfoBtn1" onclick="idolAddCancel()">취소</div>
                     <input type="submit" id="idolAddInfoBtn2" class="idolAddInfoBtn2" value="추가하기">
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
	 if(`${sessionScope.loginId}` == ""){
	   window.location.href="/";
     }
	 function idolAddReset(){
		 document.getElementById("idolAddGroup").value = "";
		 document.getElementById("idolAddName").value = "";
		 document.getElementById("idolImgName").value = "";
		 document.getElementById("idolMarkerName").value = "";
	 }
	 function idolAddSubmit(e){
		 const idolAddGroup = document.getElementById("idolAddGroup").value;
		 const idolAddName = document.getElementById("idolAddName").value;
		 const idolImgName = document.getElementById("idolImgName").value;
		 const idolMarkerName = document.getElementById("idolMarkerName").value;
         if(idolAddGroup == "" || idolAddName == "" || idolImgName == "" || idolMarkerName == ""){
            alert("폼 내용을 모두 채워주세요.");            
            e.preventDefault();
         }
         else{
        	 if(!confirm("해당 내용으로 아이돌을 추가하시겠습니까?")){
        		 e.preventDefault();
        	 }else{
        		 
        	 }
         }
      }
      
      function idolAddCancel(){
    	  if(!confirm("아이돌 추가를 취소하시겠습니까?")){
    		  return;
    	  }else{
    		  idolAddReset();
    		  window.location.href = "/admin.go";
    	  }
      }

      function idolImgChange(event){
         document.getElementById("idolImgName").value =  document.getElementById("inputIdolImg").value;
         let reader = new FileReader();
         reader.onload = function(e) {
            document.getElementById("idolAddImg").setAttribute("src", e.target.result);
         };
         reader.readAsDataURL(event.target.files[0]);
      }

      function idolMarkerChange(event){
         document.getElementById("idolMarkerName").value =  document.getElementById("inputMarkerImg").value;
         let reader = new FileReader();
         reader.onload = function(e) {
            document.getElementById("markerAddImg").setAttribute("src", e.target.result);
         };
         reader.readAsDataURL(event.target.files[0]);
      }
      function logoutFunc(){
  		$.ajax({
  			type:"POST",
  			url:"/logout.do",
  			data:{
  				logout:"logout"
  			},
  			dataType:"TEXT",
  			success:function(data){
  				if(data == "logout"){
  					window.location.href="/"
  				}
  			},
  			error:function(err){
  				console.log("logout", err);
  				if(err) throw err;
  			}
  		});
  	  }
      function homeGo(){
      	window.location.href = "/main.go";
      }
      idolAddReset();
   </script>
</body>
</html>