
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Comidas"%>
<%@page import="entidades.Pedido" %>
<%@page import="entidades.Detalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DetalleDAO"%>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>


<%
        HttpSession session3 = request.getSession(false);

        if (session != null) {

        Cliente cli=(Cliente)session3.getAttribute("usuario");
    if(cli!=null){    
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nature Gear</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./css/productos.css">
        <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
        <link rel="icon" href="./graficos/imagenes/horizontes (2).ico" type="image/x-icon">
    </head>

    <body>

        <header class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="./index.jsp">Nature Gear</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./productos.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./carritoCompras.jsp">Ver Carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./historialCompras.jsp">Perfil</a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>

        <div class="container">
            <h1 class="text-center mt-4 mb-4 text-white">Productos de Nature Gear</h1>
            <div class="row">
                <% 
                ComidaDAO comD = new ComidaDAO();
                List<Comidas> lis = comD.imprimir();
                int count = 0;
                for (Comidas pro : lis) {
                    if (count % 3 == 0) {
                        // Start a new row for every third product
                        if (count != 0) {
                            out.println("</div>"); // Close the previous row
                        }
                        out.println("<div class=\"row\">"); // Start a new row
                    }
                %>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="<%= pro.getImg() %>" class="card-img-top" alt="Producto 1">
                        <div class="card-body">
                            <h5 class="card-title"><%= pro.getNombre() %></h5>
                            <p class="card-text">Precio: <%= pro.getPrecio() %></p>
                            <form action="SvUsuario?accion=Agregar" method="Post">
                                <input type="hidden" name="id" value="<%=pro.getId()%>">
                                <button class="btn btn-primary" >Añadir al carrito</button>
                            </form>
                        </div>
                    </div>
                </div>
                <% 
                count++;
            }
            if (count > 0) {
                out.println("</div>"); // Close the last row
            }
                %>
            </div>
        </div>

        <footer class="bg-dark text-white py-4 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h6>Luis Corzo Argüello</h6>
                        <div class="col-md-6">
                            <h5>Redes sociales</h5>
                            <h6>Santiago Jaimes Jaramillo</h6>
                            <ul class="list-inline">
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-facebook"></i></a>
                                </li>
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-twitter"></i></a>
                                </li>
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-instagram"></i></a>
                                </li>
                            </ul>
                            <h6>Luis Corzo Argüello</h6>                        <ul class="list-inline">
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-facebook"></i></a>
                                </li>
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-twitter"></i></a>
                                </li>
                                <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
        </footer>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            const addToCartButtons = document.querySelectorAll(".btn.btn-primary");

            addToCartButtons.forEach(function (button) {
            button.addEventListener("click", function () {
            Swal.fire({
            title:"¡Producto añadido!",
                    text:"El producto ha sido añadido al carrito",
                    icon: "success"
                    
            }).then((result) => {
                if (result.isConfirmed) {
                    // Submit the form
                    button.form.submit();
                }
            });
            });
            });
        </script>

    </body>

</html>
<%
    }else{
response.sendRedirect("index.jsp");
}
}else{
response.sendRedirect("index.jsp");
}


%>