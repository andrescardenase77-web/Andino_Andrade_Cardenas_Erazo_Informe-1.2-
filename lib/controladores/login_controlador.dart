import '../modelos/usuario_modelo.dart';

class LoginControlador {
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

  bool autenticar(String usuario, String contrasena) {
    for (final item in usuarios) {
      if (item.usuario.toLowerCase() == usuario.trim().toLowerCase() &&
          item.contrasena == contrasena.trim()) {
        return true;
      }
    }
    return false;
  }

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
