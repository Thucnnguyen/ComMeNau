<%-- 
    Document   : orderPage
    Created on : Oct 20, 2022, 9:19:47 AM
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
        <link href="${pageContext.request.contextPath}/css/orderPage.css" rel="stylesheet" type="text/css"/>
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
                    DANH SÁCH SESSION
                </h2>
                <div class="food-title-bottom"></div>
            </div>
            <div class="grid">
                <div class="timeline">
                    <ul class="timeline-list">
                        <li class="timeline-item"><button value="2" onclick="showOrderByStatus(this)" class="timeline-btn">Đã Hoàn Thành</button>
                        <li class="timeline-item"><button value="1" onclick="showOrderByStatus(this)" class="timeline-btn">Đang Xử Lý</button>
                        <li class="timeline-item"><button value="0" onclick="showOrderByStatus(this)" class="timeline-btn">Đơn đã hủy</button>
                    </ul>
                </div>
<!--                <div class="sort">
                    <form action="">
                    <span class="sort-bar-label">Lựa Chọn Thời Gian: </span>
                    <select class="sort-option" name="fromTo" id="fromTo">
                                                <option>11-13</option>
                                                <option>17-19</option>
                        <c:forEach items="${timelines}" var="t">
                            <option value="${t}">${t}</option>
                        </c:forEach>
                    </select>
                    <select class="sort-option" name="day" id="day">
                                                <option>24/10</option>
                                                <option>25/10</option>
                        <c:forEach items="${days}" var="d">
                            <option value="${d}">${d}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Tìm Kiếm" onclick="searchOrderbySession()" />
                    </form>-->

                </div>    
                <div id="content">
                    <div class="sort">
                        <!--<form action="">-->
                        <span class="sort-bar-label">Lựa Chọn Thời Gian: </span>
                        <select class="sort-option" name="fromTo" id="fromTo">
                            <!--                        <option>11-13</option>
                                                    <option>17-19</option>-->
                            <c:forEach items="${timelines}" var="t">
                                <option value="${t}">${t}</option>
                            </c:forEach>
                        </select>
                        <select class="sort-option" name="day" id="day">
                            <!--                        <option>24/10</option>
                                                    <option>25/10</option>-->
                            <c:forEach items="${days}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Tìm Kiếm" onclick="searchOrderbySession()" />
                        <!--</form>-->

                    </div>    
                    <table class="table table-striped table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Customer Name</th>
                                <th>Customer Address</th>
                                <th>From - To</th>
                                <th>Date</th>
                                <th>Price</th>
                                <th>Payment Method</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="showOrder">
                            <c:forEach items="${orderList}" var="order">
                                <tr style="background: #e8e8e8;">
                                    <td>
                                        ${order.id}
                                    </td>
                                    <td>
                                        ${order.cusName}
                                    </td>
                                    <td>
                                        ${bulding[order.id].name}
                                    </td>
                                    <td>
                                        ${session[order.id].fromto}
                                    </td>
                                    <td>
                                        ${session[order.id].day}
                                    </td>
                                    <td>
                                        ${order.price}
                                    </td>
                                    <td>
                                        ${payment[order.id].type}
                                    </td>
                                    <td>
                                        <button value="${order.id}" class="text-decoration-none" onclick="acceptOrder(this)">Accept</button> | 
                                        <button value="${order.id}" class="text-decoration-none" onclick="denyOrder(this)">Deny</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                            function searchByName(param) {
                                                var txtSearch = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/searchAjax.do",
                                                    type: "get",
                                                    data: {
                                                        Search: txtSearch
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("content");
                                                        row.innerHTML = data;
                                                        var page = document.getElementById("pagination");
                                                        page.style.display = "none";
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            function searchOrderbySession() {
                                                var fromTo = document.getElementById("fromTo").value;
                                                var day = document.getElementById("day").value;
                                                $.ajax({
                                                    url: "/comMeNau/food/searchOrder.do",
                                                    type: "get",
                                                    data: {
                                                        fromTo: fromTo,
                                                        day: day
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("showOrder");
                                                        row.innerHTML = data;

                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            function showFood(param) {
                                                var category = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/foodPageAjax.do",
                                                    type: "get",
                                                    data: {
                                                        categoryName: category
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("showFood");
                                                        row.innerHTML = data;
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            function showOrderByStatus(param) {
                                                var status = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/showOrderByStatus.do",
                                                    type: "get",
                                                    data: {
                                                        status: status
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("content");
                                                        row.innerHTML = data;
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            function acceptOrder(param) {
                                                var orderId = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/acceptOrder.do",
                                                    type: "get",
                                                    data: {
                                                        orderId: orderId
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("showOrder");
                                                        row.innerHTML = data;
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            denyOrder
                                            function denyOrder(param) {
                                                var orderId = param.value;
                                                $.ajax({
                                                    url: "/comMeNau/food/denyOrder.do",
                                                    type: "get",
                                                    data: {
                                                        orderId: orderId
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("showOrder");
                                                        row.innerHTML = data;
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }
                                            const upBtn = document.getElementById("up");
                                            const downBtn = document.getElementById("down");
                                            downBtn.addEventListener("click", function () {
                                                if (downBtn.classList.contains("display-none")) {
                                                    downBtn.classList.remove('display-none')
                                                    upBtn.classList.add('display-none')
                                                }
                                            })
                                            window.addEventListener("scroll", function () {
                                                if (window.pageYOffset >= 88) {
                                                    downBtn.classList.add('display-none')
                                                    upBtn.classList.remove('display-none')
                                                } else {
                                                    downBtn.classList.remove('display-none')
                                                    upBtn.classList.add('display-none')
                                                }
                                            })
        </script>
    </body>
</html>