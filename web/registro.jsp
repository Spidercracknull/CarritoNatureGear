<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Usuario</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/registrar.css">
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
                        <h3 class="card-title text-center">Registrar Usuario</h3>
                        <form action="ServletRegistro" method="Post">
                            <div class="form-group">
                                <label for="username">Nombre de usuario</label>
                                <input type="text" class="form-control" id="username"
                                    placeholder="Ingrese un nombre de usuario" name="nombre">
                                <small class="form-text text-muted">Ingrese su nombre de usuario �nico.</small>
                            </div>
                            <div class="form-group">
                                <label for="email">Correo Electr�nico</label>
                                <input type="email" class="form-control" id="email"
                                    placeholder="Ingrese su correo electr�nico" name="usuario">
                                <small class="form-text text-muted">Ingrese un correo electr�nico v�lido</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Contrase�a</label>
                                <input type="password" class="form-control" id="password"
                                    placeholder="Ingrese una contrase�a" name="password">
                                <small class="form-text text-muted">M�nimo 8 caracteres, debe contener al menos una
                                    letra may�scula, una letra min�scula y un n�mero.</small>
                            </div>
                            <div class="form-group">
                                <label for="confirm-password">Confirmar Contrase�a</label>
                                <input type="password" class="form-control" id="confirm-password"
                                       placeholder="Confirme la contrase�a" name="password2">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary btn-block" value="Registrar">
                            </div>
                            <p class="text-center">�Ya tienes una cuenta? <a href="./inicio.jsp">Iniciar sesi�n</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white py-4 mt-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Contacto</h5>
                    <p>Correos electr�nicos:<br>jaimes.jaramillo.santiago@gmail.com<br>luis.corzo.arguello@gmail.com</p>
                    <p>Tel�fonos:<br>55-2673-1610<br>123-456-7890</p>
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
                    <h6>Luis Corzo Arg�ello</h6>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>

    <script>
        document.querySelector("form").addEventListener("submit", function (event) {
            event.preventDefault();

            // Obtener los valores del formulario
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm-password").value;

            // Expresiones regulares para validaci�n
            var usernameRegex = /^[^\s@]+$/;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

            // Validar nombre de usuario
            if (!usernameRegex.test(username)) {
                Swal.fire("Error", "Nombre de usuario inv�lido", "error");
                return;
            }

            // Validar correo electr�nico
            if (!emailRegex.test(email)) {
                Swal.fire("Error", "Correo electr�nico inv�lido", "error");
                return;
            }

            // Validar contrase�a
            if (!passwordRegex.test(password)) {
                Swal.fire("Error", "Contrase�a inv�lida", "error");
                return;
            }

            // Validar confirmaci�n de contrase�a
            if (password !== confirmPassword) {
                Swal.fire("Error", "Las contrase�as no coinciden", "error");
                return;
            }

            // Si la validaci�n es exitosa, mostrar mensaje de �xito
            Swal.fire("�Registro exitoso!", "�Usuario registrado correctamente!", "success");
            this.submit();
        });
    </script>

</body>

</html>
