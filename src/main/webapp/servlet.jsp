<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="header.jsp" />

<c:if test="${not empty mensaje}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>${mensaje}.</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${not empty imagen}">
    <div class="row">
        <div class="col">
            <img src="${imagen}" alt="imagen que subio" class="img-fluid"/>
            <a href="subirArchivo?ruta=${ruta}" class="btn btn-primary">
                Descargar la imagen
                <i class="bi-download"></i>
            </a>
        </div>
    </div>
</c:if>
<br>
<br>
<br>
<form enctype="multipart/form-data" action="subirArchivo" method="post">
    <input type="file" id="archivo" name="archivo" accept=".png,.jpeg,.jpg,.gif" required>
    <br>
    <br>
    <input type="submit" value="Subir el archivo al Servlet">
    <br>
</form>

<jsp:include page="footer.jsp" />
