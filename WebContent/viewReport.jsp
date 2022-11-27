<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.learnersacademy.model.ClassObj"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="pt" uri="WEB-INF/print_tags.tld" %>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Class Report</title>
</head>
<body>
 
<div style="text-align:centre">
<%
HttpSession mySession=request.getSession(false);
if(mySession==null){
	out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
	response.setHeader("refresh", "5;url='/SchoolManagmentSystem'");
}
else{
ClassObj cls=(ClassObj)mySession.getAttribute("class");
@SuppressWarnings("unchecked")
List<Object> reportList=(List<Object>)mySession.getAttribute("reportList");
if(reportList !=null){
Date createTime = new Date(mySession.getCreationTime());
%>
<h1 style="text-align: center;font-family: tahoma;">Learner's Academy</h1><b style="Color:green; text-align: center;font-family: tahoma;">You Logged in at <%=createTime %></b>
<div style="text-align: center;">
    <a href="/SchoolManagmentSystem/Dashboard.jsp"
        style="border:
        1px solid gray;padding: 7px;border-radius: 20px;color:
        black;font-size: 19px;">Dashboard</a>
    <a href="logout" style="border: 1px solid gray;padding:
        7px;border-radius: 20px;color: black;font-size:
        19px;">logout</a>
</div>
<br/>
<br/>
<h3 style="text-align:center"> - - - Class Report - - - </h3>
<h3 style="text-align:center">Id: <%=cls.getClassID() %> Standard: <%=cls.getStandard() %> Division: <%=cls.getDivision() %></h3>

<pt:printReport reportList="<%=reportList %>"/>
<br/>
<br/>
</div>
<%@include file='footer.html' %>
<%} else{
response.sendRedirect("/SchoolManagmentSystem/Dashboard.jsp");
%>

<%}} %>

<%mySession.removeAttribute("exception");
mySession.removeAttribute("exceptionSys");%>
</body>
</html>