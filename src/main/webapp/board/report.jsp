<%@page import="mvc.model.RippleDTO"%>
<%@page import="mvc.model.RippleDAO"%>
<%@ page import="mvc.model.ReportDAO" %>
<%@ page import="mvc.model.ReportDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    ReportDAO dao = ReportDAO.getInstance();
    ReportDTO report = new ReportDTO();

    request.setCharacterEncoding("utf-8");

    report.setReportNum(Integer.parseInt(request.getParameter("reportNum")));
    report.setBoardNum(Integer.parseInt(request.getParameter("num")));
    report.setMemberId((String) session.getAttribute("sessionId"));
    report.setSubject(request.getParameter("subject"));
    report.setContent(request.getParameter("content"));
    report.setInsertDate(request.getParameter("date"));

    if(dao.insertReport(report)) {
%>
{"result":"true"}
<%
}
else {%>
{"result":"false"}
<%}
%>