package mx.edu.utez.uiii_t6;


import com.google.gson.Gson;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@MultipartConfig
@WebServlet(name = "SubirArchivoServlet", value = "/subirArchivoJS")
public class SubirArchivoJSServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try{
            ServletContext context = req.getServletContext();
            String UPLOAD_DIRECTORY = context.getRealPath("/") + "assets" + File.separator + "img";
            String filePath = "";

            Part filePart = req.getPart("archivo");
            String fileName = getSubmittedFileName(filePart);
            String uniqueFileName = UUID.randomUUID() + "_" + fileName;
            filePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;
            InputStream fileContent = filePart.getInputStream();
            Files.copy(fileContent, Paths.get(filePath));

            String ruta_relativa = "assets/" + "img/" + uniqueFileName;

            Map<String, String> datos = new HashMap<>();
            datos.put("mensaje", "Archivo cargado en la carpeta de imagenes");
            datos.put("imagen", ruta_relativa);
            datos.put("ruta", filePath.replace("\\","/"));

            Gson json = new Gson();
            String data = json.toJson(datos);

            resp.setContentType("text/json");
            resp.getWriter().write(data);

        } catch(Exception e){
            req.getSession().setAttribute("mensaje","Hubo en error");
        }

    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(
                        element.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param = req.getParameter("ruta");
        File file = new File(param);

        if(file.exists()){
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
            resp.setContentLength((int) file.length());

            try(FileInputStream fis = new FileInputStream(file);
                OutputStream os = resp.getOutputStream()){
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        }else{
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el archivo: " + param + " : " + file.getName());
        }
    }
}
