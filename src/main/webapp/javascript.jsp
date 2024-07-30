<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="header.jsp" />

    <div id="msg" class="alert alert-success alert-dismissible fade show" role="alert">
    </div>

    <div id="img" class="row">
    </div>

<br>
<br>
<br>
<form id="uploadForm" enctype="multipart/form-data" action="subirArchivo" method="post">
    <input type="file" id="archivo" name="archivo" accept=".png,.jpeg,.jpg,.gif" required>
    <br>
    <br>
    <button type="button" onclick="uploadFile()">Subir el archivo al Servlet</button>
    <br>
</form>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("msg").hidden = true;
        document.getElementById("img").hidden = true;
    });
</script>

<script>
    function uploadFile(){
        const form = document.getElementById("uploadForm");
        const formData = new FormData(form);

        fetch('subirArchivoJS',{
            method: 'POST',
            body: formData
        }).then(response => {
            return response.text();
        }).then(data => {
            console.log("Respuesta del servidor: ", data);

            let respuesta = JSON.parse(data);

            var msg = document.getElementById("msg");
            msg.hidden = false;
            msg.innerHTML = "";
            var msg_text = document.createElement("strong");
            msg_text.innerText = respuesta.mensaje;
            var msg_button = document.createElement("button");
            msg_button.setAttribute("type", "button");
            msg_button.setAttribute("class", "btn-close");
            msg_button.setAttribute("data-bs-dismiss", "alert");
            msg_button.setAttribute("aria-label", "Close");
            msg.appendChild(msg_text);
            msg.appendChild(msg_button);

            var img = document.getElementById("img");
            img.hidden = false;
            img.innerHTML = "";
            var div = document.createElement("div");
            div.setAttribute("class", "col");
            var imagen = document.createElement("img");
            imagen.setAttribute("src", respuesta.imagen);
            imagen.setAttribute("alt","imagen que subio");
            imagen.setAttribute("class", "img-fluid");
            var enlace = document.createElement("button");
            enlace.setAttribute("onclick", "downloadFile(\""+respuesta.ruta+"\")");
            enlace.setAttribute("class","btn btn-primary");
            enlace.innerHTML = "Descargar la imagen <i class=\"bi-download\"></i>";
            div.appendChild(imagen);
            div.appendChild(enlace);
            img.appendChild(div);

        }).catch(error => {
            console.log("Error al subir el archivo: ", error);
        });
    }
</script>

<script>
    function downloadFile(ruta) {
        // Ruta del archivo en el servidor
        const fileUrl = 'subirArchivoJS?ruta='+ruta;

        // Crear un enlace temporal para iniciar la descarga
        const link = document.createElement('a');
        link.href = fileUrl;
        //link.download = 'example.txt'; // Nombre con el que se guardará el archivo
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }
</script>

<jsp:include page="footer.jsp"/>

