<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.teamProject.admin.model.ProductsDTO" %>
<%@ page import="com.teamProject.admin.model.ProductsDAO" %>
<%@ page import="com.teamProject.cart.model.CartDAO" %>
<%@ page import="com.teamProject.cart.model.CartDTO" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <%
    String cartId = session.getId();

  %>
  <title>장바구니</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:include page="../inc/header.jsp" />
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">장바구니</h1>
  </div>
</div>
<div class="container">
  <div class="row" >
    <table width="100%">
      <tr>
        <td align="right"><a href="../order/form.co"  class="btn btn-primary btn-lg">주문하기</a></td>
      </tr>
    </table>
  </div>
  <div style="padding-top: 50px">
    <script type="text/javascript" src="../resources/js/check_system.js"></script>
    <form name="frmCart" method="get">
      <input type="hidden" name="id">
      <input type="text" name="chkdID" style="display:none;">

      <table class="table table-hover">
        <tr>
          <td>
            <span class="btn btn-danger" onclick="deleteCart()">장바구니 비우기</span>&nbsp;
            <span class="btn btn-danger" onclick="deleteCartSel()">선택 삭제하기</span>
          </td>
        </tr>

        <tr class="table-secondary" >
          <th><input name="chkAll" type="checkbox" onclick="setChkAll();">상품</th>
          <th>이미지</th>
          <th>가격</th>
          <th>수량</th>
          <th>소계</th>
          <th>비고</th>
        </tr>

        <%
          int sum = 0;


          ArrayList<CartDTO> cartArrayList = (ArrayList<CartDTO>) request.getAttribute("carts");

          for(CartDTO cart : cartArrayList){
            int total = cart.getProductPrice() * cart.getCnt();
            sum += total;

        %>


        <tr>

          <td>
            <input type="text" name="productId" value="<%=cart.getProductId()%>">
            <input type="checkbox" name="chkID" value="<%=cart.getCartId()%>" onClick="setChkAlone(this);">
            <%=cart.getProductId()%> - <%=cart.getProductName() %>
          </td>
          <td><img src="${pageContext.request.contextPath}/resources/images/<%=cart.getFileName()%>" class="img-thumbnail" style="width: 200px"></td>
          <td class="price"><%=cart.getProductPrice() %></td>
          <td><input type="number" value="<%=cart.getCnt() %>" name="cnt" class="productCnt" onClick="cartCnt()"> <input type="button" value="수정" onclick="updateCart()"></td>
          <td class="total"><%=total %></td>
          <td><span class="badge text-bg-danger" onclick="removeCartById('<%=cart.getCartId()%>')">삭제</span></td>
        </tr>

        <%
          }
        %>
        <tr class="table-secondary">
          <th></th>
          <th></th>
          <th></th>
          <th>총액</th>
          <th id="sum"><%=sum %></th>
          <th></th>
        </tr>
      </table>
    </form>
    <script>
      window.onload=function(){
        document.frmCart.chkAll.checked = true; // 전체 선택 체크 박스 체크
        setChkAll(); // 목록의 체크박스 체크
      }
      function frmName() {
        return document.frmCart;
      }

    </script>
  </div>
  <script>
    const frm = document.frmCart;
    let removeCartById = function(ID){
      if(confirm('해당 상품을 삭제하시겠습니까?')){
        location.href = 'removeCart.jsp?id=' + ID;
      }
    }
    let deleteCartSel = function() {
      if(confirm('선택한 상품을 삭제하시겠습니까?')) {
        frm.action = "deleteCartSel.jsp";
        frm.submit();
      }
    }

    let deleteCart = function(){
      if(confirm('삭제하시겠습니까?')){

        location.href = 'deleteCart.jsp';
      }
    }
    let updateCart = function() {
      if(confirm('선택한 상품을 수정하시겠습니까?')) {
        frm.action = "updateCart.jsp";
        frm.submit();
      }
    }
  </script>
  <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
  <hr>
  <jsp:include page="../inc/footer.jsp" />


  <script>
    let cnt = document.querySelectorAll(".productCnt");
    let total = document.querySelectorAll(".total");
    let price = document.querySelectorAll(".price");
    let sum = document.querySelector("#sum");
    let num = 0;

    let cartCnt = function() {
      for (let i = 0; i < cnt.length; i++) {
        cnt[i].addEventListener("change", function() {
          num = 0;
          total[i].innerText = Number.parseInt(cnt[i].value) * Number.parseInt(price[i].innerText);
          for (let j = 0; j < total.length; j++) {
            num += Number.parseInt(total[j].innerText);
          }
          sum.innerText = num;
        });

      }

    }




  </script>
</body>
</html>