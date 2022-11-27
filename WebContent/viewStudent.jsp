<%@page import="java.util.List"%>
  <%@page import="java.util.Date"%>
    <%@page import="com.learnersacademy.model.StudentObj"%>
      <%@page import="javax.servlet.http.HttpSession"%>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
          pageEncoding="ISO-8859-1"%>
          <%@taglib prefix="pt" uri="WEB-INF/print_tags.tld" %>
            <%@page session="false" %>
              <!DOCTYPE html>
              <html>
                <head>
                  <meta charset="ISO-8859-1">
                  <title>View Student</title>


                </head>
                <body>
                  <%
                    HttpSession mySession=request.getSession(false);
                    if(mySession==null){
                    out.print("<center><h3>Your session has expired.. Navigating
                      you to home page.....</h3></center>");
                  response.setHeader("refresh",
                  "5;url='/SchoolManagmentSystem'");
                  }
                  else{
                  @SuppressWarnings("unchecked")
                  List<StudentObj> studentList=(List<StudentObj>)mySession.getAttribute("studentList");
                      if(studentList !=null){
                      Date createTime = new Date(mySession.getCreationTime());
                      %>
                      <h1 style="text-align: center;font-family: tahoma;">Learner's
                        Academy</h1>
                      <p
                        style="Color:green;text-align: center;">You Logged in at
                        <%=createTime %></p>

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


                    <div style="color:#a8a8a8;text-align: center; border: 1px
                      outset
                      #fff9f9;
                      background-color: lightblue;">
                      <%if(mySession.getAttribute("exception")!=null) {%>
                        <%=mySession.getAttribute("exception") %>
                          <%}if(mySession.getAttribute("exceptionSys")!=null)
                            {%>
                            System Error
                            <%=mySession.getAttribute("exceptionSys") %>
                              <%} %>
                              </div>
                              <br/>
                                <h4 style="text-align: center;">Student Details</h4>
                                <br/>

                                  <pt:printStudent studentList="<%=studentList
                                    %>"/>


                                    <br/>
                                      <div style="text-align: center;">
                                        <form action="UpdateStudent"
                                          method="post">
                                          <label>Name: </label>
                                          <input type="text"
                                            name="studentName"
                                            placeholder="Student Name"
                                            style="border-radius: 15px;border:
                                            3px solid aliceblue;padding: 12px;">
                                          <br />
                                          <br />
                                          <label>Date of Birth: </label>
                                          <input type="date"
                                            name="studentDoB" placeholder="Date
                                            of Birth" style="border-radius:
                                            15px;border: 3px solid
                                            aliceblue;padding: 12px;">
                                          <br />
                                          <br />

                                          <input type="submit" name="add"
                                            value="ADD Student"
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