<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.teamProject.cart.model.CartDAO" %>

<%
  /* 장바구니에서 상품을 개별 삭제 */
  int cartId = Integer.parseInt(request.getParameter("id"));

  String orderNum = session.getId();

  CartDAO cartDAO = new CartDAO();
  cartDAO.deleteCartById(orderNum, cartId);

  response.sendRedirect("cart.jsp");

%>
