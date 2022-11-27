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
                  <title>View Class</title>
                </head>
                <body>

                  <div style="text-align:center">
                    <%
                      HttpSession mySession=request.getSession(false);
                      if(mySession==null){
                      out.print("<center><h3>Your session has expired..
                        Navigating you to home page.....</h3></center>");
                    response.setHeader("refresh",
                    "5;url='/SchoolManagmentSystem'");
                    }
                    else{
                    @SuppressWarnings("unchecked")
                    List<ClassObj> classList=(List<ClassObj>)mySession.getAttribute("classList");
                        if(classList !=null){
                        Date createTime = new Date(mySession.getCreationTime());
                        %>
                        <h1 style="Color:blue">Learner's Academy</h1><b
                          style="Color:blue">You Logged in at <%=createTime %></b>
                          <table style="text-align:center; margin-left:auto;">
                            <tr><td>&nbsp;&nbsp;<a href="logout" style="border:
                                  1px solid gray;padding: 7px;border-radius:
                                  20px;color: black;font-size: 19px;">logout</a>&nbsp;&nbsp;</td></tr>
                            <tr><td>&nbsp;&nbsp;<a
                                  href="/SchoolManagmentSystem/Dashboard.jsp">Dashboard</a>&nbsp;&nbsp;</td></tr>
                          </table>
                          <br/>

                            <h1 style="text-align: center;font-family: tahoma;">Learner's
                              Academy</h1>
                            <p
                              style="text-align: center;font-family: tahoma;">You
                              Logged in at <%=createTime %></p>
                              <div style="text-align: center;">
                                <a href="/SchoolManagmentSystem/Dashboard.jsp"
                                  style="border:
                                  1px solid gray;padding: 7px;border-radius:
                                  20px;color:
                                  black;font-size: 19px;">Dashboard</a>
                                <a href="logout" style="border: 1px solid
                                  gray;padding:
                                  7px;border-radius: 20px;color:
                                  black;font-size:
                                  19px;">logout</a>
                              </div>
                              <br/>

                                <div
                                  style="color:#a8a8a8;text-align: center;
                                  border: 1px
                                  outset
                                  #fff9f9;
                                  background-color: lightblue;">
                                </div>
                                <br/>
                                  <h4 style="text-align: center;">Class Details</h4>
                                  <br/>
                                    <pt:printClass classList="<%=classList %>"/>
                                      <br/>
                                        <br/>
                                        <form
                                        action="UpdateClass"
                                        method="post">
                                        <label>Standard: </label>
                                        <input
                                            type="number"
                                            name="standard"
                                            min="0"
                                            placeholder="standard"
                                            >
                                <br/>
                                <br/>
        
                                        <label>Division: </label>
                                        <input
                                            type="text"
                                            name="division"
                                            placeholder="division">
                                <br/>
                                <br/>
        
                                        <input
                                            type="submit"
                                            name="add"
                                            value="ADD CLASS"
                                            style="background-color:
                                            white;color: blue;padding: 9px
                                            37px;border: 1px solid
                                            blue;border-radius: 20px;margin-top:
                                            2px;font-size:
                                            20px;">
        
                                    </form>
                                        </div>
                                        <%@include file='footer.html' %>
                                          <%} else{
                                            response.sendRedirect("/SchoolManagmentSystem/Dashboard.jsp");
                                            %>

                                            <%}} %>
                                              <%mySession.removeAttribute("exception");
                                                mySession.removeAttribute("
                                                exceptionSys");%>
                                              </body>
                                            </html>