<%-- 
    Document   : categoryPage
    Created on : Oct 21, 2022, 7:20:37 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/css/categoryPage.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/LIB.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <title>Cơm Mẹ Nấu</title>
        <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
    </head>
    <body>
        <div id="jump" class="jump"></div>
        <div class="main" id="showFood">
            <div class="food-title">
                <h2 class="food-title-content">
                    DANH SÁCH CATEGORY
                </h2>
                <div class="food-title-bottom"></div>
                <button class="plus-btn">
                    <a href="<c:url value="/food/newCategory.do"/>"
                       class="text-decoration-none plus-link">
                        <i class="fa-solid fa-circle-plus" style="font-size: 30px;padding-right: 8px;"></i>
                        Tạo Category Mới
                    </a>
                </button>
            </div>
            <div class="grid">
                <div id="content">
                    <table class="table table-striped table-hover">
                        
                        <thead class="table-light">
                            <tr>
                                <th>No</th>
                                <th>Tên Danh Mục</th>
                                <th>Mức Độ Ưu tiên</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="show">
                            <c:forEach items="${categoryList}" var="c" varStatus="loop">
                                <tr style="background: #e8e8e8;">
                                    <td>
                                        ${loop.count}
                                    </td>
                                    <td>
                                        ${c.name}
                                    </td>
                                    <td>
                                        ${c.type}
                                    </td>
                                    <td>
                                        <button    class="view-btn" ><a href="<c:url value="/food/editCategory.do?categoryId=${c.id}"/>">Edit</a></button>
                                    </td>
                                    <td style="padding: 5px 0 0 0;">
                                        <button class="trash-btn" value="${c.id}" onclick="deleteCategory(this)" >
                                            <i class="fa-solid fa-trash-can"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    
                    <div class="modal" id="myModal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2 class="modal-header-title">Danh Mục Chiên</h2>
                                <span class="close">&times;</span>
                            </div>
                            <form action="<c:url value="/home/checkout.do"/>" class="form">
                                <div class="inputbox pt-35">
                                    <label class="label" for="name">Nhập Tên Category Mới:</label>
                                    <input id="name"
                                           class="form-control" type="text" value="${category.name}"  name="name"/>
                                    <label class="label" for="type">Nhập Mức độ ưu tiên:</label>
                                    <input id="type"
                                           class="form-control" type="text" value="${category.type}"  name="type"/>
                                </div>
                                <input type="submit" value="Lưu" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                            function showCategoryDetail(param) {
                                                var categoryId = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/categoryDetail.do",
                                                    type: "get",
                                                    data: {
                                                        categoryId: categoryId
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("myModal");
                                                        row.innerHTML = data;
                                                        document.getElementById("myModal").style.display = "block";
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            function deleteCategory(param) {
                                                var categoryId = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/deleteCategory.do",
                                                    type: "get",
                                                    data: {
                                                        categoryId: categoryId
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("show");
                                                        row.innerHTML = data;
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            // Get the modal
                                            var modal = document.getElementById("myModal");
                                            // Get the button that opens the modal
                                            var btn = document.getElementById("myBtn");
                                            // Get the <span> element that closes the modal
                                            var span = document.getElementsByClassName("close")[0];
                                            // When the user clicks on the button, open the modal
//            btn.onclick = function () {
//                modal.style.display = "block";
//            }
                                            // When the user clicks on <span> (x), close the modal
                                            span.onclick = function () {
                                                modal.style.display = "none";
                                            }
                                            // When the user clicks anywhere outside of the modal, close it
                                            window.onclick = function (event) {
                                                if (event.target == modal) {
                                                    modal.style.display = "none";
                                                }
                                            }
        </script>
    </body>
</html>