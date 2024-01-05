import 'package:get/get_navigation/get_navigation.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'code': 'Code',
          'welcome': 'Welcome to the app',
          'input_code': 'Insert the code',
          'join_game': 'Join the game',
          'empty_qr_code': 'The QR code is empty insert one to continue',
        },
        'es_ES': {
          'code': 'Código',
          'welcome': 'Bienvenido a la aplicación',
          'input_code': 'Ingrese el código',
          'join_game': 'Unirse al juego',
          'empty_qr_code':
              'El código QR está vacío, inserte uno para continuar',
        }
      };
}
