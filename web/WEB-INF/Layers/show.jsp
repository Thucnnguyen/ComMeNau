<%-- 
    Document   : show
    Created on : Jun 18, 2022, 8:18:11 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/show.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/png" href="<c:url value="/images/LOGO.jpg"/>"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="header.jsp"></jsp:include>
            <title>Cơm Mẹ Nấu</title>
        </head>

        <body>
                    <div class="header">
                        <a class="logo-link" href="${pageContext.request.contextPath}/home/homePage.do">
                        <img class="logo" src="${pageContext.request.contextPath}/images/LOGO-vertical.png"/>
                    </a>
                </div>

        <div class="body">
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
        </div>

        <div class="footer">
            <img class="footer-img" src="${pageContext.request.contextPath}/images/LOGO-vertical.png" alt=""/>
            <span class="footer-contact"> Company Profile | Follow Us 
                <i class="fa-brands fa-facebook"></i>
                <i class="fa-brands fa-instagram"></i>
                <i class="fa-brands fa-youtube"></i></span>
            <span class="footer-info">Copyrights &COPY; 2022 By Com Me Nau. All Rights Reserved.</span>
        </div>

        <jsp:include page="footer_script.jsp"/>
        <script>
            document.body.onload = ev => {
                initClock()
                }
            
            function updateClock() {
                var now = new Date();
                var hou = now.getHours(),
                        min = now.getMinutes(),
                        sec = now.getSeconds()
                Number.prototype.pad = function (digits) {
                    for (var n = this.toString(); n.length < digits; n = 0 + n)
                        ;
                    return n;
                }
                var ids = ["hour", "minutes"];
                var values = [hou.pad(2), min.pad(2)];
                for (var i = 0; i < ids.length; i++)
                    document.getElementById(ids[i]).firstChild.nodeValue = values[i];
            }
            function initClock() {
                updateClock();
                window.setInterval("updateClock()", 1);
            }
        </script>
    </body>

</html>