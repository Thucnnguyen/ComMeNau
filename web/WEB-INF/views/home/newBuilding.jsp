<%-- 
    Document   : newBuilding
    Created on : Oct 24, 2022, 11:00:39 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/newMeal.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main" style="padding-top: 3rem">
            <h1 class="title">Thêm Building Mới</h1>
            <form action="<c:url value="/admin/newBuilding.do"/>" class="form">
                <div class="inputbox pt-45">
                    <label for="buildingName" class="label">Tên:</label>
                    <input class="form-control" type="text" name="buildingName" id="buildingName" value="${buildingName}">
                    <br/>
                </div>  
                <div class="btn-box">
                    ${message}
                    <a class="create-btn" href="<c:url value="/home/buildingPage.do"/>">Quay Về</a>
                    <input type="submit" value="Thêm" class="create-btn">
                </div>
            </form>
        </div>
    </body>
</html>