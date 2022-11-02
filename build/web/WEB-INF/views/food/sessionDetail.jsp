<%-- 
    Document   : sessionDetail
    Created on : Oct 25, 2022, 4:33:15 PM
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
        <link href="${pageContext.request.contextPath}/css/sessionDetail.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/LIB.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <title>Cơm Mẹ Nấu</title>
    </head>
    <body>
        <div class="main" >
            <div class="food-title">
                <h1 class="food-title-content">
                    Mã Đơn Hàng: ${code}
                </h1>
            </div>
            <div class="grid">
                <div class="row">
                    <div id="content" class="col l-9">
                        <div class="other-meal m-0">
                            <h2 class="other-meal-content">
                                Đầu Bếp
                            </h2>
                            <div class="other-meal-bottom"></div>
                        </div>

                        <table class="table table-striped table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>No.</th>
                                    <th>Tên Đầu Bếp</th>
                                    <th>Số Mâm Đã Bán</th>
                                    <th>Địa Chỉ</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${chefList}" var="chef" varStatus="Loop">
                                    <tr style="background-color: white">
                                        <td>${loop.count}</td>
                                        <td>${chef.name}</td>
                                        <td>${quantityChef[chef.id]}</td>
                                        <td>${buildingListChef[chef.id].name}</td>
                                    </tr> 
                                </c:forEach>


                            </tbody>
                        </table>
                        <div class="other-meal">
                            <h2 class="other-meal-content">
                                Mâm Cơm
                            </h2>
                            <div class="other-meal-bottom"></div>
                        </div>
                        <div class="row">
                            <c:forEach items="${mealList}" var="meal">
                                <div class="col l-4 c-12 m-6">
                                    <div class="card">
                                        <div class="card-top">
                                            <img src="${pageContext.request.contextPath}/images/${meal.images[0]}" class="card-img-big">
                                            <h5 class="card-title">${meal.name}</h5>
                                        </div>
                                        <div class="card-body row">
                                            <p class="card-chef">
                                                <span class="card-chef-pre">Số Đơn Đã Bán: </span>
                                                ${quantityMeal[meal.id]}
                                            </p> 
                                            <p class="card-price">
                                                <span class="card-price-pre">Tổng Doanh Thu</span>
                                                <fmt:formatNumber
                                                    value="${meal.price}"
                                                    pattern="#,### VND"/>
                                            </p>       
                                            <p class="card-chef">
                                                <span class="card-chef-pre">Đầu Bếp: </span>
                                                ${meal.chefId.name}
                                            </p>           
                                        </div>
                                    </div> 
                                </div>                  
                            </c:forEach>
                        </div>
                        <div class="btn-box">
                            <a class="create-btn" href="<c:url value="/food/sessionPage.do"/>">Quay Về</a>
                        </div>
                    </div>
                    <div class="col l-3">
                        <div class="row date">
                            <div class="col l-6 date-left">
                                <i class="fa-solid fa-calendar-days date-icon"></i>
                            </div>
                            <div class="col l-6 date-right p-0">
                                <h4 class="date-time-header">Khung Giờ</h4>
                                <h5 class="date-time">${session.fromto}</h5>
                                <h4 class="date-time-header">Ngày</h4>
                                <h5 class="date-time">${session.day}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <script>
            //    // Get the button that opens the modal
            //    var btn = document.querySelectorAll("button.modal-button");
            //// All page modals
            //    var modals = document.querySelectorAll('.modal');
            //// Get the <span> element that closes the modal
            //    var spans = document.getElementsByClassName("close");
            //// When the user clicks the button, open the modal
            //    for (var i = 0; i < btn.length; i++) {
            //        btn[i].onclick = function (e) {
            //            e.preventDefault();
            //            modal = document.querySelector(e.target.getAttribute("href"));
            //            modal.style.display = "block";
            //        }
            //    }
            //// When the user clicks on <span> (x), close the modal
            //    for (var i = 0; i < spans.length; i++) {
            //        spans[i].onclick = function () {
            //            for (var index in modals) {
            //                if (typeof modals[index].style !== 'undefined')
            //                    modals[index].style.display = "none";
            //            }
            //        }
            //    }
            //// When the user clicks anywhere outside of the modal, close it
            //    window.onclick = function (event) {
            //        if (event.target.classList.contains('modal')) {
            //            for (var index in modals) {
            //                if (typeof modals[index].style !== 'undefined')
            //                    modals[index].style.display = "none";
            //            }
            //        }
            //    }
        </script>
    </body>
</html>