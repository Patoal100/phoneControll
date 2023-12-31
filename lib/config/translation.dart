import 'package:get/get_navigation/get_navigation.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'code': 'Code',
          'welcome': 'Welcome to the app',
        },
        'es_ES': {
          'code': 'Código',
          'welcome': 'Bienvenido a la aplicación',
        }
      };
}
