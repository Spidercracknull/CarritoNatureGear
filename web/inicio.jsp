<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/index.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="icon" href="./graficos/imagenes/horizontes (2).ico" type="image/x-icon">
    <title>Iniciar Sesión</title>
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
                        <span class="navbar-text">Vive la naturaleza intensamente con Nature Gear</span>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center">Iniciar sesión</h3>
                        <form action="ServletLogin" method="post">
                            <div class="form-group">
                                <label for="username">Nombre de usuario</label>
                                <input type="text" class="form-control" id="username"
                                    placeholder="Ingrese su nombre de usuario" name="correo">
                                <small class="form-text text-muted">Ingrese su correo.</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password"
                                    placeholder="Ingrese su contraseña" name="password">
                                <small class="form-text text-muted">Mínimo 8 caracteres, debe contener al menos una
                                    letra mayúscula, una letra minúscula y un número.</small>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
                            </div>
                            <p class="text-center">¿No tienes una cuenta? <a href="./registro.jsp">Regístrate aquí</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Contacto</h5>
                    <p>Correos electrónicos: <br>jaimes.jaramillo.santiago@gmail.com<br>luis.corzo.arguello@gmail.com
                    </p>
                    <p>Teléfonos: <br>55-2673-1610 <br>123-456-7890 </p>
                </div>
                <div class="col-md-6">
                    <h5>Redes sociales</h5>
                    <h6>Santiago Jaimes Jaramillo</h6>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                    <h6>Luis Corzo Argüello</h6>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a class="text-white" href="#"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    <script>
        document.querySelector("form").addEventListener("submit", function (event) {
            event.preventDefault();

            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

            if (!passwordRegex.test(password)) {
                Swal.fire("Error", "Contraseña inválida", "error");
                return;
            }

            Swal.fire("Inicio de sesión exitoso", "¡Bienvenido!", "success");
            this.submit();
        });
    </script>

</body>

</html>
