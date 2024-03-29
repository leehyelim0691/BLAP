<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Edit My Bucket</title>
    <style>
        .star-rating input {
            display: none;
        }
        
        .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 0.5px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
        }
            
        .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
        }
        .vl {
            margin-left: 7px;
            display: inline;
            border-left: 3px solid gray;
            height: 500px;
        }
        .file-button {
            display: inline;
            margin-left: 2.8%;
            /* width: 65%; */
            border: 1px solid black;
            cursor: pointer;
            padding: 0.48% 31%;
            /* justify-content: center; */
            text-align: right;
        }
        #photo {
            visibility: hidden;
        }

        #info-1 {
            display: inline-block;
            margin-left: 150px;
            width: 35%;
        }
        #info-2 {
            float:right;
            margin-right: 10%;
            width : 35%;
        }
        
        .title{
            text-align: right; 
            width: 80px; 
            display: inline-block; 
            justify-content: space-between;
        }
        img {
            height: 18px;
        }
        .item, .expense {
            width :90%;
        }
        .col {
            text-align: center;
        }
        .expense {
            text-align: center;
        }
        .index {
            text-align: right;
        }
        input[type=submit] {
            background-color: rgba(173, 172, 172, 1);
            border: none;
            color: white;
            padding: 5px 20px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10%;
        }
        input[type=reset] {
            background-color: white;
            border: 0.2px solid black;
            padding: 4.8px 19.8px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10%;
        }
    </style>
</head>
<body>
    <script language="javascript"> 
        function add() {
            document.getElementById('allexpense').value = 0;
            
            for(i=1; i<arrInput.length; i++) {
                var id = 'expense'+i;
                if(parseInt(document.getElementById(id).value)) document.getElementById('allexpense').value = parseInt(document.getElementById('allexpense').value) + parseInt(document.getElementById(id).value) ;
            } 
        }

        var arrInput = new Array(1);
        var arrInputName = new Array(1);
        var arrInputValue = new Array(1);
        
        function addInput() {
            
            arrInput.push(arrInput.length);
            arrInputName.push("");
            arrInputValue.push("");            
            display();
            
        }
        
        function display() {
            document.getElementById('expenseData').innerHTML="";
            for (intI=1; intI<arrInput.length; intI++) {
                document.getElementById('expenseData').innerHTML += createInput(arrInput[intI], arrInputName[intI], arrInputValue[intI]);
            }
        }
        
        function saveValue(intId,strValue) {
            arrInputValue[intId]=strValue;
        }  

        function saveName(intId,strName) {
            arrInputName[intId]=strName;
        }  
        
        function createInput(id,name,value) {
            return "<div class='col' style='padding: 10px 10px;'>"+id+"</div><div class='col' style='padding: 10px 10px;'>"+
                "<input class='item' type='text' onChange='saveName("+ id +",this.value)' value='"+ name +"'/></div> "+
                "<div class='col' style='padding: 10px 10px;'>&nbsp;&nbsp;<input type='text' class='expense' id='expense"+ id +
                "'  onkeyup='add()' style='width: 78%; '; onChange='saveValue("+ id +",this.value)' value='"+ value +"'/> 원</div><br><br>";    
            
        }
        function deleteInput() {
        if (arrInput.length > 0) { 
            arrInput.pop(); 
            arrInputName.pop(); 
            arrInputValue.pop();
        }
            display(); 
        }
    </script>

    <nav class="navbar navbar-expand-sm bg-white navbar-light border-bottom">
        <div class="container-fluid">
             <a href=".">
            <img src="./resources/assets/img/logo.png" alt="blap Logo" style="width:80px; height:55px">
           </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse d-flex justify-content-center" id="collapsibleNavbar" >
             <ul class="navbar-nav">
                <li class="nav-item me-5">
                  <a class="nav-link" href="about">ABOUT</a>
                </li>
                <li class="nav-item me-5">
                  <a class="nav-link" href="Bucketlist">BUCKET</a>
                </li>
                <li class="nav-item me-5">
                  <a class="nav-link" href="Budget">BUDGET</a>
                </li>
                <li class="nav-item me-5">
                  <a class="nav-link" href="Mypage">PROFILE</a>
                </li>
              </ul>
            </div>
        </div>
      </nav>
      
      <br/>

    <h3 style = 'text-align: center;'> EDIT MY BUCKET </h3><br>
    
    <form method="post" enctype="multipart/form-data" action="#"></form>
    <!-- 왼쪽 정보 적는 부분 (예상 비용 제외 부분) -->
    
    
    <div id="info-1">
            <div class="title"><span>제목</span>
            <div class="vl"></div></div>
            <input type="text" name="title" style="margin: 1% 0 0 3.5%; padding: 1px; width: 65%;" />
            <br><br><br>

            <div class="title"><span>해시태그</span>
            <div class="vl"></div></div>
            <input type="text" name="hashtag" style="margin: 1% 0 0 3.5%; padding: 1px; width: 65%;" />
            <br><br><br>

            <div class="title"><span>목표일</span>
            <div class="vl"></div></div>
            <input type="date" style="margin: 1% 0 0px 3.5%; padding: 1px; width: 65%;" />
            <br><br><br>

            <div class="title"><span>필요도</span>
            <div class="vl"></div></div>
                <div class="star-rating ness" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-ness" name="rating-ness" value="5"/>
                    <label for="5-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="4-stars-ness" name="rating-ness" value="4"/>
                    <label for="4-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="3-stars-ness" name="rating-ness" value="3"/>
                    <label for="3-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="2-stars-ness" name="rating-ness" value="2"/>
                    <label for="2-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="1-star-ness" name="rating-ness" value="1"/>
                    <label for="1-star-ness" class="star-ness">★</label>
                </div>
                <br><br><br>

                <div class="title"><span>선호도</span>
            <div class="vl"></div></div>
                <div class="star-rating pref" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-pref" name="rating-pref" value="5"/>
                    <label for="5-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="4-stars-pref" name="rating-pref" value="4"/>
                    <label for="4-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="3-stars-pref" name="rating-pref" value="3"/>
                    <label for="3-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="2-stars-pref" name="rating-pref" value="2"/>
                    <label for="2-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="1-star-pref" name="rating-pref" value="1"/>
                    <label for="1-star-pref" class="star-pref">★</label>
                </div>
                <br><br><br>
                <div class="title"><span>우선순위</span>
                <div class="vl"></div></div>
                
                <div class="star-rating prio" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-prio" name="rating-prio" value="5"/>
                    <label for="5-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="4-stars-prio" name="rating-prio" value="4"/>
                    <label for="4-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="3-stars-prio" name="rating-prio" value="3"/>
                    <label for="3-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="2-stars-prio" name="rating-prio" value="2"/>
                    <label for="2-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="1-star-prio" name="rating-prio" value="1"/>
                    <label for="1-star-prio" class="star-prio">★</label>
                </div>
                <br><br><br>
                <div class="title"><span>사진</span>
            <div class="vl"></div></div>
            <div class="file-button">
                <label for="photo">
                    <img src="img.png">
                </label>
            </div>
            <input type="file" id="photo" name="photo"style="margin: 3% 0 0px 3.5%; padding: 1px; padding: 2px; width: 300px;" accept="image/*"/></td>
        <br>
        <div class="title" style="vertical-align: top;"><span>메모</span>
            <div class="vl"></div></div>
            <textarea cols="50" rows="5" name="detail" style="margin: 0% 0 0px 3.5%; padding:4px; width: 65%;"></textarea>
        <br>
</div>
<!-- 오른쪽 정보 적는 부분 (예상 비용) -->
<div id="info-2">
    
    <p>예상 비용</p>
        <div class="row row-cols-3" style="border: black 1px solid; border-bottom: none; padding: 10px 8px; background-color: rgba(245, 245, 245, 1);">
        
            <div class="col"></div>
            <div class="col">항목</div>
            <div class="col">예상지출액</div>
            <br> 
        </div>
        
        <div class="row row-cols-3" id="expenseData" style='border: black 1px solid;  background-color: rgba(245, 245, 245, 1);'>
            
        </div>

        <div class="row row-cols-3" style='border: black 0.5px solid; padding: 5px 8px; border-top: none; background-color: rgba(245, 245, 245, 1);'>
            <div class="col"></div>  
            <div class="col">예상지출총액</div>
            <div class="col">&nbsp;&nbsp;&nbsp;<input id="allexpense" type="text" style="width: 78%; text-align: center;"/><span> 원</span></div>
            <input type='button' id = "addbutton" value='+' onclick='addInput()' />
            <input type="button" value="-" onclick="deleteInput();"/>
        </div>
    </div>
</div>

    <input type="reset" value="취소" style="margin-left: 43%; margin-top: 5px;" onclick="alert('취소되었습니다.');">
    <input type="submit" value="수정" style="margin-left: 5%;" onclick="alert('수정되었습니다.');">
</form>

<footer>
    <div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
        <p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
        <p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
    </div>
</footer>
</body>
</html>