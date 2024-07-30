<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer">
    <%
        request.getSession().removeAttribute("mensaje");
        request.getSession().removeAttribute("imagen");
        request.getSession().removeAttribute("ruta");
    %>
    <center>
        <a class="btn-lg btn-outline-primary" href="index.jsp"> Regresar al inicio </a>
    </center>
</footer>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js" ></script>
</body>
</html>
