<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nature Gear - Tienda de Equipos para Actividades al Aire Libre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/lan.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    <!-- Navbar -->
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
                        <a class="nav-link" href="./inicio.jsp">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./registro.jsp">Registrarse</a>
                    </li>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <header id="hero" class="hero text-white text-center py-5">
        <div class="container">
            <h1 class="display-4">Nature Gear</h1>
            <p class="lead">Equipo de calidad para tus aventuras al aire libre</p>
            <a href="./index.jsp" class="btn btn-light btn-lg">Explorar Productos</a>
        </div>
    </header>

    <!-- Products Section -->
    <section id="products" class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Nuestros Productos</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="./graficos/productos/casaCampaña.jpg" class="card-img-top" alt="Producto 1">
                        <div class="card-body">
                            <h5 class="card-title">Tienda de campaña</h5>
                            <p class="card-text">Precio: $150</p>
                            <a href="inicio.jsp"><button class="btn btn-primary" >Ver producto</button></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="./graficos/productos/Mochila.jpg" class="card-img-top" alt="Producto 2">
                        <div class="card-body">
                            <h5 class="card-title">Mochila</h5>
                            <p class="card-text">Precio: $80</p>
                            <a href="inicio.jsp"><button class="btn btn-primary" >Ver producto</button></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="./graficos/productos/lampara.jpg" class="card-img-top" alt="Producto 3">
                        <div class="card-body">
                            <h5 class="card-title">Linterna</h5>
                            <p class="card-text">Precio: $20</p>
                            <a href="inicio.jsp"><button class="btn btn-primary" >Ver producto</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="bg-light py-5">
        <div class="container">
            <h2 class="text-center mb-4">Características Especiales</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature">
                        <i class="fas fa-campground"></i>
                        <h5>Explora la Naturaleza</h5>
                        <p>Descubre lugares increíbles con nuestros equipos de camping y senderismo.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature">
                        <i class="fas fa-water"></i>
                        <h5>Aventuras Acuáticas</h5>
                        <p>Disfruta de deportes acuáticos con nuestras tablas de surf, kayaks y accesorios.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature">
                        <i class="fas fa-mountain"></i>
                        <h5>Escalada y Montañismo</h5>
                        <p>Supera tus límites con nuestro equipo especializado en escalada y montañismo.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section 
    <section id="contact" class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Contáctanos</h2>
            <div class="row">
                <div class="col-md-6">
                    <h4>Información de Contacto</h4>
                    <p><i class="fas fa-envelope"></i> info@naturegear.com</p>
                    <p><i class="fas fa-phone"></i> +1 123 456 7890</p>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Calle Principal, Ciudad, País</p>
                </div>
                <div class="col-md-6">
                    <h4>Envíanos un Mensaje</h4>
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Correo Electrónico">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="5" placeholder="Mensaje"></textarea>
                        </div>
                        <button type="submit" class="btn btn-info">Enviar Mensaje</button>
                    </form>
                </div>
            </div>
        </div>
    </section>-->

    <!-- Footer Section -->
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

    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>