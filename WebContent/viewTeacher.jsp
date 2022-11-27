<%@page import="java.util.List"%>
  <%@page import="java.util.Date"%>
    <%@page import="com.learnersacademy.model.TeacherObj"%>
      <%@page import="javax.servlet.http.HttpSession"%>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
          pageEncoding="ISO-8859-1"%>
          <%@taglib prefix="pt" uri="WEB-INF/print_tags.tld" %>
            <%@page session="false" %>
              <!DOCTYPE html>
              <html>
                <head>
                  <meta charset="ISO-8859-1">
                  <title>View Teacher</title>
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
                  List<TeacherObj> teacherList=(List<TeacherObj>)mySession.getAttribute("teacherList");
                      if(teacherList !=null ){
                      Date createTime = new Date(mySession.getCreationTime());
                      %>
                      <h1 style="text-align: center;font-family: tahoma;">Learner's
                        Academy</h1><b style="text-align: center;font-family:
                        tahoma;Color:green">You Logged in at <%=createTime %></b>
                        <div style="text-align:center">
                          <div style="text-align: center;">
                            <a href="/SchoolManagmentSystem/Dashboard.jsp"
                              style="border:
                              1px solid gray;padding: 7px;border-radius:
                              20px;color:
                              black;font-size: 19px;">Dashboard</a>
                            <a href="logout" style="border: 1px solid
                              gray;padding:
                              7px;border-radius: 20px;color: black;font-size:
                              19px;">logout</a>
                          </div>
                          <br/>

                            <div style="color:#a8a8a8;text-align: center;
                              border: 1px
                              outset
                              #fff9f9;
                              background-color: lightblue;">
                              <%if(mySession.getAttribute("exception")!=null)
                                {%>
                                <%=mySession.getAttribute("exception") %>
                                  <%}if(mySession.getAttribute("exceptionSys")!=null)
                                    {%>
                                    System Error
                                    <%=mySession.getAttribute("exceptionSys") %>
                                      <%} %>
                                      </div>
                                      <br/>
                                        <h4 style="text-align: center;">Teacher
                                          Details</h4>

                                        <br/>
                                          <pt:printTeacher teacherList="<%=teacherList
                                            %>"/>
                                            <br/>
                                              <br/>
                                              <form action="UpdateTeacher"
                                              method="post">
                                              <label>Teacher Name: </label>
                                              <input
                                                type="text"
                                                name="teacherName"
                                                placeholder="Teacher
                                                Name"
                                                style="border-radius:
                                                15px;border: 3px solid
                                                aliceblue;padding: 12px;">
                                                <br />
                                                <br />
                                              <label>Teacher Category:
                                              </label>
                      
                                              <input
                                                type="text"
                                                name="teacherCategory"
                                                placeholder="(Permanent/Temporary)"
                                                style="border-radius:
                                                15px;border: 3px solid
                                                aliceblue;padding: 12px;">
                                                <br />
                                                <br />
                      
                                            <label>Experience: </label>
                                            <input
                                              type="number"
                                              name="experience"
                                              min="0"
                                              placeholder="Experience"
                                              style="border-radius:
                                              15px;border: 3px solid
                                              aliceblue;padding: 12px;">
                                              <br />
                                              <br />
                      
                                            <input
                                              type="submit"
                                              name="add" value="ADD TEACHER"
                                              style="background-color:
                                              white;color: blue;padding: 9px
                                              37px;border: 1px solid
                                              blue;border-radius:
                                              20px;margin-top:
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