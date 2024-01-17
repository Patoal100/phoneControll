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
        },
        'es_ES': {
          'add': 'Incrementar tamaño de los items',
          'remove': 'Reducir tamaño de los items',
          'code': 'Código',
          'welcome': 'Bienvenido a la aplicación',
          'input_code': 'Ingrese el código',
          'join_game': 'Unirse al juego',
          'qr_code': 'Escanear código QR',
        }
      };
}
