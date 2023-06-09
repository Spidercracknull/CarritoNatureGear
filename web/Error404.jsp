<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 404 - Pï¿½gina no encontrada</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            body {
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            body {
                background-image: url("./graficos/backgrounds/inicioB.svg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }

            .error-container {
                max-width: 500px;
                text-align: center;
            }

            .error-code {
                font-size: 72px;
                font-weight: bold;
                margin-top: 0;
            }

            .error-message {
                font-size: 24px;
                margin-bottom: 40px;
            }

            .home-link {
                color: #007bff;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <div class="error-container">
            <h1 class="error-code">Error 404</h1>
            <p class="error-message">Página no encontrada. La página que estás buscando no existe.Yo habia puesto mi recurso aquí y ya no esta</p>
            <img src="./graficos/yo-habia-ponido-mis-cosas-aqui.jpg" class="image-fluid mt-5 mb-5">
            <a href="./" class="home-link btn btn-light">Volver a la página de inicio</a>
        </div>
    </body>

</html>
