<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.teamProject.cart.model.CartDAO" %>

<%

  /* 장바구니에서 상품을 선택 삭제 */
  String orderNum = session.getId();
  CartDAO cartDAO = new CartDAO();

  // 문자열로 넘어온 chkdID 사용.
  String chkdID = request.getParameter("chkdID");
  cartDAO.deleteCartSel(orderNum, chkdID);

  response.sendRedirect("cart.jsp");
%>
