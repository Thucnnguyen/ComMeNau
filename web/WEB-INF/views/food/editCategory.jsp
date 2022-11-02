<%-- 
    Document   : editCategory
    Created on : Oct 27, 2022, 10:11:36 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/editCategory.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">Chỉnh Sửa Danh Mục</h1>
            <form action="<c:url value="/food/updateCategory.do"/>" class="form" >
                <h2 class="text-center"id="cName">${category.name}</h2>
                <input type="hidden" name="id" value="${category.id}" />
                        <div class="inputbox pt-45">
                            <label class="label" for="name">Nhập Tên Danh Mục Mới:</label>
                            <input id="name"
                                   class="form-control" type="text" value="${category.name}"  name="name" required=""/>
                            <br/>
                        </div>
                            <div class="inputbox pt-45">
                            <label class="label" for="type">Mức Độ Ưu Tiên Mới:</label>
                            <input id="type"
                                   class="form-control" type="number" value="${category.type}"  name="type" required=""/>
                            <br/>
                        </div>
                <div class="btn-box">
                    ${message}
                    <a class="create-btn" href="<c:url value="/food/categoryPage.do"/>">Quay Về</a>
                    <input type="submit" value="Lưu" class="create-btn">
                </div>
            </form>
        </div>
    </body>
</html>
