<%-- 
    Document   : newCategory
    Created on : Oct 25, 2022, 6:56:45 AM
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
            <h1 class="title">Thêm Danh Mục Mới</h1>
            <form action="<c:url value="/food/createCategory.do"/>" class="form">
                <div class="inputbox pt-45">
                    <label for="categoryName" class="label">Tên:</label>
                    <input class="form-control" type="text" name="categoryName" id="categoryName" value="${categoryName}" required="">
                    <br/>
                </div>  
                <div class="inputbox pt-45">
                    <label for="categoryType" class="label">Độ Ưu Tiên:</label>
                    <input class="form-control" type="number" name="categoryType" id="categoryType" value="${categoryType}" required="" />
                    <br/>
                </div>      
                <div class="btn-box">
                    ${message}
                    <a class="create-btn" href="<c:url value="/food/categoryPage.do"/>">Quay Về</a>
                    <input type="submit" value="Thêm" class="create-btn">
                </div>
            </form>
        </div>
    </body>
</html>