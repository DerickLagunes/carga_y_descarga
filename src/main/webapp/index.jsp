<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="header.jsp" />

<h1>Ejemplos de subida y descarga de archivos</h1>
<br/>
<div class="offset-1 col-10">
    <span><strong>Instrucciones: </strong>En equipos y en un archivo de Word que subirán en Classroom, contesta las siguientes preguntas en función de la revisión del código fuente de este sistema Web:<br></span>
    <ol>
        <li>¿Qué dependencias utiliza este proyecto?</li>
        <li>¿Cómo se puede saber que clase de archivos acepta un elemento inpput type="file"?</li>
        <li>En el ejemplo de servlet explica como se puede visualizar la imagen</li>
        <li>¿Para que sirve el objeto sesión qué en el ejemplo de servlet?</li>
        <li>¿Por qué los archivos de imagenes que subes no aparecen en la carpeta img del proyecto pero si en la carpeta target?</li>
        <li>¿Por qué se separo la funcionalidad de esta aplicación en dos servlets?</li>
        <li>¿Cómo podrias hacer que el sistema use solo un servlet para cargar/descargar imagenes en los dos ejemplos?</li>
        <li>¿Cuál es la diferencia en la respuesta de ambos Servlets?</li>
        <li>¿Cuál es la diferencia entre la visualización de las imágenes en las dos vistas?</li>
        <li>¿Por qué conviene utilizar los metodos asincronos sobre los métodos convencionales?</li>
    </ol>
    <br>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Enlace</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <strong>Con servlet</strong>
            </td>
            <td>
                En este ejemplo se sube un archivo
                directamente desde un formulario hasta
                el Servlet donde este se encarga de
                guardarlo.
            </td>
            <td>
                <a href="servlet.jsp">Ejemplo</a>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Con javascript (asincrono)</strong>
            </td>
            <td>
                En este ejemplo se sube un archivo
                desde un formulario pasando por un script
                de JavaScript donde mediante una función
                asincrona se comunica con el Servlet
                donde este se encarga de guardarlo.
            </td>
            <td>
                <a href="javascript.jsp">Ejemplo</a>
            </td>
        </tr>
    </tbody>
</table>
</div>

<jsp:include page="footer.jsp" />