<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.sh.login.LoginDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h2>Product List</h2>
    <%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
    if (user != null && selectedUser != null) {
%>
    <h2>Welcome, <%= selectedUser.getUser_nickname() %></h2>
<%
    }
%>
    <form action="/testing/products" method ="post">
    <table border="1">
        <thead>
            <tr>
                <th>제목</th>
                <th>시간</th>
                <th>작성자</th>
                <th>지역</th>
                <th>가격</th>
                <th>조회수</th>
                <th>사진</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><a href="/testing/products/detail?boardId=${product.board_Id}">${product.board_Title}</a></td>
                    <td>${product.board_Date}</td>
                    <td>${product.user_nickname}</td>
                    <td>${product.loc_code}/${product.detail_loc}</td>
                    <td>${product.board_Price}</td>
                    <td>${product.board_Click }</td>
                    <td><img src="<c:url value="/images/${product.board_Img}" />" alt="Product Image" style="max-width: 100px; max-height: 100px;"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>

    <a href="/testing/products/add">Add Product</a>
    </form>
</body>
</html>