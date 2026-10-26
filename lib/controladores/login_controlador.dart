import '../modelos/usuario_modelo.dart';

// Controlador para gestionar la logica de inicio de sesion
class LoginControlador {
  // Lista de usuarios registrados de forma local
  final List<UsuarioModelo> usuarios = const [
    UsuarioModelo(
      usuario: 'admin',
      contrasena: '1234',
      nombre: 'Administrador',
    ),
    UsuarioModelo(
      usuario: 'usuario@agua.com',
      contrasena: 'agua123',
      nombre: 'Cliente Residencial',
    ),
  ];

  // Metodo para autenticar las credenciales ingresadas
  bool autenticar(String usuario, String contrasena) {
    for (final item in usuarios) {
      if (item.usuario.toLowerCase() == usuario.trim().toLowerCase() &&
          item.contrasena == contrasena.trim()) {
        return true;
      }
    }
    return false;
  }

  // Metodo para recuperar los datos del usuario si las credenciales son validas
  UsuarioModelo? obtenerUsuario(String usuario, String contrasena) {
    for (final item in usuarios) {
      if (item.usuario.toLowerCase() == usuario.trim().toLowerCase() &&
          item.contrasena == contrasena.trim()) {
        return item;
      }
    }
    return null;
  }
}
