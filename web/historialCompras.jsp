
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
        HttpSession session4 = request.getSession(false);

        if (session != null) {

        Cliente cli=(Cliente)session4.getAttribute("usuario");
    if(cli!=null){    
%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./css/perfil.css">
        <link rel="icon" href="./graficos/imagenes/horizontes.ico" type="image/x-icon">
        <title>Perfil</title>
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
                        <form action="SvUsuario" method="Post">
                            <input type="submit" name="accion" value="Cerrar Sesión" class="btn btn-danger" onclick="cerrarSesion()">
                        </form>
                    </ul>
                </div>
            </div>
        </header>

        <div class="container">
            <h2 class="mt-4 mb-4 text-center text-white">Perfil</h2>

            <div class="row">
                <div class="col-md-6">
                    <div class="card mb-4">
                        <%
                            ClienteDAO clD=new ClienteDAO();
                        Cliente cl=(Cliente)session4.getAttribute("usuario");
                        Cliente usu=clD.buscar_o(cl.getNo_cuenta());
                    
                        %>
                        <div class="card-body">
                            <h3 class="card-title">Datos de Usuario</h3>
                            <label>Nombre: <%=usu.getNombre()%></label><br>
                            <label>Email: <%=usu.getCorreo()%></label><br>
                            <label>Fondos: <i><%=usu.getSaldo()%></i></label><br>
                            <a href="./estadisticas.html" class="btn btn-info mt-4">Ver Estadísticas</a>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">Modificar Datos de Usuario</h3>

                            <form action="SvUsuario?accion=actualizar" method="post">
                                <div class="form-group">
                                    <label for="nombreUsuario">Nombre de Usuario:</label>
                                    <input type="text" class="form-control form-control-sm" id="nombreUsuario" name="nombre" value="<%=usu.getNombre()%>">
                                    <small class="form-text text-muted">Ingrese su nombre de usuario único.</small>
                                </div>
                                <div class="form-group">
                                    <label for="contrasena">Contraseña:</label>
                                    <input type="password" class="form-control form-control-sm" id="contrasena" name="password" value="<%=usu.getContraseña()%>">
                                    <small class="form-text text-muted">Mínimo 8 caracteres, debe contener al menos una
                                        letra mayúscula, una letra minúscula y un número.</small>
                                </div>
                                <button type="submit" class="btn btn-primary mb-4">Guardar Cambios</button>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">Fondos</h3>
                            <form action="SvUsuario?accion=saldo" method="post">

                                <div class="form-group">
                                    <label for="fondos">Cantidad de Fondos:</label>
                                    <input type="number" class="form-control form-control-sm" id="fondos" min="1"
                                           max="999999999999" required title="Valor inválido" maxlength="12" name="saldo">
                                    <input type="number" name="codigo" class="form-control form-control-sm">
                                    <label>Código de tarjeta de regalo</label>
                                </div>

                                <button type="submit" class="btn btn-primary">Ingresar Fondos</button>
                            </form>
                        </div>
                    </div>
                </div>

                <h3 class="mt-4 mb-4 text-center">Historial de Compras</h3>

                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th>Número de Orden</th>
                                <th>Fecha</th>
                                <th>Productos</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                float total=0;
                    PedidoDAO peD = new PedidoDAO();
                    DetalleDAO detD=new DetalleDAO();
                    List<Pedido>lis = peD.visualizar_pedidos_vista_cliente(usu.getNo_cuenta());
                    Comidas com;
                    ComidaDAO comD = new ComidaDAO();
                    for(Pedido ped: lis){
                    int id_p = ped.getId_pedido();
                            %>
                            <tr>
                                <td><%=ped.getId_pedido()%></td>
                                <td><%=ped.getFecha()%></td>
                                <td>
                                    <%
                                    List<Detalle> lisaa=detD.visualizar_detalle(id_p);
                                    for(Detalle detalle: lisaa){
                                    int id_c=detalle.getId_comida();
                                    com=comD.buscarss(id_c);
                                                        total+=detalle.getCantidad()*com.getPrecio();

                                    %>

                                    <%=com.getNombre()%> <BR>
                                    <%}%></td>
                                <td><%=total%></td>
                                <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <footer class="bg-dark text-white py-4 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Contacto</h5>
                        <p>Correos electrónicos:<br>jaimes.jaramillo.santiago@gmail.com<br>luis.corzo.arguello@gmail.com
                        </p>
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

        <script src="./cerra.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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