<%-- 
    Document   : newBuilding
    Created on : Oct 24, 2022, 12:27:55 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/newFood.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
            <h1 class="title">Tạo Ra Mâm Cơm Của Riêng Bạn</h1>
                    <div class="modal-header justify-content-center">
                        <h2 class="modal-header-title" id="bName">${building.name}</h2>
                    </div>
                    <form action="<c:url value="/admin/updateBuilding.do"/>" class="form" >
                        <input type="hidden" name="bId" value="${building.bId}" />
                        <div class="inputbox pt-45">
                            <label class="label" for="name">Nhập Tên Building Mới:</label>
                            <input id="bName"
                                   class="form-control" type="text" value="${name}"  name="name"/>
                            <br/>
                        </div>
                        <a class="create-btn" href="<c:url value="/home/buildingPage.do"/>">Quay lại</a>
                        <input class="create-btn" type="submit" value="Lưu" />
                        ${message}
                    </form>
        </div>
    </body>
</html>
