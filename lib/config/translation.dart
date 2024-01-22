import 'package:get/get_navigation/get_navigation.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'add': 'Increment items size',
          'remove': 'Reduce items size',
          'code': 'Code',
          'welcome': 'Welcome to the app',
          'input_code': 'Insert the code',
          'join_game': 'Join the game',
          'qr_code': 'Scan QR Code',
          'invalid_qr_code': 'Invalid QR Code',
          'failed_websocket_connection': 'Failed to connect to server',
          'try_again': 'Could not connect to server. Please try again.',
          'need_permission': 'You need permission to access the camera',
        },
        'es_ES': {
          'add': 'Incrementar tamaño de los items',
          'remove': 'Reducir tamaño de los items',
          'code': 'Código',
          'welcome': 'Bienvenido a la aplicación',
          'input_code': 'Ingrese el código',
          'join_game': 'Unirse al juego',
          'qr_code': 'Escanear código QR',
          'invalid_qr_code': 'Código QR inválido',
          'failed_websocket_connection': 'Fallo en la conexión con el servidor',
          'try_again':
              'No se pudo conectar con el servidor. Por favor, inténtalo de nuevo.',
          'need_permission': 'Necesita permiso para acceder a la cámara',
        }
      };
}
