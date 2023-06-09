function cerrarSesion() {
    Swal.fire({
        icon: 'warning',
        title: 'Cerrar Sesión',
        text: '¿Estás seguro de que deseas cerrar sesión?',
        showCancelButton: true,
        confirmButtonText: 'Sí',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                icon: 'success',
                title: 'Sesión cerrada',
                text: 'Se ha cerrado sesión exitosamente.'
            }).then(() => {
                window.location.href = 'SvUsuario?accion=cerrar';
            });
        }
    });
}