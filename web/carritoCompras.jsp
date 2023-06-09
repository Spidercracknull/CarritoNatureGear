
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

<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./css/carrito.css">
        <link rel="icon" href="./graficos/imagenes/horizontes (2).ico" type="image/x-icon">
        <title>Carrito de Compras</title>
    </head>

    <body>
        <header class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Nature Gear</a>
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

        <div class="container mb-4">
            <h2 class="mt-4 mb-4 text-center text-white">Canasta</h2>

            <table class="table table-dark mb-4">
                <thead>
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
        Comidas com;
        ComidaDAO comD=new ComidaDAO();
        List<Detalle> carrito = (List<Detalle>)session.getAttribute("carrito");
        if (carrito != null) {
        for (Detalle pro : carrito) {
        float subtotal=pro.getPrecio()*pro.getCantidad();
        
        com=comD.buscarss(pro.getId_comida());
                    %>
                    <tr>
                        <td><%=com.getNombre()%></td>
                        <td><%=com.getDescripcion()%></td>
                <form action="SvUsuario?accion=guardar" method="Post">
                    <td>
                        <input type="hidden" name="id" value="<%=pro.getId_comida()%>">
                        <input type="number" name="cantidad" class="form-control" max="<%=com.getEstado()%>" min="1" max="10" value="<%=pro.getCantidad()%>">
                    </td>
                    <td class="text-center"><button class="btn btn-light">Guardar</button></td> 
                </form>
                <form action="SvUsuario?accion=eliminar" method="Post">
                    <input type="hidden" name="id" value="<%=pro.getId_comida()%>">
                    <td class="text-center"><button class="btn btn-danger" type="submit">Remover</button></td>
                </form>
                <td><%=subtotal%></td>
                </tr><%
                    }
}

                
                %>
                <!-- Agrega más filas según tus necesidades -->
                </tbody>
            </table>

            <div class="ticket mb-4">
                <h4 class="ticket-heading">Nature Gear-Ticket</h4>
                <table class="table ticket-table">
                    <thead>
                        <tr>
                            <th scope="col">Producto</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio Unitario</th>
                            <th scope="col">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        float totals=0;
                        for(Detalle p :carrito){
                        float subtotal=p.getPrecio()*p.getCantidad();
        totals+=subtotal;
        com=comD.buscarss(p.getId_comida());
                        %>
                        <tr>
                            <td><%=com.getNombre()%></td>
                            <td><%=p.getCantidad()%></td>
                            <td><%=com.getPrecio()%></td>
                            <td><%=subtotal%></td>
                        </tr>
                        <%
                            }%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="3" class="text-right">Total:</th>
                            <th><%=totals%></th>
                        </tr>
                    </tfoot>
                </table>

                <div class="text-center">
                    <%
            if(carrito!=null){
            if(totals<=cli.getSaldo() && !carrito.isEmpty()){
            %>
                    <form action="SvUsuario?accion=realizar" method="post">
                    <button class="btn btn-success buy-button">Comprar</button>
                    </form>
                    <%
                        }
}%>
                </div>
            </div>

        </div>

        <footer class="bg-dark text-white py-4 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Contacto</h5>
                        <p>Correos electrónicos:<br>jaimes.jaramillo.santiago@gmail.com<br>luis.corzo.arguello@gmail.com</p>
                        <p>Teléfonos:<br>55-2673-1610<br>123-456-7890</p>
                    </div>
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
                        <h6>Luis Corzo Arguello</h6>
                        <ul class="list-inline">
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

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            document.querySelector(".buy-button").addEventListener("click", function () {
                // Lógica para realizar la compra
                Swal.fire("¡Compra realizada!", "Gracias por tu compra", "success");
            });

            document.querySelectorAll(".btn-danger").forEach(function (button) {
                button.addEventListener("click", function () {
                    // Lógica para remover un producto del carrito
                    Swal.fire("Producto removido", "El producto ha sido removido del carrito", "success");
                    // Aquí puedes agregar la lógica para eliminar la fila correspondiente en la tabla
                });
            });
            // Agrega un evento de clic al botón "Guardar"
            document.querySelectorAll(".btn-light").forEach(function (button) {
                button.addEventListener("click", function () {
                    Swal.fire({
                        title: "Guardar",
                        text: "¿Estás seguro de que deseas guardar?",
                        icon: "question",
                        showCancelButton: true,
                        confirmButtonText: "Guardar",
                        cancelButtonText: "Cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: "Guardado",
                                text: "Los datos se han guardado correctamente",
                                icon: "success",
                                onClose: function () {
                                    button.closest("form").submit();
                                }
                            });
                        }
                    });
                });
            });
        </script>
    </body>

</html>
<%
    }
else{
response.sendRedirect("index.jsp");
}
}
else{
response.sendRedirect("index.jsp");
}


%>