<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.teamProject.myPage.model.LikeDAO"%>
<%@ page import="com.teamProject.myPage.model.LikeDTO"%>

<%
  String sessionId = (String) session.getAttribute("sessionId");
  List boardList = (List) request.getAttribute("jjimlist");
  int total_record = ((Integer) request.getAttribute("total_record")).intValue();
  int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
  int total_page = ((Integer) request.getAttribute("total_page")).intValue();
  int limit = ((Integer) request.getAttribute("limit")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Insert title here</title>
  <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../inc/header.jsp" />
<main>
  <div class="container py-4">

    <div class="p-5 mb-4 bg-light rounded-3">
      <div class="container-fluid py-5">
        <h2 class="text-center">찜 목록</h2>
        <div class="container py-4">

          <div class="col-lg-8" style="margin: 0 auto;">
            <div class="row row-cols-2 row-cols-md-3">
              <!-- 찜하기 -->
              <%
                for (int j = 0; j < boardList.size(); j++) {
                  LikeDTO jjim = (LikeDTO) boardList.get(j);
              %>
              <div class="col my-5">
                <div class="card shadow-sm">
                  <a href="./product.jsp?productId=<%=jjim.getProductId()%>"><img
                          src="${pageContext.request.contextPath}/resources/images/<%=jjim.getFileName()%>"
                          style="height: 170px; width: 100%" alt="">


                    <div class="card-body">
                      <h2><%=jjim.getProductName()%></h2></a>
                  <p class="card-text"></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <a href="deletejjim.my?productId=<%=jjim.getProductId()%>"
                         class="btn btn-sm btn-outline-secondary" role="button">
                        삭제 &raquo;</a>
                    </div>
                    <small class="text-muted"></small>
                  </div>
                </div>
              </div>
            </div>
            <%
              }
            %>
          </div>
          <%
            int pagePerBlock = 5; // 페이지 출력시 나올 범위
            int totalBlock = total_page % pagePerBlock == 0 ? total_page / pagePerBlock : total_page / pagePerBlock + 1;//전체 블럭수
            int thisBlock = ((pageNum - 1) / pagePerBlock) + 1; //현재 블럭
            int firstPage = ((thisBlock - 1) * pagePerBlock) + 1; //블럭의 첫 페이지
            int lastPage = thisBlock * pagePerBlock; //블럭의 마지막 페이지
            lastPage = (lastPage > total_page) ? total_page : lastPage;
          %>
          <c:set var="pagePerBlock" value="<%=pagePerBlock%>" />
          <c:set var="totalBlock" value="<%=totalBlock%>" />
          <c:set var="thisBlock" value="<%=thisBlock%>" />
          <c:set var="firstPage" value="<%=firstPage%>" />
          <c:set var="lastPage" value="<%=lastPage%>" />

          <c:set var="pageNum" value="<%=pageNum%>" />


          <c:forEach var="i" begin="<%=firstPage%>" end="${lastPage}">

            <c:choose>
              <c:when test="${pageNum==i}">
                <nav aria-label="Page navigation example">
                  <ul class="pagination pagination-sm justify-content-center">
                    <li class="page-item"><a class="page-link"
                                             href="<c:url value="./jjimListAction.my?pageNum=1"/>">첫
                      페이지</a></li>
                    <c:if test="${thisBlock > 1}">
                      <li class="page-item"><a class="page-link"
                                               href="<c:url value="./jjimListAction.my?pageNum=${firstPage -1}"/>">이전</a>
                      </li>
                    </c:if>
                    <c:forEach var="i" begin="<%=firstPage%>" end="${lastPage}">
                      <c:choose>
                        <c:when test="${pageNum==i}">
                          <a class="page-link active"
                             href="<c:url value="jjimListAction.my?pageNum=${i}"/>">
                              ${i} </a>
                        </c:when>
                        <c:otherwise>
                          <a class="page-link"
                             href="<c:url value="./jjimListAction.my?pageNum=${i}"/>">${i}</a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                    <c:if test="${thisBlock < totalBlock}">
                      <li class="page-item"><a class="page-link"
                                               href="<c:url value="./jjimListAction.my?pageNum=${lastPage + 1}"/>">다음</a>
                      </li>
                    </c:if>
                    <li class="page-item"><a class="page-link"
                                             href="<c:url value="./jjimListAction.my?pageNum=${total_page}"/>">끝
                      페이지</a></li>
                  </ul>
                </nav>
              </c:when>
            </c:choose>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>

</main>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>