<%-- 
    Document   : QLNguoiDung.jsp
    Created on : May 19, 2023, 1:10:21 AM
    Author     : Windows 10 TIMT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>QL nguoi dung</h1>
        <h1></h1>
        <table>
            <thead>
            <th>Mã</th>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.users}" var="user">
                    <td>${user.user_id}</td>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
