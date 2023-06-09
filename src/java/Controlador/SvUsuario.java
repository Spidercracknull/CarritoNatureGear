/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ComidaDAO;
import DAO.PedidoDAO;
import DAO.ClienteDAO;
import DAO.DetalleDAO;
import entidades.Comidas;
import entidades.Pedido;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author artem
 */
public class SvUsuario extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validar v = new Validar();
        HttpSession session = request.getSession();
        if (session != null) {
            ClienteDAO usuD = new ClienteDAO();
            Cliente usu = (Cliente) session.getAttribute("usuario");
            Comidas com;
            PedidoDAO peD = new PedidoDAO();
            ComidaDAO comD = new ComidaDAO();
            DetalleDAO detD = new DetalleDAO();
            String accion = request.getParameter("accion");
            System.out.println("si");
            if (usu != null) {
                if (accion != null) {
                    switch (accion) {
                        case "realizar" -> {
                            try {
                                usu = (Cliente) session.getAttribute("usuario");
                                if (usu != null) {
                                    float saldo_mayor = usu.getSaldo();
                                    float total = 0;
                                    List<Detalle> carrito = (List<Detalle>) session.getAttribute("carrito");
                                    if (carrito != null) {
                                        for (Detalle d : carrito) {
                                            total += d.getCantidad() * d.getPrecio();
                                        }
                                        if (saldo_mayor >= total) {
                                            Date fechasActual = new Date();

                                            // Formatear la fecha y hora al formato deseado (yyyy-MM-dd HH:mm:ss)
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                            String fechaActual = sdf.format(fechasActual);

                                            int id_pedido = peD.id();
                                            if (id_pedido > 0) {
                                                boolean bandera = peD.pedir(usu, fechaActual, id_pedido, total);
                                                if (bandera == true) {
                                                    session = request.getSession(false);
                                                    List<Detalle> carritos = (List<Detalle>) session.getAttribute("carrito");
                                                    for (Detalle detalle : carritos) {
                                                        int id = detalle.getId_comida();
                                                        boolean dep = detD.pedir(id, id_pedido, detalle.getCantidad());
                                                        if (dep == true) {
                                                            int cantidadTotal = comD.buscarStock(id) - detalle.getCantidad();
                                                            comD.cambiar_stock(cantidadTotal, id);
                                                        } else {
                                                            response.sendRedirect("error.jsp");
                                                        }
                                                    }

                                                    float resta = total;
                                                    float saldo = saldo_mayor - resta;

                                                    boolean res = usuD.restar(usu.getNo_cuenta(), saldo);
                                                    if (res == true) {
                                                        List<Detalle> carritso = (List<Detalle>) session.getAttribute("carrito");
                                                        carritso.clear();
                                                        response.sendRedirect("historialCompras.jsp");
                                                    } else {
                                                        System.out.println("5");
                                                        response.sendRedirect("error.jsp");
                                                    }
                                                } else {
                                                    System.out.println("4");
                                                    response.sendRedirect("error.jsp");
                                                }
                                            }
                                        } else {
                                            System.out.println("3");
                                            response.sendRedirect("error.jsp");
                                        }
                                    } else {
                                        System.out.println("2");
                                        response.sendRedirect("error.jsp");
                                    }
                                } else {
                                    System.out.println("1");
                                    response.sendRedirect("error.jsp");
                                }

                            } catch (Exception e) {
                                System.out.println("cat");
                                response.sendRedirect("error.jsp");
                            }
                        }

                        case "Cerrar Sesión" -> {
                            session.invalidate();
                            response.sendRedirect("index.jsp");
                        }
                        case "eliminar" -> {
                            String id = request.getParameter("id");
                            if (v.validaRnUM(id) > 0) {
                                try {
                                    List<Detalle> carrito = (List<Detalle>) session.getAttribute("carrito");
                                    int idProducto = Integer.parseInt(id);
                                    if (carrito != null) {
                                        Iterator<Detalle> iterator = carrito.iterator();
                                        while (iterator.hasNext()) {
                                            Detalle detalle = iterator.next();
                                            if (detalle.getId_comida() == idProducto) {
                                                iterator.remove();
                                                response.sendRedirect("carritoCompras.jsp");
                                                break;
                                            }
                                        }
                                    } else {
                                        response.sendRedirect("error.jsp");
                                    }
                                } catch (Exception e) {
                                    System.out.println("Error :" + e);
                                    response.sendRedirect("error.jsp");
                                }
                            } else {
                                response.sendRedirect("error.jsp");
                            }
                        }
                        case "actualizar" -> {
                            try {
                                Cliente us = (Cliente) session.getAttribute("usuario");
                                if (v.validarS(request.getParameter("nombre")) != null && v.validarS(request.getParameter("password")) != null) {
                                    int id = us.getNo_cuenta();
                                    String nom = request.getParameter("nombre");
                                    String pas = request.getParameter("password");
                                    boolean b = peD.act(id, nom, pas);
                                    if (b == true) {
                                        response.sendRedirect("historialCompras.jsp");
                                    } else {
                                        System.out.println("2");
                                        response.sendRedirect("error.jsp");
                                    }

                                } else {
                                    System.out.println("1");
                                    response.sendRedirect("error.jsp");
                                }

                            } catch (Exception e) {
                                System.out.println("32");
                                response.sendRedirect("error.jsp");
                            }
                        }
                        case "Agregar" -> {
                            if (v.validaRnUM(request.getParameter("id")) > 0) {
                                int idComida = Integer.parseInt(request.getParameter("id"));
                                comD = new ComidaDAO();
                                com = comD.buscarss(idComida);
                                int cantidad = 1;
                                if (com.getCantidad() <= cantidad) {
                                    Detalle detalles = new Detalle(idComida, cantidad, com.getNombre(), com.getPrecio());

                                    List<Detalle> carritos = (List<Detalle>) request.getSession().getAttribute("carrito");
                                    if (carritos == null) {
                                        carritos = new ArrayList<>();
                                        session.setAttribute("carrito", carritos);
                                        carritos.add(detalles);
                                        response.sendRedirect("carritoCompras.jsp");
                                    } else {
                                        boolean b = false;
                                        Iterator<Detalle> iterator = carritos.iterator();
                                        while (iterator.hasNext()) {
                                            Detalle detalle = iterator.next();
                                            if (detalle.getId_comida() == idComida) {
                                                b = true;
                                                detalle.setCantidad(detalle.getCantidad() + 1);
                                                response.sendRedirect("carritoCompras.jsp");
                                            }

                                        }
                                        if (b == false) {
                                            carritos.add(detalles);
                                            response.sendRedirect("carritoCompras.jsp");
                                        }
                                    }
                                } else {
                                    response.sendRedirect("error.jsp");
                                    System.out.println("2");
                                }

                            } else {
                                response.sendRedirect("error.jsp");
                                System.out.println("3");
                            }
                        }
                        case "guardar" -> {
                            if (v.validaRnUM(request.getParameter("id")) > 0 && v.valCant(request.getParameter("cantidad")) > 0) {
                                int idProducto = Integer.parseInt(request.getParameter("id"));
                                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                                List<Detalle> carrito = (List<Detalle>) session.getAttribute("carrito");
                                if (carrito != null) {
                                    Iterator<Detalle> iterator = carrito.iterator();
                                    while (iterator.hasNext()) {
                                        Detalle detalle = iterator.next();
                                        if (detalle.getId_comida() == idProducto) {
                                            detalle.setCantidad(cantidad);
                                            response.sendRedirect("carritoCompras.jsp");
                                            break;
                                        }
                                    }
                                } else {
                                    response.sendRedirect("error.jsp");
                                }

                            } else {
                                response.sendRedirect("error.jsp");
                            }
                        }
                        case "saldo" -> {
                            if (v.validarSaldo(request.getParameter("saldo")) > 0 && v.validarC(request.getParameter("codigo"))>0) {
                                float saldo_mayor = Float.parseFloat(request.getParameter("saldo"));
                                System.out.println("flsña");
                                if (usu != null) {
                                    if(peD.consultar(Double.parseDouble(request.getParameter("codigo")))==true){
                                    float total = saldo_mayor + usu.getSaldo();
                                    boolean pedi = usuD.guardar_saldo(total, usu.getNo_cuenta());
                                    if (pedi == true) {
                                        response.sendRedirect("historialCompras.jsp");
                                    } else {
                                        response.sendRedirect("error.jsp");
                                        System.out.println("sa");
                                    }
                                }
                                    else{
                                    response.sendRedirect("carritoCompras.jsp");
                                    }
                                }else {
                                    response.sendRedirect("error.jsp");
                                    System.out.println("ds");
                                }

                            } else {
                                response.sendRedirect("error.jsp");
                                System.out.println("ew");
                            }
                        }
                        default -> {
                            response.sendRedirect("error.jsp");
                        }
                    }
                } else {
                    response.sendRedirect("error.jsp");
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
