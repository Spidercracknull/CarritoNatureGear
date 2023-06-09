/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ClienteDAO;
import entidades.Cliente;
import entidades.Validar;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author artem
 */
public class ServletRegistro extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
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
        System.out.println("jfñla");
        Validar v = new Validar();
        ClienteDAO usuD = new ClienteDAO();
        Cliente usu = new Cliente();
        HttpSession session = request.getSession();
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("password");
        System.out.println(nombre);
        System.out.println(usuario);
        System.out.println(contra);
        float saldo = 0;
        if (v.validarS(nombre) != null && v.validarS(usuario) != null && v.validarS(contra) != null) {
            Cliente clis = usuD.login(usuario, contra);
            if (clis == null) {
                System.out.println("3w");
                usu = new Cliente(
                        usuD.nocuenta(),
                        nombre,
                        usuario,
                        contra,
                        saldo
                );
                boolean bandera = usuD.registrar(usu);
                if (bandera == true) {
                    session.setAttribute("usuario", usu);
                    response.sendRedirect("productos.jsp");
                } else {
                    System.out.println("dws");
                    response.sendRedirect("inicio.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");

            }
        }
        else{
        response.sendRedirect("error.jsp");
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
