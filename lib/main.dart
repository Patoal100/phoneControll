import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_control_aplication/routes/routes.dart';
import 'package:flutter_control_aplication/config/translation.dart';
import 'package:flutter_control_aplication/config/themes.dart';
import 'package:flutter_control_aplication/utils/main_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //: Establece la orientación del dispositivo siempre en horizontal
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(const ControllApp());
  // connectionStatus.initialize();
}

class ControllApp extends StatelessWidget {
  const ControllApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control Interactivo',
      translations: Translation(),
      locale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('es', 'ES'),
      initialRoute: AppControlRoutes.qrCode,
      getPages: AppControlPages.pages,
      initialBinding: MainBinding(),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
