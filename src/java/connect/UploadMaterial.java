/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package connect;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Rock
 */
@MultipartConfig
@WebServlet(name = "UploadMaterial", urlPatterns = {"/UploadMaterial"})
public class UploadMaterial extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String program = request.getParameter("program");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String subject = request.getParameter("subject");
        String materialtype = request.getParameter("materialtype");
        String title = request.getParameter("title");
        Part filepart=request.getPart("filename");
        String filename = filepart.getSubmittedFileName();
        InputStream filecontent=filepart.getInputStream();
        DB_manager dm= new DB_manager();
        String query = "insert into material(program, branch, year , subject, materialtype, title, filename, posteddate) values('"+program+"','"+branch+"','"+year+"','"+subject+"','"+materialtype+"','"+title+"','"+filename+"',curdate())";
        if(dm.insertUpdateDelete(query)==true)
        {
            File upload= new File(request.getRealPath("/upload"),filename);
            Files.copy(filecontent, upload.toPath());
            out.print("<script>alert('Material is Uploaded');window.location.href='adminzone/uploadmaterial.jsp';</script>");
            
        }
        else
            {
                out.print("<script>alert('Material is Uploaded');window.location.href='adminzone/uploadmaterial.jsp';</script>");
    
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
