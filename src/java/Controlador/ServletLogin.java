/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ClienteDAO;
import entidades.Cliente;
import entidades.Detalle;
import entidades.Validar;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validar v=new Validar();
        HttpSession session = request.getSession();
        String error="";
        String usuario=request.getParameter("correo");
        String contra=request.getParameter("password");
        System.out.println(usuario);
        System.out.println(contra);
        if( v.validarS(usuario)!=null && v.validarS(contra)!=null){
            ClienteDAO usuD=new ClienteDAO();
            Cliente usu=usuD.login(usuario, contra);
            if(usu!=null)
            {
                session.setAttribute("usuario", usu);
                response.sendRedirect("productos.jsp");   
            }
            
            else{
                response.sendRedirect("registrar.jsp");
            }
        }
        else{
            response.sendRedirect("error.jsp");
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
